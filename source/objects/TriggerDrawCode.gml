#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///instructions

execute_code="draw_self_inverted2()"
triggered=false
execute_code_timer=0
execute_code_t=0
executed=false
context=self
delay=0
deactivation_code = "event_trigger(tr_trapuntriggered)"
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
Defined code will run every draw-event while triggered
*/

//field execute_code: string
//field deactivation_code: string - by default, this deactivates the context
//field execute_code_timer: number - (0=once, 1=every frame, 2=every 2 frames, etc)
//field context: instance - inst
//field context: object - object
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!triggered) exit

with(context){execute_string(other.execute_code)}
#define Trigger_Trap is Triggered
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
triggered=true
#define Trigger_Trap Deactivated
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(self!=context){
                  with(context){execute_string(other.deactivation_code)}
                  triggered=false
}
