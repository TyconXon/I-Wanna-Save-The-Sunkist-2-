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
color=$cc0cff
#define Step_2
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
if(Player.vspeed != 0){
      murderer = true
      image_alpha = 1.0
}else{
      murderer = false
      image_alpha = 0.5
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (murderer) with (instance_place(x,y,Player)) kill_player()
