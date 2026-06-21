#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
singlejump=true
doublejump=true
switchto=MoveSwitchBlockOff

ready=0
alarm[0]=5
check_crush()
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ready=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!abs(Player.hspeed)) {
    instance_create(x,y,switchto)
    instance_destroy()
}
