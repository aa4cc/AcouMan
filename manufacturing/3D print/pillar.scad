screw_height = 50;
screw_diam = 9;
leg_width = 15;
platform_width = 30;
platform_height = 3;


difference() {
    union() {
        translate([0,0,platform_height/2])
            cube([platform_width,platform_width,platform_height],center=true);
        translate([0,0,screw_height/2])
            cube([leg_width,leg_width,screw_height],center=true);
    }
    cylinder(d=screw_diam,h=screw_height,$fn=500);
}