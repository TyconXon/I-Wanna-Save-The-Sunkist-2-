#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
vsp=mmf_speed(70)
#define Collision_TrapStop
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=do nothing
*/
#define Collision_AnyWater
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visible=false
other.image_blend = c_yellow

if(instance_place(Player.x,Player.y,other)){
   kill_player()
}else{
      other.image_blend = c_white
}
#define Trigger_Trap is Triggered
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
visible=1
sound_play_auto('sndBolt')
