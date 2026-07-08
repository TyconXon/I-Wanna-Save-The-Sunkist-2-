#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
c+=dt
if (c>1) {
    c-=1
    instance_create(0,0,aSingleRain)
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

c=0

if (instance_number(aSingleRain)==0) repeat (80/dt) {
    c+=dt
    if (c>1) {
        c-=1
        instance_create(0,0,aSingleRain)
    }
    with (aSingleRain) {x+=hspeed y+=vspeed}
}
