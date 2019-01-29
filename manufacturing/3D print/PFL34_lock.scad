linear_extrude(2.5) {
    difference() {
        square([54,8.3],center=true);
        square([50,5.3],center=true);
    }
}
translate([0,0,2.5]) {
linear_extrude(6) {
    difference() {
        square([54,8.3],center=true);
        union() {
            square([50,6.3],center=true);
            translate([0,4,0])
                square([4,3],center=true);
        }
    }
}
}