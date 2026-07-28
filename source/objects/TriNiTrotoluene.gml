#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
doExplosions=true
explosionSize=1
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(test_room_status() != "active") {

       var anderson;
        anderson = instance_create(x+(sprite_width/2),y+(sprite_height/2),Explosion)

        anderson.image_xscale=explosionSize
        anderson.image_yscale=anderson.image_xscale
        anderson.depth = depth - 1
        if(variable_local_exists("deathMessage")) anderson.deathMessage=deathMessage

   repeat (settings("blood")*3)
    {
        eff = instance_create(random_range(bbox_left,bbox_right), random_range(bbox_bottom,bbox_top), PropShrapnel);
            eff.speed = random_range(5, 7)*dt;
            eff.direction = random_range(0, 360);
            eff.gravity = random_range(0.08, 0.1)*dt*dt;
            eff.sprite_index=sprShard
            eff.image_xscale=2+random_range(0,2)
            eff.image_yscale=eff.image_xscale
            eff.image_blend = c_red
            eff.depth = depth + random_range(-15,100)
    }

}
#define Collision_Explosion
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(doExplosions) instance_destroy()
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field doExplosions: true
//field sprite_index: sprite
//field explosionSize: number - image_scale + 1 by default
explosionSize = image_xscale + 1
