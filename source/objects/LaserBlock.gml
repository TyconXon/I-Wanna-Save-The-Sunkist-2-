#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
interval = 0
intervalOFF = interval
traveltime = 0
collisioninterval = 8

reachx = -1
reachy = -1

middlex = x
middley = y
visualwidth=8
curwidth = visualwidth

dontattemptfix=false
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var did;
did=false;
var iteration;
iteration = 0;

curwidth = visualwidth + (irandom(3)-2)

offsetx = ((image_xscale * sprite_get_width(image_index)) / 2 ) - sprite_xoffset
offsety = ((image_yscale * sprite_get_height(image_index)) / 2 ) - sprite_yoffset

lent = point_distance(0,0,offsetx,offsety)
dir = point_direction(0,0,offsetx,offsety) + image_angle

middlex = x + lengthdir_x(lent,dir)//( (image_xscale * sprite_get_width(image_index)) / 1 )
middley = y + lengthdir_y(lent,dir)//( (image_yscale * sprite_get_height(image_index)) / 2 )

if(traveltime == 0){

    while(!did){
                iteration+=1;
                reachx = middlex + lengthdir_x((collisioninterval * iteration),image_angle) //(cos( degtorad(image_angle) ) * (collisioninterval * iteration));
                reachy = middley + lengthdir_y((collisioninterval * iteration),image_angle)//(sin( degtorad(image_angle) ) * (collisioninterval * iteration));

                coll = collision_line(middlex,middley,reachx,reachy,Block,false,true);



                if(coll != noone) {
                        did=true;
                        if(!dontattemptfix){
                            if (bbox_left < coll.bbox_left && reachx > coll.bbox_left ) {
                               reachx = coll.bbox_left
                            }else if(bbox_right > coll.bbox_right && reachx < coll.bbox_right ) {
                               reachx = coll.bbox_right
                            } //weird things happen and the line snaps to the corner of hit objects
                            if(bbox_bottom > coll.bbox_bottom && reachy < coll.bbox_bottom ) {
                               reachy = coll.bbox_bottom
                            } else if(bbox_top < coll.bbox_top && reachy > coll.bbox_top) {
                               reachy = coll.bbox_top
                            }
                        }
                        break;
                }



                if(reachx > room_width || reachy > room_height || reachx < 0 || reachy < 0) did=true;
    }


}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field interval: number - zero for always on, and -1 for trigger-controlled (off)
        //field intervalOFF: number - off period duration. Default is interval.
//field traveltime: number - how fast the laser travels, zero for instant
//field collisioninterval: number - how many units this travels before checking for collisions each iteration
//field visualwidth: number
//field dontattemptfix: false - stop the laser from going inside blocks that its hitting
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_line_width_color(middlex,middley,reachx,reachy,curwidth,color_blend(c_yellow,c_orange),c_orange)

draw_self()
