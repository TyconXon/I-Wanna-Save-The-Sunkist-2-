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
            settings("killer_tint",!settings("killer_tint"))
        }
    }break
    case opt_text: {
        return "Killer tint"
    }break
    case opt_value: {
        return pick(settings("killer_tint"),"Off","On")
    }break
    case opt_end:{
    }break
}
