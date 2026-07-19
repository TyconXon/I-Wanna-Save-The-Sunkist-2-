#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if(!key_jump()){
    if(bbox_top < other.bbox_top){
        y=other.y
        vspeed = 0
        djump=1
        hanging = true
        facing = -sign(other.image_xscale)
    }
}
