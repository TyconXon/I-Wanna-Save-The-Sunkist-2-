#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
gSpeed = 20
addJump = true
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(other.dead == true) exit
sound_play_auto("sndBoing")
other.vspeed=-gSpeed*dt
if addJump {other.djump=1}
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
//field gSpeed : number
//field addJump : true
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
