#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
orangeNotBlue = false
leftNotRight = false
global.teleSickness = 0
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if(global.teleSickness == 0){
    with(Portal){
        if (self.id == other.id) continue;
        move_player(self.x + (16*image_xscale), self.y + 16, 1)
    }
}
global.teleSickness = 5
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field orangeNotBlue: false
//field leftNotRight: false
/*preview
    if(orangeNotBlue){sprite_index = Sprite("sprOrangePortal")}else{sprite_index = Sprite("sprBluePortal")}
    if(leftNotRight){image_xscale = -1}
*/

if(orangeNotBlue){sprite_index = sprOrangePortal}else{sprite_index = sprBluePortal}
if(leftNotRight){image_xscale = -1}
with (Portal) {
     if (self.id == other.id || self.orangeNotBlue != other.orangeNotBlue) {continue}
     instance_destroy()
}
