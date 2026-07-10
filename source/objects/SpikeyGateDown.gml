#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if (vspeed-other.vspeed<0 && y-vspeed>=other.bbox_bottom-2 and vspeed < 0) with(other) kill_player()
