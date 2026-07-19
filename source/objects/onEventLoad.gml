#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
mylock=noone
mytrig=noone
inst=noone

user_event=noone
trap_is_triggered=noone
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field inst: instance
#define Trigger_On Load
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_place(x,y,TriggerLock)) exit
if (user_event!=noone)
    with (inst) event_user(other.user_event)
else
    with (inst) event_trigger(tr_traptriggered)
