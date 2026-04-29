include <BOSL2/std.scad>;
include <parameters.scad>;


difference() {
  cuboid([
    height,
    width,
    plate_thickness],
    rounding=plate_thickness/2,
    trimcorners=true);
    
    
  translate([height/2 -plate_thickness/2 , 0, 0]) // Use named argument for x
    cylinder(
      d=plate_thickness/2,
      h=width,
      anchor=CENTER,
      orient=BACK);
}