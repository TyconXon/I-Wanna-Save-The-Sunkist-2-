#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
knife_size = 1
knife_speed = 4
spawnject = Cherry
spawnstance = noone
dir = 0
interval = 15
spawnrot = 0
spawndev = 0
deviation = 0
doHealth = false
health = 0

blood=settings("blood")
setting=settings("bloodcoll")
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var k;
spawner = self
curinterval = interval + random(deviation)
curangle = spawndir + random(spawndev)
alarm_set(0,curinterval)
if(trg==false)exit;

if(spawnstance == noone){
    k=instance_create(x+(sprite_width/2),y+(sprite_height/2),spawnject);
    with (k) {
         image_xscale=other.knife_size;
         image_yscale=other.knife_size;
         speed=other.knife_speed*dt;
         direction=other.spawndir;
    }
}else{
    with(spawnstance){
        spawner = other

        k=instance_copy(true)
        k.x=spawner.x
        k.y=spawner.y
        k.speed=spawner.knife_speed
        k.direction=spawner.spawndir

    }
}

spawndir = spawndir + spawnrot
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_blend = c_white
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with(other){instance_destroy();}
alarm_set(1,5)
if(!trg) {image_blend = c_gray;exit;}
if(!doHealth) exit;
health-=1;
image_blend = c_red;
with(other){emit_prop_blood(8*settings("blood"))}
if(health < 1) instance_destroy();
#define Other_0
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
//field knife_size: number
//field knife_speed: number
//field spawnject: object
//field spawnstance: instance

//field spawndir: angle
//field spawnrot: angle
//field spawndev: angle

//field interval: number
//field deviation: number
//field sprite_index: sprite
//field doHealth: false
    //field health: number

alarm_set(0,interval)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Other_8
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Trigger_Trap is Triggered
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
