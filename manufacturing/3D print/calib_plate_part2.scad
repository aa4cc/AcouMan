$fn=100;

for (i=[0:7]) {
    for (j=[0:7]) {
        translate([15+i*10,15+j*10,0])
            cylinder(d=2,h=0.6);
    }
}