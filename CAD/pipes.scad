use <valve.scad>

module pipe(di, do, w, h, dz) {
    r = .5 * do;
    w2 = sqrt(w*w+dz*dz);
    l = sqrt(w*w+h*h+dz*dz);
    th = atan2(dz,w);
    al = atan2(w2,h);
    d1 = w2*w2 - 4*w2*r + h*h;
    assert(d1 >= 0, "Negative delta");
    d = h*sqrt(d1);
    x = (-2*r*(w-2*r) + d) / ((w-2*r)*(w-2*r)+h*h);
    a = acos(x);
    echo(w2,th,al,d,x,a);
    rotate([0,-th,0]) rotate([0,0,-al]) rotate([-90,0,0]) cylinder(d = do,h=l);
}

module pipes() {
    translate([53.3,36,124]) rotate([0,0,90])
        rotate([180,0,0]) binding2();
    translate([141.7,36,124]) rotate([0,0,90])
        rotate([180,0,0]) binding2();
    translate([ 31  ,52,124]) pipe(15,18,45  ,80-52,-33);
    translate([ 75.6,52,124]) pipe(15,18,44.4,80-52,  0);
    translate([119.4,52,124]) pipe(15,18,63.1,80-52,-33);
    translate([164  ,52,124]) pipe(15,18,76  ,80-52,  0);
}

pipes();