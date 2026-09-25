if (event_type==ev_other && event_number==ev_room_start) {
    //read values from any object fields defined for the boss
    exit
}

if (event_type==ev_create) {
    //initialize the boss and create any resources needed by it
    hp=30

        //Run with:
        att_courage = "Running with COURAGE." //'Metal'. Spike barrage.
        att_grace = "Running with GRACE." //'Plastic'. Something with water
        att_dementia = "Running with DEMENTIA." //'Smoke'. Perhaps a visibility difficulty?
        att_belief = "Running with BELIEF." //'Meat'. Perhaps something to do with enemies? Maybe a few beasts spawn around the arena and the batter charges towards them and explodes them into projectiles.

        att_furious = "Charging a FURIOUS HOMERUN." //... Homerun

    //set this to 0 to remove the popup subtitle
    make_subtitle=1
    name="The Batter"
    subtitle="OFF"

    lock_controls()
    sound_stop_music()

    instance_create(x,y,NoCaptionHere)

    state="starting"
    //States: possibleAttacks[..5], "starting", "won", "active"

    vulnerable=false
    flash=0
    facing=1

    bpm=109
    beat=4


    increment=(beat*bpm)/(global.game_speed*60)

    store=0
    timer=0
    sound_play_synced("peper")

    currentText = "Purification in progress..."

    image_speed=dt/3
    exit
}

if (event_type==ev_draw) {
    //if(state=="starting"){
       draw_sign_text(0,0,fntFileBig,c_white,currentText,true)
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
        exit
    }

    //take damage
    with (instance_place(x,y,Bullet)) with (other) {
        instance_destroy_other()
        if (vulnerable){
            hp-=1
            if (hp<=0) {
                //defeated
                sound_play_auto("sndDeath")
                instance_destroy()
            } else {
                sound_play_auto("sndBossHit")
                vulnerable=false
                flash=25
                image_alpha=0.5
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
            }
        } else if(state=="active"){
               currentText = choose(att_courage, att_grace, att_dementia, att_belief, att_furious)
           if(wait_frames(5*50)){
              state = currentText
           }
        } else{
          switch (state)
                 {
                     case att_courage:
                          ri = irandom(15) + 5
                          for (i=0; i<30; i+=1){
                                     with(instance_create((i * 40),0,AvoidanceBullet)){
                                          tag = "courage";
                                          gravity=0.005 * abs(other.i-other.ri) + 0.01;
                                          image_angle=0;
                                          sprite_index = sprSpike;
                                     }
                                     with(instance_create((i * 40)-8,room_height-32,AvoidanceBullet)){
                                          tag = "courage";
                                          gravity=-0.005 * abs(other.i-other.ri) - 0.01;
                                          sprite_index=sprSpikeUp;
                                          image_angle=0;
                                     }/*
                                      with(instance_create(room_width*irandom(1),(i*32),AvoidanceBullet)){
                                          tag = "courage";
                                          if(x==0){
                                                   hspeed=3
                                                   sprite_index=sprSpikeRight;
                                          }else{
                                              hspeed=-3
                                              sprite_index=sprSpikeLeft;
                                              }
                                      }*/
                          }


                           break;
                     case att_grace:
                          break;
                     case att_dementia:
                          break;
                     case att_belief:

                          break;
                      case att_furious:
                           break;

                     default: break;
                 }
                   state="active"
        }
    }

}
