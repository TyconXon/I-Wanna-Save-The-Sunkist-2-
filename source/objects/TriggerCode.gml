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
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!trg) exit
if (execute_code!="") {
    if (execute_code_timer==0) {
        if (!executed) {executed=1 execute_string(execute_code)}
    } else if (execute_code_t mod execute_code_timer==0) execute_string(execute_code)
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
#define Trigger_Trap is Triggered
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
trg=true
