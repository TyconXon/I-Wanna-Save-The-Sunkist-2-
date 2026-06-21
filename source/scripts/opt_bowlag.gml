//snap-in

switch (argument0) {
    case opt_inpause: {
        return true
    }break
    case opt_step:{
        h=key_jump(vi_pressed)+macro_leftright(vi_pressed)
        if (h!=0) {
            //option ticked/changed
            sound_play_option("sndDJump")
            settings("bow_lag",!settings("bow_lag"))
            global.bow_lag = settings("bow_lag")
        }
    }break
    case opt_text: {
        return "Bow lag"
    }break
    case opt_value: {
        return pick(settings("bow_lag"),"Off","On")
    }break
    case opt_end:{
    }break
}
