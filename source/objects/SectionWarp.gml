#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
roomTo=noone
apple=false
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*description
Connects two rooms via wrap-around. Can either connect
multiple points if they're perfectly lined up,
or one point if it's not lined up.
See rmDemo, rmDemo2, and rmClassic2 for examples.
*/
//field roomTo: room
//field apple: false - alternate teleportation
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.lastroom==roomTo && global.sectionwarp) {
    global.sectionwarp=false

    if(apple){
        dx=x
        dy=y

        Player.x=x
        Player.y=y
    }else{
        dx=x-global.warpfromx
        dy=y-global.warpfromy

        Player.x+=dx
        Player.y+=dy
    }
    Player.drawx=Player.x
    Player.drawy=Player.y

    camera_default()
}
