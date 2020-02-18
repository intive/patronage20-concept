module valve(a) {
    difference() {
        cube(20, center = true);
        rotate([0,90,0]) cylinder(d = 12, h = 60, center = true);
        sphere(d = 18.2);
        cylinder(d = 10.2, h = 22, center = true);
    }
    rotate([0,0,a]) difference() {
        union() {
            sphere(d = 18);
            cylinder(d = 10, h = 20, center = true);
        }
        rotate([0,90,0]) cylinder(d = 12, h = 20, center = true);
    }
}

$fa = .1;
$fs = .1;
valve(0);