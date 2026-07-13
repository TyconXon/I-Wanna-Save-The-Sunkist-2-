#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!key_skip()) soundInd = sound_loop("prima")
else soundInd = sound_loop("dog")
doPlayer=true
right=false
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_stop(soundInd)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if( ((!key_shoot() and doPlayer) or(!doPlayer and (!mouse_check_button(mb_left))) )) instance_destroy()
var dtp;
if(doPlayer) dtp=distance_to_object(Player)
else dtp=30

if(!doPlayer) direction=point_direction(x,y,mouse_room_x(),mouse_y)

if(doPlayer) sound_pitch(soundInd,0.1+((direction+90)/360))
else sound_pitch(soundInd,1.5-(y/room_height))

if (instance_exists(Player)) xcenter=Player.x
else xcenter=view_xview+view_wview/2


sound_pan(soundInd, median(-1,(x-xcenter)/view_wview,1))
image_blend=make_color_hsv(255*((direction+90)/360),255,255)
image_xscale=random(2)
image_yscale=image_xscale

if(doPlayer){
    speed=speed * (1-(dtp/32))
    if(40>dtp){
      if(dtp>32) speed = 0
    }else{
        move_towards_fixed(Player.x,Player.y,dtp-32)
    }
    if(speed) make_afterimage()
}else{
    speed=0
    make_afterimage(1,0.01,-0.01,-0.01,1)
    x=mouse_room_x()
    y=mouse_y
}
#define Collision_GibParticle
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
#define Collision_Blood
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
