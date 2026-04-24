include <BOSL2/std.scad>
include <BOSL2/hinges.scad>

height = 220;
width = height;
plate_thickness = 5;

$fn=32;

cube([height, width, plate_thickness])
    position(CENTER + LEFT)
    orient(anchor=LEFT)
        knuckle_hinge(
            length=width,
            segs=3,
            offset=2,
            arm_height=0,
            arm_angle=90,
            clear_top=false,
            pin_diam=3,
            fill=false
        );