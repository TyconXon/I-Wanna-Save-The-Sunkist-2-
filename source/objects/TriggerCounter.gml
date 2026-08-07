#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
indexes = 0; //Indexes is an array of indexes!

inst=noone
count=0 //current position in indexes array
quick=""
index=99 //The currently triggered index
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
/*desc
Trigger Counter; calls different triggers based on the amount of times this has been triggered.
If you want to move the cursor of where this object is in the array,
change the variable 'count'. In the creation code, use arr_push("indexes",trnum)
*/
//field quick : string - Comma seperated list of event numbers, in order.
var curToken;

repeat(string_token_start(quick,",")){
    curToken = string_token_next();
    if (curToken == "") break;
    arr_push("indexes",real(curToken));
}
#define Trigger_Trap is Triggered
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var l,t,r,b,group;

if (instance_place(x,y,TriggerLock)) exit
if (_length_indexes-1==count) exit;
count+=1
index=indexes[count]
trigger(index)

/*
group=instance_place(x,y,TriggerGroup)

if (group) {
    l=group.bbox_left
    r=group.bbox_right
    t=group.bbox_top
    b=group.bbox_bottom
} else {l=0 r=0 t=0 b=0}

//destroy same color triggerlocks
with (TriggerRelay)
    if (group==instance_place(other.x,other.y,TriggerGroup) and index==other.index)
        if (x>=l && x<r && y>=t && y<b) or (!group)
            event_trigger(tr_traptriggered)

with (TriggeredFree) if (index==other.index) instance_destroy()
with (LockedTriggerFree) if (index==other.index) instance_destroy()
with (object_find("Triggered"+string(index))) instance_destroy()
with (object_find("LockedTrigger"+string(index))) instance_destroy()
*/
