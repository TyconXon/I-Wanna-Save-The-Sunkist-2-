#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_exists(Player)) alarm[0]=40/(global.slomo*dt)
else alarm[0]=40/dt
dead=instance_place(x,y,BulletBlock)
image_speed=0

storex=1
storey=1
storea=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///stretch bullet mask
image_angle=direction+180
storex=image_xscale
storey=image_yscale
storea=image_angle
image_xscale=speed
image_yscale=2
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//reset bullet mask
image_xscale=storex
image_yscale=storey
image_angle=storea

//we schedule bullet destroy to make sure it hits things on the frame it hits a wall
if (dead) instance_destroy()
#define Collision_BulletBlock
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Collision_Block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (object_is_ancestor(other.object_index,ShootBlock) or other.object_index == ShootBlock or other.object_index == MetalSurface or dead) {event_user(0) exit}
//if(instance_place(x,y,Portal)) if((instance_place(x,y,Portal)).orangeNotBlue != orangeNotBlue) event_user(0) exit

if (other.solid) {
    var theY;

    if(other.sprite_height == 32) theY = other.y
    else if(other.sprite_height < 32) {event_user(0) exit}
    else {
       theY = floorto(y,8)-16
       if(theY<other.bbox_top) theY=other.y
       if(theY+32>other.bbox_bottom) theY=other.bbox_bottom-32
       if(instance_position(x,y+4,Block)) theY-=4
    }

    dead=1
    xprevious=x+hspeed
    yprevious=y+vspeed

    if(instance_place(other.x,theY, Portal) != noone) {if((instance_place(other.x,theY,Portal)).orangeNotBlue != orangeNotBlue) {event_user(0) exit}}

    newPortal = instance_create(other.x, theY, Portal)
    newPortal.orangeNotBlue = self.orangeNotBlue
    newPortal.myPhysParent = other.id
    newPortal.putLocation[0] = other.x
    newPortal.putLocation[1] = other.y

    if (x>=other.bbox_right) {
        newPortal.leftNotRight = true;
        newPortal.image_xscale = -1
        newPortal.x = other.bbox_right + ( 32)
    } else {
        newPortal.leftNotRight = false;
        newPortal.x = other.bbox_left - ( 32)
    }

    with (newPortal){
        xstart = x; ystart = y;
        if(orangeNotBlue){sprite_index = sprOrangePortal}else{sprite_index = sprBluePortal}
        with (Portal) {
             if (self.id == other.id || self.orangeNotBlue != other.orangeNotBlue) {continue}
             instance_destroy()
        }
    }


}
#define Collision_Portal
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(other.orangeNotBlue != orangeNotBlue) event_user(0)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Portal orb is destroyed
sound_play_auto("portal_invalid_surface3")

repeat (settings("blood")*2)
    {
        if (hspeed > 0)
        {
        eff = instance_create(x-8, yprevious, PropShrapnel);
            eff.speed = random_range(1, 3)*dt;
            eff.direction = random_range(100, 190);
            eff.gravity = random_range(0.1, 0.2)*dt*dt;
            eff.sprite_index = sprWhiteDot;
            eff.image_xscale = 2;
            eff.image_yscale = 2;
            if(orangeNotBlue) eff.image_blend = c_orange
            else eff.image_blend = c_aqua
        }

        if (hspeed < 0)
        {
            eff = instance_create(x+8, yprevious, PropShrapnel);
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
//set this to image_angle if you want the bullets to follow the player's angle ------v
draw_sprite_ext(sprite_index,floor(!self.orangeNotBlue),floor(x),floor(y),image_xscale,image_yscale,0,image_blend,image_alpha)
