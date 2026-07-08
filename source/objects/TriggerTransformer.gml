#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
index=0
inst=noone
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
#define Trigger_Trap is Triggered
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var l,t,r,b,group;

if (instance_place(x,y,TriggerLock)) exit

group=instance_place(x,y,TriggerGroup)

if (group) {
    l=group.bbox_left
    r=group.bbox_right
    t=group.bbox_top
    b=group.bbox_bottom
} else {l=0 r=0 t=0 b=0}

//destroy same color triggerlocks
with (TriggerRelay)
    if (group==instance_place(x,y,TriggerGroup) and index==other.index)
        if (x>=l && x<r && y>=t && y<b) or (!group)
            event_trigger(tr_traptriggered)

with (TriggeredFree) if (index==other.index) instance_destroy()
