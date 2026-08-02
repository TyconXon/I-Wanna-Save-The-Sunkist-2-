var filename;
filename = filename_remove_ext(filename_name(argument0))
show_message(string(argument0) + ": " + string(filename))
if(background_find(filename)) background_replace(background_find(filename),argument0,false,false)
else if(sprite_find(filename)) sprite_replace(sprite_find(filename),argument0,0,0,0,0,0)
else if(object_find(filename)) exit //import_object(argument0,argument1)
