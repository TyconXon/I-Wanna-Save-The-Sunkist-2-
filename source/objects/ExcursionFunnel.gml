#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
left = false
spd = 3
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field left: false
//field spd: number

if(left) {
         sprite_index = sprUpWater
         spd=-spd
}
#define Trigger_Trap is Triggered
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
left=!left
spd=-spd
if(left) sprite_index = sprUpWater
