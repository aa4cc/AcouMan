$fn=100;

// cuts out small holes at the centers
// of transducers if enabled
holes = 0;

difference() {
    union() {
        translate([12.5,12.5,1])
            cube([85,85,3]);
        cube([110,110,1]);
    }
    union() {
        for (i=[0:7]) {
           translate([20+i*10,20,1])
             cylinder(d=10.25,h=3);
           translate([20+i*10,90,1])
             cylinder(d=10.25,h=3);
           translate([20,20+i*10,1])
             cylinder(d=10.25,h=3);
           translate([90,20+i*10,1])
             cylinder(d=10.25,h=3);
        }
        if (holes) {
            for (i=[0:7]) {
                for (j=[0:7]) {
                    translate([20+i*10,20+j*10,0])
                        cylinder(d=2,h=0.6);
                }
            }
        }
        translate([20,20,1])
            cube([70,70,3]);
    }
}