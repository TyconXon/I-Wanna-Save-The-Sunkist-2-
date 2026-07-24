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
shaketime=1
fallspeed=0.02
weld_parent=noone
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(instance_place(x,y+fallspeed,TrapStop)) exit;
gravity=fallspeed/dt
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (weld_parent) {
    other.x = self.x - other.xOffset
    other.y = self.y - other.yOffset
}
if(distance_to_object(Player)<2) {
    event_perform(ev_collision,Player)
}
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(weld_parent==noone){
                           if(!alarm[0] and gravity==0) alarm[0]=shaketime/dt
}else{
      with(weld_parent) if(!alarm[0] and gravity==0) alarm[0]=shaketime/dt
}

//if ( instance_place(x,y+vspeed,other) and vspeed>4 ) kill_player()
#define Collision_TrapStop
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(other.index!=9) exit;
if(gravity==0 or vspeed==0) exit;

//y += distance_to_object(other.id)

if(abs(vspeed) < 3) sound_play_auto("door_metal_thin_close2")
else if(abs(vspeed) < 8) sound_play_auto("elevator_stop")
else if(abs(vspeed) < 10) sound_play_auto("elevator_stop2")
else sound_play_auto("skylift_stop")

if(weld_parent==noone){ gravity=0; vspeed=0;
}else with(weld_parent) gravity=0; vspeed=0;
#define Collision_TrapDestroy
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
explode_me()
instance_destroy()
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field shaketime: number
//field fallspeed: number
//field sprite_index: sprite
//field weld_parent: instance - Follows this instance as if it were welded from this position

with (weld_parent) {
    other.xOffset = self.x - other.x
    other.yOffset = self.y - other.y
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_9slice(sprite_index,image_index,x,y,sprite_width,sprite_height,1,1,image_angle,image_blend,image_alpha,32,32,0,0,1)
