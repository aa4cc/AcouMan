// dimensions (mm)
width = 5;
length = 7.5;
thick = 1;

linear_extrude(thick) {
    polygon(points = [[0,width/2],[length,0],[0,-width/2]]);
}