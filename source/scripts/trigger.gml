///trigger([who]) - who can be an instance/object or a number
var l,t,r,b,group;

if(argument_count==0){event_trigger(tr_traptriggered)}
else{
     if(instance_exists(argument[0])) with(argument[0]) event_trigger(tr_traptriggered)
     else if(argument[0]>=0) {
        index=real(argument[0])

        group=instance_place(x,y,TriggerGroup)

        if (group) {
            l=group.bbox_left
            r=group.bbox_right
            t=group.bbox_top
            b=group.bbox_bottom
        } else {l=0 r=0 t=0 b=0}

        //destroy same color triggerlocks
        with (TriggerRelay)
            if (group==instance_place(other.x,other.y,TriggerGroup) and index==other.index)
                if (x>=l && x<r && y>=t && y<b) or (!group)
                    event_trigger(tr_traptriggered)

        with (TriggeredFree) if (index==other.index) instance_destroy()
        with (LockedTriggerFree) if (index==other.index) instance_destroy()
        with (object_find("Triggered"+string(index))) instance_destroy()
        with (object_find("LockedTrigger"+string(index))) instance_destroy()

     }
}
