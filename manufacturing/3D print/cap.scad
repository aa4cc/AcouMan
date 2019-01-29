hole_drill = 9;
hole_depth = 5;
cap_diam = 15;
cap_height = 20;

$fn = 100;

difference() {
    union() {
        cylinder(d = cap_diam,h = cap_height-cap_diam);
        translate([0,0,cap_height-cap_diam])
            intersection() {
                sphere(d = cap_diam);
                cylinder(d = cap_diam,h = cap_diam);
            }
    }
    cylinder(d = hole_drill, h = hole_depth);
}