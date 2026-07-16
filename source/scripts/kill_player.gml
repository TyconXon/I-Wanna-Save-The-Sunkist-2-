if (!object_is_child_of(Player)) {
   with (Player) {kill_player()}
   if(settings("killer_tint")){
        image_blend = c_red
    }
}
else if (!dead) {
    if (room==global.difficulty_room) {
        if (global.diffroom_instantrestart) {
            Player.dead=1
            room_restart()
            exit
        }
    }
    if(PlayerStart.instantRestart) {
        if(global.death_music_id) global.formerPosition = sound_get_pos(global.death_music_id)
        global.wasDead = Player.dead
        savedata_load()
        exit
    }

    if (global.debug_god or instance_place(Player.x,Player.y,NoKillZone) ) {
        if (!flashing) {
            flashing=room_speed
            sound_play_auto("item_proc_bear_01")
            //deathlist[1+deathlist[0]*2]=x
            //deathlist[2+deathlist[0]*2]=y
            //deathlist[0]+=1
        }
    } else {
        if (instance_exists(HPMode)) {
            if (!flashing) {
                HPMode.hp-=1
                flashing=HPMode.iframes
                sound_play_auto(HPMode.sound)
                emit_blood(10*settings("blood"))
            }
            if (HPMode.hp>0) exit
        }

        if (instance_exists(HitCount)) {
            if (!flashing) {
                HitCount.hits+=1
                flashing=HitCount.iframes
                sound_play_auto(HitCount.sound)
            }
        } else {
            trigger_broadcast(tr_playerdeath)
            songToPlay = global.death_music
            if (instance_exists(MusicPlayer)) if(MusicPlayer.unsyncedDeathSong!="") songToPlay = MusicPlayer.unsyncedDeathSong

            if (instance_exists(MusicPlayer)) if (MusicPlayer.deathSong!=""){
               formerPosition = sound_get_pos(global.music_instance)
               sound_pause(global.music_instance)


               global.death_music_id=sound_loop(MusicPlayer.deathSong)
               sound_set_pos(global.death_music_id,formerPosition)

            } else if (global.gameover_music==0) {
                //jingle option
                if (global.restarting_music) {
                    if (instance_exists(MusicSync)) instance_destroy_id(MusicSync)
                    else sound_stop_music()

                    global.death_music_id=sound_play(songToPlay)
                } else {
                    if (instance_exists(MusicSync)) instance_destroy_id(MusicSync)
                    else if (global.music_instance) sound_pause(global.music_instance)

                    global.death_music_id=sound_play(songToPlay)
                }
            } else if (global.gameover_music==1) {
                //fade option
                sound_fade_music(0,100,1)
            } else if (global.gameover_music==2) {
                //pause option
                sound_fade_music(0,0,1)
            } else if (global.gameover_music==3) {
                //this is the "do nothing" option
            } else if (global.gameover_music==4) {
                //slowdown
                World.slowing=1
            }

            drop_items()

            vehicle_dismount()

            if (outside_room()) sound_play_auto("fallpain1")
            else if(room==rmExp||room==rmChanged) sound_play_auto("Poison")
            else if(!irandom(10)) sound_play_auto("flesh_bloody_break")
            else sound_play_auto("sndDeath")




            with(instance_place(x,y,PlayerKiller)){
                if(settings("killer_tint")){
                    image_blend = c_red
                }
                if(variable_local_exists("deathMessage")){
                    Player.deathMessage = deathMessage
                }
                if(self.object_index == Cherry and !irandom(10)){
                    sound_play_auto("item_use_fruit_v2_01")
                    sprite_index = sprTransperry
                    Player.deathMessage = "Yum!"
                    repeat(5){
                        eff = instance_create(x, y, PropShrapnel);
                        eff.speed = random_range(1, 3)*dt;
                        eff.direction = random_range(180, 360);
                        eff.gravity = random_range(0.1, 0.2)*dt*dt;
                        eff.sprite_index=sprBlood
                        eff.image_index=irandom(eff.image_number-1)
                        eff.image_speed=0
                    }
                }
            }


            instance_create(x,y,BloodEmitter)
            instance_create(view_xcenter,view_ycenter,GameOver)

            with (FireballCherry) if (active) instance_destroy()

            Player.dead=true

            savedatap("deaths",savedatap("deaths")+1)
        }
    }
}
