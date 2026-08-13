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

edgeMask = instance_create(x,y,PortalEdge)
edgeMask.image_xscale = image_xscale
edgeMask.x=x
edgeMask.solid=false

sound_play_auto_range("portal_open",2)
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with(edgeMask) instance_destroy()

make_afterimage()
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with(Platform) if(truthy("teleSickness")) teleSickness-=1;

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
// not hit the lip
/*
if(!(bbox_bottom+5 < other.bbox_bottom xor bbox_top-5 > other.bbox_top)){
   myPhysParent.solid = false
   edgeMask.solid = true
} else {myPhysParent.solid = true; edgeMask.solid=false}
*/

if(global.teleSickness == 0 /*and ( (leftNotRight and other.bbox_left < bbox_left) or (!leftNotRight and other.bbox_right > bbox_right) ) */){
    with(Player) make_afterimage();
    sound_play_auto("portal_exit1")
    with(Portal){
        if (self.id == other.id) continue;
        move_player(self.x + (23*image_xscale), self.y + 23, 1)
        sound_play_auto("portal_enter1")
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
#define Collision_Platform
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
truthy("teleSickness",0)
if(vspeed==0 and hspeed==0) exit;

//var theID;
theID = id

// hit the lip
//if(bbox_bottom > other.bbox_bottom+5 xor bbox_top < other.bbox_top-5) exit;
//if((other.hspeed>0 and other.bbox_right > bbox_right) or (other.hspeed<0 and other.bbox_left < bbox_left)) exit


if(teleSickness == 0){ with(other) { /*var theID;*/ theID = other.theID;
    with(Portal){ /*var theID;*/ theID = other.theID;
        if (self.id == other.id) continue;

        with(theID){
            with (Player) if (instance_place(x,y+2*vflip,other.id) and onPlatform) {
                other.wannaTelePlayer = true
            }
        }

        if(sign(image_xscale) == -1) (theID).x = self.x - ((theID).sprite_width)
        else {(theID).x = self.x}
        (theID).y = self.y - (other.bbox_top-(theID).bbox_top)//self.y + (32-(theID).sprite_height)

        with(theID){
           if(truthy("wannaTelePlayer")) {move_player(x+(sprite_width/2),bbox_top-2,1); wannaTelePlayer = false}
        }
    }
} }
teleSickness = 5
#define Collision_Portal
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(other.t<5) instance_destroy_other()
#define Collision_PortalOrb
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if(other.orangeNotBlue != orangeNotBlue) {event_user(0)}
#define Collision_PropShrapnel
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if(image_blend==c_white) instance_destroy()
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

repeat (settings("blood")*2)
    {
        if (!leftNotRight)
        {
        eff = instance_create(x+32, yprevious+16, PropShrapnel);
            eff.speed = random_range(1, 3)*dt;
            eff.direction = random_range(100, 190);
            eff.gravity = random_range(0.1, 0.2)*dt*dt;
            eff.sprite_index = sprWhiteDot;
            eff.image_xscale = 2;
            eff.image_yscale = 2;
            if(orangeNotBlue) eff.image_blend = c_orange
            else eff.image_blend = c_aqua
        }else {
            eff = instance_create(x-32, yprevious+16, PropShrapnel);
            eff.speed = random_range(1, 3)*dt;
            eff.sprite_index = sprWhiteDot;
            eff.image_xscale = 2;
            eff.image_yscale = 2;
            eff.direction = random_range(-10, 80);
            eff.gravity = random_range(0.1, 0.2)*dt*dt;
            if(orangeNotBlue) eff.image_blend = c_orange
            else eff.image_blend = c_aqua
        }
    }

instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self_ext(image_xscale,(t/5)*image_yscale,image_angle,image_blend,image_alpha)
