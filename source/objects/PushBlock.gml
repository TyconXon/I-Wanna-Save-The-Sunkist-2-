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
push_speed=1
fall_speed=4

grav=1

mysavedhsp=999
mysavedvsp=999
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (Player) other.grav=vflip

if (place_free(x,y+grav) and !instance_place(x,y-grav*2,Platform)) {
    vspeed=fall_speed*grav
    hspeed=0
} else if (vspeed!=0) {
    move_outside_solid(direction+180,speed)
    move_contact_solid(direction,speed)
    vspeed=0
}

with (ConveyorLeft)
    if (instance_place(x,y-other.grav*2,other.id))
        with (other)
            if (place_free(x+other.spd,y))
                hspeed=min(hspeed,other.spd)
            else
                move_contact_solid(90-90*sign(other.spd),other.spd)

with (ConveyorRight)
    if (instance_place(x,y-other.grav*2,other.id))
        with (other)
            if (place_free(x+other.spd,y))
                hspeed=max(hspeed,other.spd)
            else
                move_contact_solid(90-90*sign(other.spd),other.spd)



with(instance_place(x,y+grav*2,MovingSolid)){
    with (other){
                if (place_free(x+other.hspeed,y))
                    hspeed=other.hspeed
                else
                    move_contact_solid(90-90*sign(other.hspeed),other.hspeed)
                }
}
with(instance_place(x,y+grav*2,ConveyerStick)){
    with (other){
                if (place_free(x+(other.spd*3),y))
                    hspeed=(other.spd*3)
                else
                    move_contact_solid(90-90*sign(other.spd*3),other.spd*3)
                }
}
/*
with(instance_place(x,y-grav*2,Platform)){
    with (other){
                if (place_free(x+other.hspeed,y))
                    hspeed=other.hspeed
                else
                    move_contact_solid(90-90*sign(other.hspeed),other.hspeed)
                }
}*/
/*
with(instance_place(x,y,IceField)){
    if(other.mysavedhsp==999) {
     other.mysavedhsp=other.hspeed
     other.mysavedvsp=other.vspeed
    }
    if(!noy)other.vspeed=other.mysavedhsp
    if(!nox)other.hspeed=other.mysavedvsp
    if(floorlessgravity) other.gravity = 0
}*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Step_2
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

if(!instance_place(x,y,IceField)) hspeed=0
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field push_speed
//field fall_speed
//field grav
