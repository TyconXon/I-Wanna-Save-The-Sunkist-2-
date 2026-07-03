#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
savedhspeed = 999
savedvspeed = 999

nox= false
noy= false
nojump= false
nodjump= false

slip = 11344

floorlessgravity = false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(savedhspeed != 999){ if(!instance_place(x,y,Player)) {
    savedhspeed = 999
    savedvspeed = 999
    Player.gravity = Player.baseGravDefault
    }
}
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(savedhspeed==999 or savedvspeed == 999){
                    savedhspeed=other.hspeed
                    if(!floorlessgravity || !Player.onGround) savedvspeed=other.vspeed
                    else if(Player.onGround) savedvspeed=-other.gravity
}
if ((!sound_isplaying(slip) or slip == 11344) and (other.vspeed!=0 or other.hspeed!=0) and !Player.dead) slip = sound_play_auto("Jump1")
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field nox: false
//field noy: false
//field nojump: false
//field nodjump: false
//field floorlessgravity: true
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_9slice(sprIce,0,x,y,sprite_width,sprite_height,1,1,image_angle,image_blend,image_alpha,32,32,64,64,1)
#define Trigger_On Player Jump
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(nojump) exit
savedhspeed=999
savedvspeed=999
#define Trigger_On Player Djump
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(nodjump) exit
savedhspeed=999
savedvspeed=999
