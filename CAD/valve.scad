module valve(a,s) {
    difference() {
        cube(20, center = true);
        rotate([0,90,0]) cylinder(d = 12, h = 60, center = true);
        sphere(d = 18+s);
        cylinder(d = 10+s, h = 22, center = true);
    }
    rotate([0,0,a]) difference() {
        union() {
            sphere(d = 18);
            cylinder(d = 10, h = 20, center = true);
        }
        rotate([0,90,0]) cylinder(d = 12, h = 20, center = true);
        translate([0,2.5,8]) cylinder(d = 2.5, h = 10);
        translate([0,-2.5,8]) cylinder(d = 2.5, h = 10);
        translate([0,2.5,-18]) cylinder(d = 2.5, h = 10);
        translate([0,-2.5,-18]) cylinder(d = 2.5, h = 10);
    }
}

$fa = .1;
$fs = .1;
valve(0,.4);