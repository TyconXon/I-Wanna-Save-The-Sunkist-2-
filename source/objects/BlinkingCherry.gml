#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if (global.use_original_cherries) image_speed=mmf_animspeed(20)*dt
else image_speed=1/15

destroy_outside=1
sound="sndDelfruit"
murderer=false

timer = 25
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index = sprTransperry
murderer=false
alarm[1]=timer
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index = sprCherry
murderer=true
alarm[0]=timer
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (murderer) if (instance_place(x,y,Player)) kill_player()
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (destroy_outside) instance_destroy()
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field timer: number

alarm[0] = timer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
