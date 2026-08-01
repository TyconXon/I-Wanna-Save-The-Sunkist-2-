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

floorJump = true
airJump = true
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field inst: instance
//field floorJump: true
//field airJump: true
#define Trigger_On Player Jump
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!floorJump) exit
if (instance_place(x,y,TriggerLock)) exit
if (user_event!=noone)
    with (inst) event_user(other.user_event)
else
    with (inst) event_trigger(tr_traptriggered)
#define Trigger_On Player Djump
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!airJump) exit
if (instance_place(x,y,TriggerLock)) exit
if (user_event!=noone)
    with (inst) event_user(other.user_event)
else
    with (inst) event_trigger(tr_traptriggered)
