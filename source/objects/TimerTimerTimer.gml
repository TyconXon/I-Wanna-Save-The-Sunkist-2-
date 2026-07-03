#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
text="TextDraw"
font=fntSignpost
color=$ffffff
alpha=1
xscale=1.0
yscale=1.0
halign=0
valign=0
filter=false
time = 0
trg=false
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visible=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(trg) time += global.game_speed/room_speed
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
Draws a timer! When first activated, will start the timer, and after, will stop the timer!
*/

//field font: font
//field halign: enum(fa_left,fa_center,fa_right)
//field valign: enum(fa_top,fa_middle,fa_bottom)
//field filter: false - use bilinear filtering

/*preview

    draw_set_font(font)
    draw_set_color(image_blend)
    draw_set_alpha(image_alpha)
    draw_set_halign(halign)
    draw_set_valign(valign)
    if (filter) {
        i=texture_get_interpolation()
        texture_set_interpolation(1)
    }
    draw_text_transformed(x,y,"hh:mm:ss",image_xscale,image_yscale,image_angle)
    if (filter) texture_set_interpolation(i)
    draw_set_color($ffffff)
    draw_set_alpha(1)
    draw_set_halign(0)
    draw_set_valign(0)
*/
angle=image_angle
xscale=image_xscale
yscale=image_yscale

draw_set_font(font)
draw_set_halign(halign)
draw_set_valign(valign)
w=string_width(text)*xscale
h=string_height(text)*yscale

if (halign=0 && valign=0) {
    sprite_index=spr1x1
    image_xscale=w
    image_yscale=h
    image_angle=0
}

if (halign=2 && valign=2) {
    sprite_index=spr1x1
    image_xscale=-w
    image_yscale=-h
    image_angle=0
}

if (halign=1 && valign=1) {
    sprite_index=spr2x2
    image_xscale=w/2
    image_yscale=h/2
    image_angle=0
}

if (halign=1 && valign=0) {
    sprite_index=spr1x2
    image_xscale=h
    image_yscale=w/2
    image_angle=270
}

if (halign=1 && valign=2) {
    sprite_index=spr1x2
    image_xscale=h
    image_yscale=w/2
    image_angle=90
}

if (halign=0 && valign=1) {
    sprite_index=spr1x2
    image_xscale=w
    image_yscale=h/2
    image_angle=0
}

if (halign=2 && valign=1) {
    sprite_index=spr1x2
    image_xscale=w
    image_yscale=h/2
    image_angle=180
}

if (halign=2 && valign=0) {
    sprite_index=spr1x1
    image_xscale=-w
    image_yscale=h
    image_angle=0
}


draw_set_halign(0)
draw_set_valign(0)
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visible=0
alarm[0]=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_font(font)
draw_set_color(image_blend)
draw_set_alpha(image_alpha)
draw_set_halign(halign)
draw_set_valign(valign)
var display;
display = string_format( (time / global.game_speed), 2,2 )
if (filter) {
    i=texture_get_interpolation()
    texture_set_interpolation(1)
}
if (xscale==1 && yscale==1 && angle=0) draw_text(x,y,display)
else draw_text_transformed(x,y,(display),xscale,yscale,angle)
if (filter) texture_set_interpolation(i)
draw_set_color($ffffff)
draw_set_alpha(1)
draw_set_halign(0)
draw_set_valign(0)
#define Trigger_Trap is Triggered
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
trg=!trg
