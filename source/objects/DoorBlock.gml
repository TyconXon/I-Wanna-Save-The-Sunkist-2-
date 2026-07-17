#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
ready=false
killcheck=true
toggle=true
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (killcheck) {
    with (Player) if (instance_place(x,y,other.id)) kill_player()
    killcheck=false
}
image_index = !solid
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field solid: bool
//field toggle: true
#define Trigger_Trap is Triggered
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (ready and toggle) {
   solid=!solid
   if(solid) killcheck=true
}else if (ready){solid=true;killcheck=true}
#define Trigger_Trap Deactivated
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!ready) exit

solid=false
killcheck=false
