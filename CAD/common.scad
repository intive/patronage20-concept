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

function get_n_frag(r) =
    ( $fn > 0 ? max($fn, 3) : max(ceil(min(360 / $fa, 2*PI*r / $fs)), 5) );

module tooth_join(d, h, n, u = 0) {
    r = .5 * d;
    nf = ceil(get_n_frag(r) * .5 / n);
    ns = 2 * n * nf;
    pts = concat(
        [ for (j = [0:1:2*n-1], i = [0:1:nf-1])
            let (th = (i + j * nf) * 360 / ns, hx = h * i / nf)
            [cos(th)*r,sin(th)*r,(j%2) ? hx : h - hx]
        ],
        [[0,0,.5*h]],
        [ for (j = [0:1:2*n-1], i = [0:1:nf-1])
            let (th = (i + j * nf) * 360 / ns)
            [cos(th)*r,sin(th)*r,u ? h : 0]
        ],
        [[0,0,u ? h : 0]]
    );
    fcs = u
        ? concat(
            [ for (i = [0:1:ns-1]) [i,(i+1) % ns,ns] ],
            [ for (i = [0:1:ns-1]) [ns + 1 + i,ns + 1 + (i+1) % ns,(i+1) % ns,i]],
            [ for (i = [0:1:ns-1]) [ns + 1 + (i+1) % ns,ns + 1 + i,2*ns+1] ]
        )
        : concat(
            [ for (i = [0:1:ns-1]) [ns,(i+1) % ns,i] ],
            [ for (i = [0:1:ns-1]) [i,(i+1) % ns,ns + 1 + (i+1) % ns,ns + 1 + i]],
            [ for (i = [0:1:ns-1]) [2*ns+1,ns + 1 + i,ns + 1 + (i+1) % ns] ]
        );
    polyhedron(pts, fcs, convexity = 10);
}