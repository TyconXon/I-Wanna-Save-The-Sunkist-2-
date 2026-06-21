#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 0
image_index = 0
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!global.teleSickness){
    with(Portal){
        if (self == me) continue
        other.x = self.x
        other.y = self.y

    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field orangeNotBlue: false
/*preview
    if(self.orangeNotBlue){image_index = 2}else{image_index = 1}
*/
with (PortalOrange) {
     if (self != other) {instance_destroy()}
}
