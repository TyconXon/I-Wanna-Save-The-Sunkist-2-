#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(test_room_status() != "active") {

   sound_play_auto("sndShatter", random_range(0.95,1.05))
   repeat (5)
    {
        eff = instance_create(random_range(bbox_left,bbox_right), random_range(bbox_bottom,bbox_top), PropShrapnel);
            eff.speed = random_range(1, 3)*dt;
            eff.direction = random_range(180, 360);
            eff.gravity = random_range(0.1, 0.2)*dt*dt;
            eff.sprite_index=sprShard
            eff.image_xscale=1+random_range(0,0.5)
            eff.image_yscale=eff.image_xscale
            eff.depth = depth + random_range(-15,100)
    }

}
#define Collision_Explosion
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
