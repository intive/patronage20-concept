module hexagon(d) {
    a = d / sqrt(3);
    ha = 0.5 * a;
    hd = 0.5 * d;
    polygon([[-ha,-hd],[-a,0],[-ha,hd],[ha,hd],[a,0],[ha,-hd]]);
}

module rounded_cube(size = [1,1,1], r = .1, center = false) {
    pos = center ? size * -.5 : [0,0,0];
    pts = [
        [r,r,r],
        [size[0]-r,r,r],
        [r,size[1]-r,r],
        [size[0]-r,size[1]-r,r],
        [r,r,size[2]-r],
        [size[0]-r,r,size[2]-r],
        [r,size[1]-r,size[2]-r],
        [size[0]-r,size[1]-r,size[2]-r],
    ];
    hull() for (i = pts)
        translate(pos + i) sphere(r = r);
}
