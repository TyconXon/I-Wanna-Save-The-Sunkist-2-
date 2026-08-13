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
image_speed = 0.40*dt
#define Collision_GibParticle
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
#define Collision_Blood
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*
if(irandom(2)!=1) exit;
var r, g, b;
r = color_get_red(image_blend)
g = color_get_green(image_blend)
b = color_get_blue(image_blend)

r = min(r+1,255)
g = max(g-1,100)
b = max(b-1,100)
image_blend = make_color_rgb(r,g,b)
*/
#define Collision_Portal
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
