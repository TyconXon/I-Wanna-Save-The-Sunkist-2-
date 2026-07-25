//template for option snap-ins
//you can duplicate this to add your own options to the engine
//remember to add it to custom_options() (it's in the CUSTOM folder)

switch (argument0) {
    case opt_inpause: {
        //whether this option snap-in is available in the pause menu as well as the main menu
        return true
    }break
    case opt_begin:{
        //called on create of the menu object
        //you can initialize variables here
    }break
    case opt_step:{
        //here are some common types of options to get you started (use only one of them lol)

        //option ticked/changed once
        //(use only one of those)
        h=key_jump(vi_pressed)+macro_leftright(vi_pressed)
        if (h!=0) {
            sound_play_option("sndDJump")

            cur_value=settings("ghost")

            //list of 3 options
            settings("ghost",modwrap(cur_value+h,0,3))
        }
    }break
    case opt_text: {
        //text that draws on the left side of the menu
        return ">Player ghost"
    }break
    case opt_value: {

        //list of options
        return pick(settings("ghost"),"Off","On","On, no collision")

    }break
    case opt_end:{
        //called when the option is deselected
        //you can destroy any effects here
    }break
}
