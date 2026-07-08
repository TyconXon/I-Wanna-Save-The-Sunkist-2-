#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed=random_range(5,15)
x=random_range(0,room_width)
y=-16
image_yscale=random_range(0.5,2.5)
image_alpha=random_range(0.1,1)
depth=choose(-15,0,1005)
image_xscale=random_range(1,4)

with(SunkitRain) other.image_blend = image_blend
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(y<0) exit
instance_destroy()
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(SunkitRain)) instance_destroy()
