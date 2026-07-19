#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/

if(!key_jump() ){
    if(bbox_top < other.bbox_top ){
        hanging = true
    }
}
if(hanging){

    y=other.y
    vspeed = other.vspeed
    hspeed = other.hspeed
    djump=1
    facing *= -1
}


if( key_jump() && ((key_left() and other.image_xscale > 0) || ( key_right()) and other.image_xscale < 0 )){
        hanging = false
        hspeed=3
        vspeed=-9*vflip
        walljumpboost=4
        walljumpdir=facing

}
