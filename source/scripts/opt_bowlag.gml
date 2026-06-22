//snap-in

switch (argument0) {
    case opt_inpause: {
        return true
    }break
    case opt_step:{
        h=macro_leftright(vi_pressed)
        if (h!=0) {
            //option ticked/changed
            sound_play_option("sndDJump")
            settings("bow_lag",!settings("bow_lag"))
            global.bow_lag = settings("bow_lag")
        }
        if(key_jump(vi_pressed)){
            sound_play_option("switch")
            settings("afterimage",!settings("afterimage"))
        }
        image_blend = c_yellow
    }break
    case opt_text: {
        return "Bow lag"
    }break
    case opt_value: {
        return pick(settings("bow_lag"),"Off","On") + pick(settings("afterimage"),""," (player afterimage)")
    }break
    case opt_end:{
    image_blend = c_white
    }break
}
