platform_height = 1.1;
platform_width = 10;
triangle_height = 14.1;
triangle_width = 14.1;
triangle_length = 199;

points = [[0,0],[0,platform_height],[triangle_width,platform_height+triangle_height],[triangle_width,platform_height],[platform_width,platform_height],[platform_width,0]];

rotate([90,0,0]) {
    linear_extrude(triangle_length)
        polygon(points);
}