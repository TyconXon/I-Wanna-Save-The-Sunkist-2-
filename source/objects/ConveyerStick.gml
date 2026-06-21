#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spd=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spd=-Player.input_h
if(spd>0) sprite_index = sprConveyerRight
else if(spd<0) sprite_index = sprConveyerLeft
else sprite_index = sprConveyerNone
