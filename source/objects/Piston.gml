#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
inst = noone
col = $ffffff
center=false
method="line"

xgoal=0
ygoal=0
width=16
stretch=false
murderer=false
weld_parent = noone

xOffset=0
yOffset=0

var thisx, thisy;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

with (weld_parent) {
    other.x = self.x - other.xOffset
    other.y = self.y - other.yOffset
}

thisx=x
thisy=y

 if(center=="x" || center=="both"){
    xgoal=inst.bbox_left + ((inst.bbox_right - inst.bbox_left) / 2);
    if(method!="line") xgoal+=sprite_width/2
    if(method!="line")thisx-=sprite_width/2
 }
 else xgoal=inst.x

 if(center=="y" || center=="both") {
    ygoal= inst.bbox_top + ((inst.bbox_bottom - inst.bbox_top) / 2);
    if(method!="line")ygoal+=sprite_height/2
    if(method!="line")thisy-=sprite_height/2
 }
 else ygoal=inst.y

if(!murderer) exit;

if(method=="line"){
    if(collision_line(thisx,thisy,xgoal,ygoal,Player,false,true) != noone){
        kill_player()
    }
}else if(method=="strip"){
    if(collision_rectangle(thisx,thisy,xgoal,ygoal,Player,false,true) != noone){
        kill_player()
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
Connects an instance to this position visually
*/
//field inst: instance
//field method: enum("line","strip","stretch")
//field sprite_index: sprite
        //field image_speed: number
//field center: enum("false","x","y","both")
//field stretch: false
//field image_xscale: number
//field murderer: false
//field weld_parent: instance - Follows this instance as if it were welded from this position

with (weld_parent) {
    other.xOffset = self.x - other.x
    other.yOffset = self.y - other.y
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/


switch(method){
 case "line":
     draw_set_color(image_blend)
     draw_line(x,y,xgoal,ygoal)
     draw_set_color(c_white)
 break;
 case "strip":
      texture_set_repeat(2)
      draw_primitive_begin_texture(pr_trianglelist,sprite_get_texture(sprite_index,image_index))

      if(!stretch){
          //1
          draw_vertex_texture(thisx,thisy,0,0) //top left
          draw_vertex_texture(thisx,ygoal,0,abs((ygoal-thisy)/sprite_get_height(sprite_index))) //top right
          draw_vertex_texture(xgoal,ygoal,abs((xgoal-thisx)/sprite_get_width(sprite_index)),abs((ygoal-thisy)/sprite_get_height(sprite_index))) //bottom right
          //2
          draw_vertex_texture(thisx,thisy,0,0) //top left
          draw_vertex_texture(xgoal,ygoal,abs((xgoal-thisx)/sprite_get_width(sprite_index)),abs((ygoal-thisy)/sprite_get_height(sprite_index))) //bottom right
          draw_vertex_texture(xgoal,thisy,abs((xgoal-thisx)/sprite_get_width(sprite_index)),0) //bottom left
      }else{
          //1
          draw_vertex_texture(thisx,thisy,0,0) //top left
          draw_vertex_texture(thisx,ygoal,0,1) //top right
          draw_vertex_texture(xgoal,ygoal,1,1) //bottom right
          //2
          draw_vertex_texture(thisx,thisy,0,0) //top left
          draw_vertex_texture(xgoal,ygoal,1,1) //bottom right
          draw_vertex_texture(xgoal,thisy,1,0) //bottom left

      }
      draw_primitive_end()
 break;
 case "stretch":
     image_angle=direction_to_object(inst)
     image_yscale=distance_to_object(inst)/sprite_get_height(sprite_index)

 break;
}
