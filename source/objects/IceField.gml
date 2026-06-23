#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
savedhspeed = 999
savedvspeed = 999
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(savedhspeed != 999){ if(!instance_place(x,y,Player)) {
    savedhspeed = 999
    savedvspeed = 999
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
                    savedvspeed=other.vspeed-gravity
}
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
savedhspeed=999
savedvspeed=999
#define Trigger_On Player Djump
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
savedhspeed=999
savedvspeed=999
