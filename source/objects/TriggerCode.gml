#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///instructions

execute_code=""
trg=false
execute_code_timer=0
execute_code_t=0
executed=false
context=self
delay=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
trg=true
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!trg) exit
if (execute_code!="") {
    if (execute_code_timer==0) {
        if (!executed) {executed=1 with(context){execute_string(other.execute_code)}}
    } else if (execute_code_t mod execute_code_timer==0) with(context){execute_string(other.execute_code)}
    execute_code_t+=1
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
Define code to be executed upon triggering
*/

//field execute_code: string
//field execute_code_timer: number - (0=once, 1=every frame, 2=every 2 frames, etc)
//field context: instance
//field delay: number
#define Trigger_Trap is Triggered
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!delay) trg=true
else alarm[0]=delay/dt
