#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(test_room_status() != "active") {

   sound_play_auto("sndShatter")
   repeat (5)
    {
        eff = instance_create(random_range(bbox_left,bbox_right), random_range(bbox_bottom,bbox_top), PropShrapnel);
            eff.speed = random_range(1, 3)*dt;
            eff.direction = random_range(180, 360);
            eff.gravity = random_range(0.1, 0.2)*dt*dt;
            eff.sprite_index=sprShard

    }

}
