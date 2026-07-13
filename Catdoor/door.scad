include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <parameters.scad>



/*difference() {
  cuboid([
    door_height,
    door_width,
    thickness],
    rounding=0,
    trimcorners=true);
    
    translate([door_width/2 - thickness/2 , 0, 0])
    cylinder(
      d=thickness/2,
      h=door_height,
      anchor=CENTER,
      orient=BACK);
}*/

module inni (height=door_height/2, width=door_width/2,thickness=thickness, anchor, spin, orient){
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
        }
        children();
    }
}

module outi(height=door_height/2, width=door_width/2,thickness=thickness, anchor, spin, orient){
    attachable(anchor, spin, orient, size=[height,width,thickness]){
        cuboid([height,width,thickness])
        {
            attach(LEFT) dovetail("male", width=15, height=8, slide=thickness);
            attach(FRONT) dovetail("male", width=15, height=8, slide=thickness);
        }
        children();
    }  
}

inni();
move([0,200,300])recolor("blueviolet")outi();
move([200,0,300])recolor("crimson")inni();
move([300,200,0])recolor("darkorange")outi();