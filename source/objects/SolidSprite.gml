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
destroyOnTouch = false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=902
applies_to=self
invert=0
arg0=Gizmo
*/
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(destroyOnTouch) instance_destroy()
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
action_id=603
applies_to=self
*/
//field image_speed: number
//field sprite_index: sprite
//field solid: true
    //field destroyOnTouch: false

/*preview
    if (!FieldDefined("sprite_index")) exit
    draw_sprite_stretched(sprite_index,0,x,y,image_xscale,image_yscale)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=902
applies_to=self
invert=0
arg0=Gizmo
*/
#define Other_8
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=902
applies_to=self
invert=0
arg0=Gizmo
*/
#define Trigger_Trap is Triggered
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=902
applies_to=self
invert=0
arg0=Gizmo
*/
