#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=902
applies_to=self
invert=0
arg0=Gizmo
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

if (global.use_original_cherries) image_speed=mmf_animspeed(20)*dt
else image_speed=(1/15)*dt

vsp=8
sound="sndMegaDelfruit"
ang=0
color=$f3
murderer=true
active=true
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
active=murderer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=902
applies_to=self
invert=0
arg0=Gizmo
*/
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=902
applies_to=self
invert=0
arg0=Gizmo
*/
#define Collision_Explosion
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=902
applies_to=self
invert=0
arg0=Gizmo
*/
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=902
applies_to=self
invert=0
arg0=Gizmo
*/
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=902
applies_to=self
invert=0
arg0=Gizmo
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field active: false - Start actively murdering player

if(image_blend!=c_white)color = image_blend
#define Other_8
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=902
applies_to=self
invert=0
arg0=Gizmo
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if (global.use_original_cherries)
    ang=mean(ang,floor(image_index)*10)
else
    ang=mean(ang,floor(1-image_index)*10)

draw_cherry(x,y,image_xscale,image_yscale,ang,color)
#define Trigger_Trap is Triggered
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=902
applies_to=self
invert=0
arg0=Gizmo
*/
#define Trigger_On Player Death
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=902
applies_to=self
invert=0
arg0=Gizmo
*/
#define Trigger_Trap Deactivated
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=902
applies_to=self
invert=0
arg0=Gizmo
*/
