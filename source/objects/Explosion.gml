#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 0.2*dt //30/50

with(instance_place(x,y,Explosion)) if(image_index<4) exit


if(inside_view()) sound_play_auto("snd_badexplosion", random_range(0.8,1.2))
else sound_play_auto("explode_distance", random_range(0.8,1.2))
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(image_index> 13) exit
with(other) if(!instance_place(x,y,AnyWater)) with(other) kill_player()
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
