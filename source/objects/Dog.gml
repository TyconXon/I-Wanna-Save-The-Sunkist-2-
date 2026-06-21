#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=301
relative=0
applies_to=self
invert=0
arg0=15
arg1=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
knife_size = 1
knife_speed = 4
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var k;
xx=Player.x;
yy=Player.y;
if collision_line(x,y,xx,yy,Block,true,true) exit

k=instance_create(x+8,y+8,KnifeProjectile);
with (k) {
     image_xscale=other.knife_size;
     image_yscale=other.knife_size;
     speed=other.knife_speed*dt;
     direction=point_direction(x,y,Player.x,Player.y);
     image_angle = direction
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=301
relative=0
applies_to=self
invert=0
arg0=15
arg1=0
*/
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field knife_size: number
//field knife_speed: number

/*preview
    if (!FieldDefined("knife_size")) exit
    draw_sprite_stretched(Sprite("sprKnife"),0,x+8,y+8,knife_size,knife_size)
*/
