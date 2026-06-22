#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
murderer=false
color=$5a5a5a
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(key_jump() || key_left() || key_right() || key_up() || key_down()){
      murderer = true
      image_alpha = 1.0
}else{
      murderer = false
      image_alpha = 0.5
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (murderer) with (instance_place(x,y,Player)) kill_player()
