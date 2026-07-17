#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
mytrig=noone
mylock=noone
mytarget=noone
mytargetwhenoff=noone
doBullet=true
doPlayer=false
timer=0
pressSound="sndButton"
unpressSound="sndButton"
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if( (instance_place(x,y,Player) and doPlayer) or (instance_place(x,y,Bullet) and doBullet) or instance_place(x,y,MovingSolid)){
  //restart timer
  alarm[0]=timer
  sound_play_auto(pressSound)
  exit
}
image_index=0
if(mytargetwhenoff==mytarget) {with(mytarget) { event_trigger(tr_trapuntriggered)}}
else{ with(mytargetwhenoff) event_trigger(tr_traptriggered) }
sound_play_auto(unpressSound)
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=doPlayer
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=901
applies_to=self
invert=0
arg0=0
*/
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=doBullet
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=901
applies_to=self
invert=0
arg0=0
*/
#define Collision_MovingSolid
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=901
applies_to=self
invert=0
arg0=0
*/
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field mytrig: object - child of "Triggered"
//field mylock: object - child of "TriggerLock"
//field mytarget: instance - trg direct connection
//field doPlayer: false - trigger on the player's touch
//field doBullet: true - trigger on a bullet's touch
//field pressSound: string
//field timer: number
        //field mytargetwhenoff: instance - Fires this when off
        //field unpressSound: string
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!image_index) {
    image_index=1
    if(other!=MovingSolid) sound_play_auto(pressSound)
    with (mytarget) event_trigger(tr_traptriggered)
    if(mytrig!=noone) event_perform_object(Trigger,ev_other,ev_user0)
    if(timer) alarm[0] = timer/dt
}
