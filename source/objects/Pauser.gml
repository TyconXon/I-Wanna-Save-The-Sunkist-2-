#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
path=noone
path_action=path_action_reverse
path_absolute=false
active=true

hsp=2
vsp=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!active) {
    hspeed=0
    vspeed=0
    exit
}

if (path_index!=-1 && path_speed!=0) {
    get_path_speed()
} else {
    if (hspeed!=0) if (!place_free(x+hspeed,y) || instance_place(x+hspeed,y,TrapRedirect)) hspeed=-hspeed
    if (vspeed!=0) if (!place_free(x,y+vspeed) || instance_place(x,y+vspeed,TrapRedirect)) vspeed=-vspeed
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
active=!active
if(active){
    hspeed = hsp
    vspeed = vsp
}
sound_play_auto("talk")
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field path: path
    //field speed: number
    //field path_action: enum(path_action_continue,path_action_restart,path_action_reverse,path_action_stop)
    //field path_absolute: false
//field hsp: number
//field vsp: number
//field active: true

if(active){
hspeed = hsp
vspeed = vsp
}

if (path!=noone) {
    path_start(path,speed,path_action,path_absolute)
}
