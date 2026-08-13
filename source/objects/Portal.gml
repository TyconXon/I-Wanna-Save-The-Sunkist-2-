#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
orangeNotBlue = false
leftNotRight = false
bulletIndex = noone
myPhysParent = noone
putLocation[0] = 0
putLocation[1] = 0
global.teleSickness = 0
t=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!instance_exists(myPhysParent)) {event_user(0);exit}
if(t<5) t+=1 else t=5
if(!object_is_ancestor(myPhysParent.object_index,MovingSolid)) exit
x = myPhysParent.x + (xstart - putLocation[1]);
y = myPhysParent.y + (ystart - putLocation[1]);
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if(global.teleSickness == 0){
    with(Portal){
        if (self.id == other.id) continue;
        move_player(self.x + (23*image_xscale), self.y + 23, 1)
    }
}
global.teleSickness = 5
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bulletIndex=other.id
other.dead = false
if(global.teleSickness == 0){
    with(Portal){
        if (self.id == other.id) continue;
        other.bulletIndex.x = self.x + (16*image_xscale)
        other.bulletIndex.y = self.y - (other.y-other.bulletIndex.y)
    }
}
global.teleSickness = 5
#define Collision_PortalOrb
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if(other.orangeNotBlue != orangeNotBlue) {event_user(0)}
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
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Fizzle effects (when parent is destroyed or player goes through fizzler)

instance_destroy();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self_ext(image_xscale,(t/5)*image_yscale,image_angle,image_blend,image_alpha)
