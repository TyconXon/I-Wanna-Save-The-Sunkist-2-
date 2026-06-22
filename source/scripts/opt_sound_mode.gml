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
            global.iwbtg_sound_mode = settings("iwbtg_sound_mode",!settings("iwbtg_sound_mode"))

            if (global.iwbtg_sound_mode) {
                global.gain=1
                sound_effect_options(sound_kind_effect(0,se_gargle),0,0.5)
                sound_effect_options(sound_kind_effect(1,se_gargle),0,0.5)
                sound_effect_options(sound_kind_effect(3,se_gargle),0,0.5)
            }else{
                global.gain=0.7
                sound_effect_options(sound_kind_effect(0,se_gargle),0,0)
                sound_effect_options(sound_kind_effect(1,se_gargle),0,0)
                sound_effect_options(sound_kind_effect(3,se_gargle),0,0)
            }
            sound_global_volume(global.gain)
        }
        image_blend = c_yellow
    }break
    case opt_text: {
        return "Sound Mode"
    }break
    case opt_value: {
        return pick(settings("stereomode"),"Mono","Stereo") + pick(settings("iwbtg_sound_mode"),""," (guy)")
    }break
    case opt_end:{
         image_blend = c_white
    }break
}
