include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <parameters.scad>


module inni (height=door_height/2, width=door_width/2,thickness=thickness, anchor, spin, orient, has_hinge=false){
    tag_scope()
    attachable(anchor, spin, orient, size=[height,width,thickness]){
        diff()
        cuboid([height,width,thickness])
        {
            tag("remove")
            attach(LEFT, BOTTOM, inside=true)
            dovetail("female", width=15, height=8, slide=30);
            tag("remove")
            attach(FRONT, BOTTOM, inside=true)
            dovetail("female", width=15, height=8, slide=30);
            if(has_hinge){
                tag("remove")
                translate([width/2 - thickness/2 , 0, 0])
                cylinder(d=thickness/2, h=height, anchor=CENTER, orient=FRONT);
                }
        }
        children();
    }
}

module outi(height=door_height/2, width=door_width/2,thickness=thickness, anchor, spin, orient, has_hinge=false){
    tag_scope()
    attachable(anchor, spin, orient, size=[height,width,thickness]){
        diff()
        cuboid([height,width,thickness])
        {
            attach(LEFT) dovetail("male", width=15, height=8, slide=thickness);
            attach(FRONT) dovetail("male", width=15, height=8, slide=thickness);
            if(has_hinge){
                tag("remove")
                translate([0 , width/2 - thickness/2, 0])
                cylinder(d=thickness/2, h=height, anchor=CENTER, orient=LEFT);
                }
        }
        children();
    }  
}

//inni(has_hinge=true);
//inni();
//outi(has_hinge=true);
//outi();