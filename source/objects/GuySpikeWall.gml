#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound="sndSpikeTrap"



coll=instance_create(x,y,MovingSolid)
coll.image_xscale=2
coll.image_yscale=0.25
coll.visible=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
coll.y=y-vspeed
coll.x=x-hspeed
