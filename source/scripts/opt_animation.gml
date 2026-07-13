//snap-in for animation toggle

switch (argument0) {
    case opt_inpause: {
        return true
    }break
    case opt_step:{
        h=macro_leftright(vi_pressed)
        if (h!=0) {
            //option ticked/changed
            sound_play_option("sndDJump")
            settings("anim",!settings("anim"))
        }
        if (settings("anim")) sprite=sprPlayerRunning
        else sprite=sprPlayerRunningOld

        if(key_jump(vi_pressed)){
            sound_play_option("switch")
            settings("hundredfps",!settings("hundredfps"))

        }
        if(settings("hundredfps")) global.game_speed=100
        else global.game_speed=50

        image_speed=0.5*50/room_speed
        image_blend = c_yellow
    }break
    case opt_text: {
        return "Animations"
    }break
    case opt_value: {
        return pick(settings("anim"),"Fangames","Original") + pick(settings("hundredfps"),""," (100fps)")
    }break
    case opt_end:{
        sprite=sprPlayerIdle
        image_speed=0.2
        image_blend = c_white
    }break
}
