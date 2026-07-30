///persist_hash(state, [instant])
//call with 0 on create, call with 1 when this object is consumed

//stores state for single-use objects in the game (such as coins,
//collectibles, breakable boxes etc)
if(argument_count==1) {
    if(!variable_local_exists("type")) instant=false
    else  instant= (type == "Permanent")
}
else instant = argument[1]

var myMap;
if(!instant) myMap = global.persistmap
else myMap = global.instantpersistmap

if (argument0) {
    if (!persisthashed) {dsmap(myMap,str_cat(room,"_",persisthashx,"_",persisthashy,"_",object_index),argument0)
    if (instant) savedatap("instant persistent hashmap",ds_map_write(global.instantpersistmap))}
} else {
    persisthashx=xstart
    persisthashy=ystart
    persisthashed=0

    if (ds_map_exists(myMap,str_cat(room,"_",xstart,"_",ystart,"_",object_index))) {
        persisthashed=dsmap(myMap,str_cat(room,"_",persisthashx,"_",persisthashy,"_",object_index))
    }

}
if(variable_local_exists("persisthashed")) return persisthashed
else return 0
