#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound = noone
owner = noone
vol = 0.5
pitch = 1
pan = 0
radius=128
loop=true
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/


if (instance_exists(owner)) {
    x=owner.x
    y=owner.y
    hspeed=owner.hspeed
    vspeed=owner.vspeed
}

if (instance_exists(Player)) {
    xcenter=Player.x
    ycenter=Player.y
} else {
    xcenter=view_xview+view_wview/2
    ycenter=view_yview+view_hview/2
}

sound_pan(sound,median(-1,(x-(xcenter))/view_wview,1))
if(point_distance(x,y,xcenter,ycenter)<radius) sound_volume(sound,min(  1, vol+ ( (view_wview*1/3)-point_distance(x,y,xcenter,ycenter) )/( view_wview*1/3 )  ) )
else sound_volume(sound,0)
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field sound: string
        //field vol: number
        //field pitch: number
        //field radius: radius
//field loop: true
//field owner: instance
if(!loop) sound = sound_play_ex(sound,vol,pitch,pan)
else sound = sound_loop_ex(sound,vol,pitch,pan)
