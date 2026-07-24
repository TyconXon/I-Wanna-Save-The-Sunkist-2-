#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
index=0
inst=noone
untrigger = false
//will activate any TriggeredFree with the same index
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=425
*/
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field index: number
//field inst: instance
//field untrigger: false
#define Trigger_Trap is Triggered
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if(!untrigger) with (inst) event_trigger(tr_traptriggered)
else with(inst) event_trigger(tr_trapuntriggered)
