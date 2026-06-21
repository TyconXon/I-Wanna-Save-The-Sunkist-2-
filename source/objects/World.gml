#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//test event order to make sure the gm82 option is checked
order_test=2

//we also hide the window here since game start takes a hot minute
window_delayed_center()
window_set_showborder(1)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///delayed window center
window_center()
window_set_visible(1)
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///this is delayed to prevent a bug with instance list reordering
global.room_started=true
update_activation()
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///delayed buffer resize
update_fullscreen()
window_resize_buffer(global.ww,global.wh,0,0)
alarm[3]=5
#define Alarm_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///delayed window center
window_center()
#define Alarm_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///save scheduling
if (save_scheduled) savedata_write()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_world_step()
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_world_endstep()
#define Other_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_game_start()
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_room_start()

alarm[1]=1
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_room_end()
#define Other_30
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scheduled_close_button=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!instance_exists(FocusZone) || !settings("focuszones")) exit;

surf=surface_set("focuszones",global.width,global.height)

surface_set_target(surf);
    draw_clear_alpha(c_black, 0);
    _vx = camera_get_x()
    _vy = camera_get_y()
    with(FocusZone) if(visible) draw_rect(x-other._vx,y-other._vy,image_xscale,image_yscale,c_black)
surface_set_target(application_surface)

draw_surface_ext(surf, 0,0, 1, 1, 0, c_black, 0.50);
#define Trigger_Early Step
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_world_earlystep()
#define Trigger_Draw End
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_world_drawend()
