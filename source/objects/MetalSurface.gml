#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///pastel green water gimmick
sprite_index=storesprite
if (instance_place(xstart,ystart,PastelWater2)) {
    sprite_index=-1
    alarm[0]=1
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
Portals can't be places on these surfaces.
*/
