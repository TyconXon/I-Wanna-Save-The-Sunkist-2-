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
objectListener=noone
execute_code=""
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_place(x,y,TriggerLock)) exit
if (!instance_place(x,y,objectListener)) exit
giveobj = instance_place(x,y,objectListener)
if(inst =! noone){
    if (user_event!=noone)
        with (inst) {givenObject = other.giveobj;event_user(other.user_event)}
    else
        with (inst) {givenObject = other.giveobj; event_trigger(tr_traptriggered)}
}else{
      with(giveobj) execute_string(other.execute_code)
}
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
//field inst: instance - either set this or execute_code. trggrd every frame.
//field visible: false
//field sprite_index: sprite
//field objectListener: object
//field user_event: enum(trap_is_triggered,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15)
//field execute_code: string - this or isnt
