use <valve.scad>
use <common.scad>

module pipe(di, do, w, h, dz) {
    ri = .5 * di;
    ro = .5 * do;
    rc = .6 * do;
    w2 = sqrt(w*w+dz*dz);
    theta = atan2(dz,w);
    delta1 = w2*w2 - 4*w2*rc + h*h;
    assert(delta1 >= 0, "Negative delta");
    delta = h*sqrt(delta1); // delta root
    cosa = (-2*rc*(w2-2*rc) + delta) / ((w2-2*rc)*(w2-2*rc)+h*h);
    sina = sqrt(1 - cosa*cosa);
    alpha = acos(cosa);
    h_off = rc * sina;
    w_off = rc * (1 - cosa);
    w_len = w2 - 2 * w_off;
    h_len = h - 2 * h_off;
    c_len = sqrt(w_len * w_len + h_len * h_len);
    n_curve = ceil(get_n_frag(rc + .5 * do) * alpha / 360);
    n_ring = get_n_frag(.5 * do);
    echo(n_ring,n_curve);
    pts = concat(
        [
            for (i = [0:1:n_curve], j = [0:1:n_ring-1])
                let (ac = -i * alpha / n_curve, ar = j * 360 / n_ring,
                    sinac = sin(ac), cosac = cos(ac), sinar = sin(ar), cosar = cos(ar))
            each [
                [(ro*cosar-rc)*cosac+rc,(ro*cosar-rc)*sinac,ro*sinar],
                [(ri*cosar-rc)*cosac+rc,(ri*cosar-rc)*sinac,ri*sinar]
            ]
        ],
        [
            for (i = [n_curve:-1:0], j = [0:1:n_ring-1])
                let (ac = -i * alpha / n_curve, ar = j * 360 / n_ring,
                    sinac = sin(ac), cosac = cos(ac), sinar = sin(ar), cosar = cos(ar))
            each [
                [(ro*cosar+rc)*cosac-rc+w2,(ro*cosar+rc)*sinac+h,ro*sinar],
                [(ri*cosar+rc)*cosac-rc+w2,(ri*cosar+rc)*sinac+h,ri*sinar]
            ]
        ]
    );
    fcs = concat(
        [ for (j = [0:1:n_ring-1]) [
            2*j%(2*n_ring),
            (2*j+1)%(2*n_ring),
            (2*j+3)%(2*n_ring),
            (2*j+2)%(2*n_ring)]],
        [ for (i = [0:1:2*n_curve], j = [0:1:n_ring-1])
            let (k = (i*n_ring+j)*2, l = (i*n_ring+(j+1)%n_ring)*2)
            each [[k,l,l+n_ring*2,k+n_ring*2],[l+1,k+1,k+n_ring*2+1,l+n_ring*2+1]]],
        [ for (j = [0:1:n_ring-1]) let (k = 2*(2*n_curve+1)*n_ring)
            [k+2*j%(2*n_ring),k+(2*j+2)%(2*n_ring),k+(2*j+3)%(2*n_ring),k+(2*j+1)%(2*n_ring)]]
    );
    rotate([0,-theta,0]) polyhedron(points = pts,faces = fcs);
}

module pipes1() {
    yoff = 0;
    z1off = 0;
    z2off = 0;
    translate([53.3,16+yoff,124]) rotate([0,0,90])
        rotate([180,0,0]) binding2();
    translate([141.7,16+yoff,124-z2off]) rotate([0,0,90])
        rotate([180,0,0]) binding2();
    translate([ 31  ,32+yoff,124-z1off]) pipe(15,18,45  ,48-yoff,z1off-33);
    translate([ 75.6,32+yoff,124-z1off]) pipe(15,18,44.4,48-yoff,z1off);
    translate([119.4,32+yoff,124-z2off]) pipe(15,18,63.1,48-yoff,z2off-33);
    translate([164  ,32+yoff,124-z2off]) pipe(15,18,76  ,48-yoff,z2off);
}

module pipes2() {
    yoff =  0;
    x1off = 0;
    z1off = 40;
    x2off = 30;
    z2off = 30;
    translate([ 53.3+x1off,16+yoff,124-z1off]) rotate([0,0,90])
        rotate([180,0,0]) binding2();
    translate([126.7+x2off,16+yoff,124-z2off]) rotate([0,0,90])
        rotate([180,0,0]) binding2();
    translate([ 31  +x1off,32+yoff,124-z1off]) pipe(15,18, 89  -x1off,48-yoff,z1off);
    translate([ 75.6+x1off,32+yoff,124-z1off]) pipe(15,18,101.9-x1off,48-yoff,z1off-33);
    translate([104.4+x2off,32+yoff,124-z2off]) pipe(15,18,135.6-x2off,48-yoff,z2off);
    translate([149  +x2off,32+yoff,124-z2off]) pipe(15,18,135  -x2off,48-yoff,z2off-33);
}

module pipes() {
    pipes1();
    translate([360,300,0]) rotate([0,0,180]) pipes2();
}

$fs = .2;
$fa = 2;
pipes();