#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
index=0
image_index=0
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

image_index=1
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
Conditional Trigger.
*/
//field index: number
#define Other_10
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
with (mylock)
    if (group==instance_place(x,y,TriggerGroup))
        if (x>=l && x<r && y>=t && y<b) or (!group)
            instance_destroy()

//fire same color triggers
with (mytrig)
    if (group==instance_place(x,y,TriggerGroup))
        if (x>=l && x<r && y>=t && y<b) or (!group)
            if (!instance_place(x,y,TriggerLock))
                instance_destroy()
with(TriggerRelay){
    if(index==real(string_number(object_get_name(other.mytrig)))) event_trigger(tr_traptriggered)
}

//don't destroy button triggers!
if (!object_is_child_of(Button))
    with (object_index) if (group==instance_place(x,y,TriggerGroup))
        if (x>=l && x<r && y>=t && y<b) or (!group)
            if (!instance_place(x,y,TriggerLock)) instance_destroy()
