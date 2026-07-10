#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if (y+1-vspeed<=other.bbox_top+2 and vspeed>0) with(other) kill_player()
