///truthy("variable",[default])
var def;
if(argument_count==2) def=argument[1]
else def = false
if(variable_local_exists(argument0)) if(!is_undefined(variable_local_get(argument0))) return variable_local_get(argument0)
if(argument_count==2) variable_local_set(argument0,def)
return false
