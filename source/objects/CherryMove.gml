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
color=$00a5ff
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
if(Player.hspeed == 0 or Player.vspeed == 0){
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
