#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///instructions

execute_code="event_trigger(tr_traptriggered)"
trg=false
execute_code_timer=0
execute_code_t=0
executed=false
context=self
delay=0
deactivation_code = "event_trigger(tr_trapuntriggered)"
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with(context){execute_string(other.execute_code)}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
Define code to be executed upon triggering
*/

//field execute_code: string - by default, this activates the context
//field deactivation_code: string - by default, this deactivates the context
//f/ield execute_code_timer: number - (0=once, 1=every frame, 2=every 2 frames, etc)
//field context: instance - inst
//field context: object - object
//field delay: number
#define Trigger_Trap is Triggered
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!delay) with(context){execute_string(other.execute_code)}
else alarm[0]=delay/dt
#define Trigger_Trap Deactivated
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(self!=context)with(context){ execute_string(other.deactivation_code)}
