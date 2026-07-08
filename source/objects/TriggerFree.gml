#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
index=0
//will activate any TriggeredFree with the same index
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_place(x,y,TriggerLock)) exit
with (TriggeredFree) if (index==other.index) instance_destroy()
with (object_index) if (index==other.index) instance_destroy()
with (TriggerRelay) if (index==other.index) event_trigger(tr_traptriggered)
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field index: number
