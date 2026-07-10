#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if (x-hspeed>=other.bbox_right-2 and hspeed < 0) with(other) kill_player()
