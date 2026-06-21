//snap-in for sound mode

switch (argument0) {
    case opt_inpause: {
        return true
    }break
    case opt_begin:{
    }break
    case opt_step:{
        h=macro_leftright(vi_pressed)
        if (h!=0) {
            sound_play_option("sndDJump")
            settings("stereomode",!settings("stereomode"))
        }
        if(key_jump(vi_pressed)){
            sound_play_option("switch")
            settings("iwbtg_sound_mode",!settings("iwbtg_sound_mode"))
        }
    }break
    case opt_text: {
        return "Sound Mode"
    }break
    case opt_value: {
        return pick(settings("stereomode"),"Mono","Stereo") + pick(settings("iwbtg_sound_mode"),""," (guy)")
    }break
    case opt_end:{
    }break
}
