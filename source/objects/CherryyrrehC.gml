#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
t = 0
mtime=room_speed
rot=25
easing = "EaseInSine"
snd = "sndDelfruitBack"
//direction = random_range(0,359)
ztrg = false
execute_code = "instance_change(CherryHoming,true)"
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (not ztrg) exit;
if(x==location.x and y==location.y) {ztrig = false;exit;}

t=approach(t,mtime,1)
x=ease(t,0,mtime,xstart,location.x,easing)
y=ease(t,0,mtime,ystart,location.y,easing)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
   2 state cherry. When activated, moves to the given position,
   and when deactivated, triggers the regular trap event.
   (Which by default, flings itself to the player)
*/

//field location: instance - The target the cherry wants to go to
//field mtime: number - in frames
//f/ield rot: number
//field easing: enum("EaseLinear","EaseInSine","EaseOutSine","EaseInOutSine","EaseInQuad","EaseOutQuad","EaseInOutQuad","EaseInCubic","EaseOutCubic","EaseInOutCubic","EaseInQuart","EaseOutQuart","EaseInOutQuart","EaseInQuint","EaseOutQuint","EaseInOutQuint","EaseInCirc","EaseOutCirc","EaseInOutCirc","EaseInBack","EaseOutBack","EaseInOutBack")
//field snd: string
//field below_is_on_untrigger: value
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Trigger_Trap is Triggered
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ztrg = true
sound_play_auto(snd)
#define Trigger_Trap Deactivated
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_perform_object(Trap,ev_trigger,tr_traptriggered)
