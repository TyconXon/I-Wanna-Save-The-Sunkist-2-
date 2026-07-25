///shifting_color(color,amount)
var col,amt;
col = argument0
amt = argument1

return make_color_hsv(modwrap(color_get_hue(col)+amt,0,255),color_get_saturation(col), color_get_value(col) )
