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
falseLastFrame=false
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
if(Player.hspeed == 0){
      if(!falseLastFrame){
      murderer = true
      image_alpha = 1.0
      }
      falseLastFrame=false
}else{
      falseLastFrame=true
      murderer = false
      image_alpha = 0.5
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (murderer) if (instance_place(x,y,Player)) kill_player()
