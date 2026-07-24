#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tile=tile_find_anywhere(x,y)
myhealth=1
doExplosions=true
doBullets=false
doPlayerKillers=true

if (!tile) {
    show_error("BreakBlock at "+string(x)+","+string(y)+" doesn't have a tile to destroy",0)
    instance_destroy()
}
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (tile) {
    i=instance_create(x+16,y+16,DestroyedBlock)
    i.bg=tile_get_background(tile)
    i.l=tile_get_left(tile)
    i.t=tile_get_top(tile)
    i.image_xscale = tile_get_width(tile)
    i.image_yscale = tile_get_yscale(tile)
    i.hspeed=hspeed+random(hspeed)
    i.vspeed=vspeed+random(vspeed)
    tile_delete(tile)
}

with (instance_place(x,y,WallJumpR)) instance_destroy()
with (instance_place(x,y,WallJumpL)) instance_destroy()
#define Collision_PlayerKiller
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=doPlayerKillers
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=901
applies_to=self
invert=0
arg0=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!doBullets) exit;
#define Collision_Explosion
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=doExplosions
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=901
applies_to=self
invert=0
arg0=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field doExplosions: true
//field doPlayerKillers: true
//field doBullets: false
        //field myhealth: number
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play_auto(global.break_sfx, random_range(0.8,1.2))
hspeed=other.hspeed/2
vspeed=other.vspeed/2
instance_destroy()
