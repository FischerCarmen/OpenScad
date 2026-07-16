include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <parameters.scad>

module inni (height=(door_height/2)+tollerance, width=frame_width,thickness=frame_thickness, door_thickness=door_thickness/2, anchor, spin, orient){
    tag_scope()
    attachable(anchor, spin, orient, size=[width+height,width+height,door_thickness+thickness]){
        diff()
        translate([width/2,(height)/2,door_thickness/2])
        cuboid([height+2,width,thickness])

        {
            tag("remove")
            attach(RIGHT, BOTTOM, inside=true)
            dovetail("female", width=15, height=8, slide=thickness);
            attach(LEFT,RIGHT)
            translate([(height/2), 0, 0])
            recolor("darkolivegreen")
            cuboid([width,height+width,thickness]){
                tag("remove")
                attach(FRONT, BOTTOM, inside=true)
                dovetail("female", width=15, height=8, slide=thickness);
                attach(RIGHT, LEFT)
                translate([(-width)/2, -(door_thickness+thickness)/2, -thickness])
                recolor("crimson")
                cuboid([thickness,height,door_thickness]){
                    tag("remove")
                    attach(BOTTOM, BOTTOM, inside=true)
                    dovetail("female", width=15, height=8, slide=thickness, spin=90);
                    }
                };
            attach(FRONT,TOP)
            recolor("darkorange")
            translate([-thickness/2, -(door_thickness+thickness)/2, -thickness])
            cuboid([height+thickness+2,door_thickness,thickness]){
                tag("remove")
                attach(FRONT, BOTTOM, inside=true)
                dovetail("female", width=15, height=8, slide=thickness);
                };
        }
        children();
    }
}

module outi(height=door_height/2+tollerance, width=frame_width,thickness=frame_thickness, door_thickness=door_thickness/2, anchor, spin, orient){
    tag_scope()
    attachable(anchor, spin, orient, size=[width+height,width+height,door_thickness+thickness]){
        translate([width/2,height/2,(door_thickness)/2])
        cuboid([height,width,thickness])
        {
            attach(RIGHT, BOTTOM)
            recolor("blueviolet")
            dovetail("male", width=15, height=8, slide=thickness);
            attach(LEFT,RIGHT)
            translate([(height)/2, 0, 0])
            recolor("darkolivegreen")
            cuboid([width,height+width,thickness]){
                attach(FRONT, BOTTOM)
                recolor("blueviolet")
                dovetail("male", width=15, height=8, slide=thickness);
                attach(RIGHT, LEFT)
                translate([-width/2, -(door_thickness+thickness)/2, -thickness])
                recolor("crimson")
                cuboid([thickness,height,door_thickness]){
                    attach(BOTTOM, BOTTOM)
                    recolor("blueviolet")
                    dovetail("male", width=15, height=8, slide=thickness, spin=90);
                    }
                };
            attach(FRONT,TOP)
            recolor("darkorange")
            translate([-thickness/2, -(door_thickness+thickness)/2, -thickness])
            cuboid([height+thickness,door_thickness,thickness]){
                attach(FRONT, BOTTOM)
                recolor("blueviolet")
                dovetail("male", width=15, height=8, slide=thickness);
                };
        }
        children();
    }
}

//inni();
outi();