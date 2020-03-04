use <valve.scad>

module pipe(di, do, w, h, dz) {
    r = .6 * do;
    w2 = sqrt(w*w+dz*dz);
    theta = atan2(dz,w);
    al = atan2(w2,h);
    d1 = w2*w2 - 4*w2*r + h*h;
    assert(d1 >= 0, "Negative delta");
    d = h*sqrt(d1);
    cosa = (-2*r*(w2-2*r) + d) / ((w2-2*r)*(w2-2*r)+h*h);
    sina = sqrt(1 - cosa*cosa);
    alpha = acos(cosa);
    h_off = r * sina;
    w_off = r * (1 - cosa);
    w_len = w2 - 2 * w_off;
    h_len = h - 2 * h_off;
    c_len = sqrt(w_len * w_len + h_len * h_len);
    *echo(w2,theta,al,cosa,sina,alpha,h_off,w_off,h_len,w_len,c_len);
    rotate([0,-theta,0]) {
        *rotate([0,0,-al]) rotate([-90,0,0]) cylinder(d = do, h = sqrt(w*w+h*h+dz*dz));
        translate([r,0,0]) rotate_extrude(angle = -alpha)
            translate([-r,0]) difference() {
                circle(d = do);
                circle(d = di);
            }
        translate([w_off,h_off,0]) rotate([0,90,90-alpha]) linear_extrude(height = c_len) difference() {
            circle(d = do);
            circle(d = di);
        }
        translate([w2-r,h,0]) rotate_extrude(angle = -alpha)
            translate([r,0]) difference() {
                circle(d = do);
                circle(d = di);
            }
    }
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
$fa = .1;
pipes();