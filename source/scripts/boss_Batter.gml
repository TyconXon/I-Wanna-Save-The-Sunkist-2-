if (event_type==ev_other && event_number==ev_room_start) {
    //read values from any object fields defined for the boss
    exit
}

if (event_type==ev_create) {
    //initialize the boss and create any resources needed by it
    hp=50

        //Run with:
        att_courage = "Run with COURAGE." //'Metal'. Spike barrage.
        att_grace = "Run with GRACE." //'Plastic'. Something with water
        att_dementia = "Run with DEMENTIA." //'Smoke'. Perhaps a visibility difficulty?
        att_belief = "Running with BELIEF." //'Meat'. Perhaps something to do with enemies? Maybe a few beasts spawn around the arena and the batter charges towards them and explodes them into projectiles.

        att_furious = "Running a FURIOUS HOMERUN." //... Homerun

    //set this to 0 to remove the popup subtitle
    make_subtitle=1
    name="The Batter"
    subtitle="OFF"

    lock_controls()
    //sound_stop_music()

    instance_create(x,y,NoCaptionHere)

    state="starting"
    //States: possibleAttacks[..5], "starting", "won", "active"

    vulnerable=false
    flash=0
    facing=1

    bpm=109
    beat=4

    oldthing = 4


    alreadydid = false

    increment=(beat*bpm)/(global.game_speed*60)

    store=0
    timer=0
    //sound_play_synced("peper")

    currentText = "Purification in progress..."

    image_speed=dt/3
    exit
}

if (event_type==ev_draw) {
    //if(state=="starting"){
       draw_sign_text(64,64,fntFileBig,c_white,currentText,true)
    //}

    image_xscale=facing*2
    draw_self()

    exit
}

if (event_type==ev_destroy) {
    //perform cleanup of any resources allocated for the boss
    //(surfaces, data structures, shaders etc.)
    exit
}

if (event_type==ev_step) {
    //Avoidance
    store+=increment
    inc=round(store)
    store-=inc

    oldtimer=timer
    timer+=inc

    current_timer=0

    //do damage
    with (instance_place(x,y,Player)) kill_player()

    //check victory condition
    if (Player.dead) state="won"
    if (state=="won") {
        speed=0
        image_alpha=1
        background_blend[0] = c_white
        with(Water3) image_blend = c_gray
        currentText = "Adversaries purified."
        exit
    }

    //take damage
    with (instance_place(x,y,Bullet)) with (other) {
        instance_destroy_other()
        if (vulnerable){
            hp-=1
            if (hp<=0) {
                //defeated
                background_blend[0] = c_white
                with(Water3) {image_blend = c_black;image_speed=0}
                with(AvoidanceBullet){instance_destroy()}

                sound_stop_music()
                sound_play_auto("Bite")
                with(Spinner)instance_destroy()
                background_hspeed[0] = 0
                instance_create(xstart,ystart,Item3)
                instance_create(xstart,ystart-32,WarpToHub)
                instance_destroy()
            } else {
                sound_play_auto(choose("strike","strike2","strike3"))
                vulnerable=false
                flash=15
                image_alpha=0.5
                with(Water3){
                  image_blend = make_color_hsv(color_get_hue(image_blend),clamp((other.hp/50)*255,0,255), color_get_value(image_blend) )
                }
                if(facing == -1){
                          x-=3
                }else x +=3


                if(speed!=0){
                             if(state==att_belief) {speed/=1.8;sound_play_auto("UI_crit_v3_01")}
                             else if(state==att_furious) {speed *= 2;flash=5; sound_play_auto("bison_charge_attack_start_01")}
                }
            }
        }
    }

    //flashing
    if (flash) {
        flash-=1
        if (!flash) {
            vulnerable=true
            image_alpha=1
        }
    }
    if(direction_to_object(Player)<90 or direction_to_object(Player)>270) facing=-1
    else facing = 1

    //main boss state machine
    {
    /*
        repeat(30) if (wait_timer(4)) if (state=="active"){
            o=instance_create_moving(x,y,CherryHoming,6*dt,point_direction(x,y,Player.x,Player.y))
        }
        */
        //first state
        if (state=="starting") {
            if (wait_frames(1*50)) {
                unlock_controls()
                vulnerable=true
                with(NoCaptionHere) instance_destroy()
                state="active"
                currentText="..."
                sound_play_auto("assets_sounds_outsourced_OFF_00 - flash2")
            }
        }else if(state=="waiting"){
                currentText="..."
                if(abs(x-xstart)>=64 || abs(y-ystart)>=64) sound_play_auto("lowtele")
                with(Water3){
                    if(abs(y-ystart)>=64) sound_play_auto("lowtele")
                    y=ystart
                }
                x=xstart
                y=ystart
                alreadydid = false
                image_speed=dt/3
                speed=0
              if(wait_frames(1*50)) {state="active"}
        }
        else if(state=="active"){
               if(currentText == "..."){
                              sound_play_auto("lightswitch2")
                              newthing = irandom_fresh(oldthing,0,4)
                              currentText = pick(newthing, att_courage, att_dementia, att_grace, att_belief, att_furious)
                              oldthing = newthing
               }
           if(wait_frames(2*50)){
              sound_play_auto("flashlight1")
              state = currentText
           }
        } else{
          switch (state)
                 {
                     case att_courage:
                          if(x<room_width/2) {x+=5;y-=1}

                          image_speed=0
                          ri = irandom(15) + 5
                          if(!alreadydid){
                              for (i=0; i<30; i+=1){
                                        proxtochosen = abs(i-ri)
                                         with(instance_create((i * 40),-30,AvoidanceBullet)){
                                              proxtochosen = other.proxtochosen
                                              tag = "courage";
                                              gravity=(0.005 * proxtochosen * (0.5 * proxtochosen)) + 0.01;
                                              sprite_index = sprSpike;
                                              image_angle=0;
                                         }
                                         with(instance_create((i * 40),room_height-62,AvoidanceBullet)){
                                              proxtochosen = other.proxtochosen
                                              tag = "courage";
                                              gravity=(-0.005 * proxtochosen * (0.5 * proxtochosen)) - 0.01;
                                              sprite_index=sprSpikeUp;
                                              image_angle=0;
                                         }
                              }
                          }
                            alreadydid = true

                           if(wait_frames(50*5)){
                             state="waiting";
                             }
                           break;
                     case att_grace:
                          with(Water3){
                              y = approach(y,0+128,3)
                          }
                          y=approach(y,Player.y,5)
                          ri = irandom(10) + 10
                          if(!alreadydid){
                              for (i=0; i<30; i+=1){
                                        proxtochosen = abs(i-ri)
                                         with(instance_create(room_width-2,i*(room_height/32),AvoidanceBullet)){
                                              proxtochosen = other.proxtochosen
                                              tag = "courage";
                                              gravity=(0.005 * proxtochosen * (0.5 * proxtochosen)) + 0.02;
                                              gravity_direction=180
                                              sprite_index = sprCherryAzure;
                                              image_speed=1/15
                                              image_angle=0;
                                         }
                              }
                          }
                          alreadydid = true
                          if(wait_frames(50*5)){
                             state="waiting";
                          }
                          break;
                     case att_dementia:
                          x=xstart+16
                          image_speed=0
                          if(wait_frames(25)){
                                              sound_play_auto("item")
                                          i = instance_create(x-16,y-16,AvoidanceBullet)
                                         i.tag = "dementia"
                                         i.sprite_index = sprBomb
                                         i.color = c_white
                                         i.direction= direction_to_object(Player) + (irandom(80)-40)
                                         i.gravity=0.1
                                         i.speed=6+irandom(6)

                          }
                          if((hp/50)>0.5){
                              if(wait_frames(50*5)){
                                 state="waiting";
                              }
                          }else{
                                if(wait_frames(50*8)){
                                 state="waiting";
                              }
                          }
                          break;
                     case att_belief:
                          if(speed==0) speed=1
                          else speed += 0.08
                          direction=direction_to_object(Player)

                          if(wait_frames(50*5)) state="waiting";
                          break;
                      case att_furious:
                          if(speed==0) speed=1.25
                          else speed += 0.01
                          direction=approach_angle(direction,direction_to_object(Player),10)


                           if(wait_frames(50*5)) state="waiting";
                           break;

                     default: break;
                 }

        }
    }

}
