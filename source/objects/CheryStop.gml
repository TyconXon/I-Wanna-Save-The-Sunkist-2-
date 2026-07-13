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
color=$ffa500
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
if(Player.hspeed != 0){
      murderer = true
      image_alpha = 1.0
      exit
}
with(Player) {if(instance_place(x,y+1,MovingSolid)) if(instance_place(x,y+1,MovingSolid).hspeed != 0){
      other.murderer = true
      other.image_alpha = 1.0
      exit
}}



murderer = false
image_alpha = 0.5
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (murderer) if (instance_place(x,y,Player)) kill_player()
