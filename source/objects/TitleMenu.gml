#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (input_anykey_pressed()) {
    if (room=rmTitle && keyboard_key!=vk_escape && keyboard_key!=vk_f11 && keyboard_key!=vk_escape && keyboard_key!=vk_alt) {
        room_goto_next()
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
chosenSplash = splashtexts()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_halign(1)
draw_set_font(fntFileSmall)
draw_text(global.width/2,40,chosenSplash);
