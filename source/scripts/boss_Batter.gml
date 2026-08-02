//a boss template using the engine's builtin boss system.
//when making your own boss, duplicate and edit this script.

if (event_type==ev_other && event_number==ev_room_start) {
    //read values from any object fields defined for the boss
    exit
}

if (event_type==ev_create) {
    //initialize the boss and create any resources needed by it
    hp=30
        
        //Run with:
        possibleAttacks[0] = "prep_courage" //'Metal'. Spike barrage.
        possibleAttacks[1] = "prep_grace" //'Plastic'. Something with water
        possibleAttacks[2] = "prep_dementia" //'Smoke'. 
        possibleAttacks[3] = "prep_belief" //'Meat'. 
        
        possibleAttacks[4] = "prep_furious" //... Homerun
    
    //set this to 0 to remove the popup subtitle
    make_subtitle=1
    name="The Batter"
    subtitle="OFF" 

    lock_controls()
    sound_stop_music()
    
    instance_create(x,y,NoCaptionHere)
    
    state="starting"
    
    vulnerable=false
    flash=0
    facing=1
    
    bpm=109
    beat=4
    
    
    increment=(beat*bpm)/(global.game_speed*60)
    
    store=0
    timer=0
    sound_play_synced("peper")
    
    image_speed=dt/3
    exit
}

if (event_type==ev_draw) {
    if(state=="starting"){
       draw_sign_text(0,0,fntFileBig,c_white,"Purification in progress...",true)
    }    

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
        //first state
        if (state=="starting") {
            if (wait_frames(9*50)) {
                unlock_controls()
                vulnerable=true
                with(NoCaptionHere) instance_destroy()
                state="active"
            }
        }
        
        //attack!
    
        repeat(30) if (wait_timer(4)) if (state=="active"){
            o=instance_create_moving(x,y,CherryHoming,6*dt,point_direction(x,y,Player.x,Player.y))
        }
    }
    
}
