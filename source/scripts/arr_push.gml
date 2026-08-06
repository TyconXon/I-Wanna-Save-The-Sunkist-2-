///arr_push("name", value)
name=argument0
value=argument1

length_name = "_length_"+name

if(!variable_local_exists(length_name)) variable_local_set(length_name,1)
length = variable_local_get(length_name)

variable_local_array_set(name,length,value)
variable_local_set(length_name, length+1)
