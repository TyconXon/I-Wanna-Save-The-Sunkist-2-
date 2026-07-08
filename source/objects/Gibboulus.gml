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
triggerOnDeath = noone
blood=settings("blood")
setting=settings("bloodcoll")
nodie=false
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play_auto("sndDeath")
emit_prop_blood(8*settings("blood"))
with (triggerOnDeath) event_trigger(tr_traptriggered)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Collision_PlayerKiller
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!nodie) instance_destroy()
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!nodie) instance_destroy()
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field sprite_index: sprite
//field dialogue: script
//field triggerOnDeath: instance
//field nodie: false
#define Trigger_Draw End
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Trigger_NPC Interact
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
de_begin(dialogue)
