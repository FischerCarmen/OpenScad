include <BOSL2/std.scad>;

include <parameters.scad>;


cuboid([
  height, 
  width, 
  plate_thickness],
  rounding=plate_thickness/2,
  trimcorners=true)
    position(RIGHT) 
      cylinder(
        d=plate_thickness/2,
        h=width, 
        anchor=CENTER, 
        orient=BACK);