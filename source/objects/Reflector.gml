#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
reflection_cooldown = 5
dosomething = true
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=The cooldownm
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dosomething = !dosomething
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(alarm[0] != -1) {alarm[0] = reflection_cooldown;exit;}

var surf_normal;
surf_normal = image_angle+45

var angle_incidence;
angle_incidence=angle_difference(other.direction,surf_normal)

other.direction = other.direction + 2 * angle_incidence
alarm[0] = reflection_cooldown

other.dead = false
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field reflection_cooldown: number
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
