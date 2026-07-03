#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
gSpeed = 20
addJump = true
image_speed = 0
active = true
timeout = 5
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
active=true
image_alpha=1
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(Player.dead or !active) exit
sound_play_auto("sndBoing")
with(IceField){
savedhspeed=999
savedvspeed=999
}
Player.vspeed=-gSpeed*dt
active=false
image_alpha = 0.5
alarm[0]=timeout
if addJump {Player.djump=1}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field gSpeed : number
//field addJump : false
//field timeout: number

if(gSpeed < 0) image_number = 1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
