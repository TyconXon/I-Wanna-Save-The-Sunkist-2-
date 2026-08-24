#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(World)) {show_error("World object not found. Please put rmInit at the top of your room list.",1) exit}

if (!instance_exists(savedata("obj"))) {
    (instance_create(x+17*image_xscale,y+23,savedata("obj"))).facing=image_xscale
}

warpid=""
deathMessage = "GAME OVER"
instantRestart = false

//jump vspeed values, and number of jumps
jump=8.5
jump2=7
maxjumps=2


//these values are used to reset the player when disabling gimmicks such as beams and fields
maxSpeedDefault=3
baseGravDefault=0.4
maxVspeed=9
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field warpid: string
//field deathMessage: string
//field instantRestart: false
//field physics: false - Player physics
        //field jump: number - [8.5] Jump height
        //field jump2: number - [7.0] Double jump height
        //field maxjumps: number - [2] Jumps
        //field maxSpeedDefault: number - [3.0] hspeed
        //field baseGravDefault: number - [0.4] gravity
        //field maxVspeed: number - [9.0]

Player.deathMessage = deathMessage
Player.jump=jump
Player.jump2=jump2
Player.maxjumps=maxjumps

Player.maxSpeedDefault=maxSpeedDefault
Player.baseGravDefault=baseGravDefault
Player.maxVspeed=maxVspeed
