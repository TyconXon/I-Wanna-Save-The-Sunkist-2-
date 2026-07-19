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
growdistance = 64
initialsize = 1
growspeed = 0.1
theStart = false
birthed=false
color=c_black
var thenew;
thenew=noone
chosenx=0
choseny=0
sizedecrement=0.5
phase=true
ang=0
#define Step_0
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
if(distance_to_object(Player) < growdistance and !birthed){
   birthed = true

  thenew = instance_create(approach(x,Player.x,sprite_width/4),approach(y,Player.y,sprite_width/4),AshGrowthChild)
  thenew.initialsize = initialsize
  thenew.growdistance = growdistance
  thenew.growspeed = growspeed
  thenew.sizedecrement = sizedecrement

}else if(distance_to_object(AshGrowthChild) > growdistance){
  birthed=false
}
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=902
applies_to=self
invert=0
arg0=AshGrowthChild
*/
#define Other_4
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
//field growdistance: radius - How close the player has to be to grow
//field growspeed: number - How quickly the cherry grows, and therefore how quickly it reaches the player
//field sizedecrement: number - Subtract this from size each iteration
//field phase: true - Go through walls
initialsize=image_xscale
theStart = true
