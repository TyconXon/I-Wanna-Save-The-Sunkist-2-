#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
shaketime=25
pulltile=true
pulledtile=noone
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(test_room_status() != "active") {

   sound_play_auto("sndBlockBreak", random_range(0.8,1.2))
   repeat (settings("blood")*2)
    {
        eff = instance_create(random_range(bbox_left,bbox_right), random_range(bbox_bottom,bbox_top), PropShrapnel);
            eff.speed = random_range(1, 3)*dt;
            eff.direction = random_range(180, 360);
            eff.gravity = random_range(0.1, 0.2)*dt*dt;
            eff.sprite_index=sprShard
            eff.image_blend = c_black
            eff.image_xscale=2+random_range(0,2)
            eff.image_yscale=eff.image_xscale
    }

}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!alarm[0]) alarm[0]=shaketime/dt
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field shaketime: number
//field sprite_index: sprite

if(pulltile) pulledtile = tile_find_anywhere(x,y)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(alarm[0]<=0) {draw_self(); exit}
var a,b;

if (alarm[0] mod 4 < 2) {
    a=xstart-1
    b=ystart-1
} else {
    a=xstart+1
    b=ystart+1
}
draw_sprite(sprite_index,image_index,a,b)
