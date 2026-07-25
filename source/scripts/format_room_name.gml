///format_room_name(room)
var fin;
fin = room_get_name(argument0) // get name
fin = string_trim(fin, "rm") // remove rm

var finland;
finland = ""

l=string_length(fin)
for (i=1;i<=l;i+=1) {
    c=string_char_at(fin,i)
    cu=string_char_at(string_upper(fin),i)
    if(c==cu) finland += " "+c
    else finland += c
}

return string_trim(finland)
