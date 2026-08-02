//you can put any custom game start code here
add_coral_pixels()
global.nextroom = noone

for (file=file_find_first(global.datadir+"replace\*",0);file!="";file=file_find_next()) {
    resource_replace(global.datadir+"replace\"+file)
} file_find_close()
