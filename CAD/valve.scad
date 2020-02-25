use <common.scad>

module ball(a) {
    rotate([0,0,a]) difference() {
        union() {
            sphere(d = 21.6);
            cylinder(d = 11.5, h = 10.8);
            translate([0,0,10.8]) tooth_join(8,7,4);
        }
        rotate([0,90,0]) cylinder(d = 15, h = 24, center = true);
        translate([0,0,8]) cylinder(h = 16, d = 3.2);
        linear_extrude(height = 10.4) hexagon(5.5);
    }
}

module casing() {
    difference() {
        translate([0,0,4]) rounded_cube([26,26,34], r = 2, center = true);
        rotate([0,90,0]) cylinder(d = 15, h = 60, center = true);
        sphere(d = 22.4);
        cylinder(d = 12, h = 22, center = false);
        translate([0,0,10.8]) cylinder(d = 22.4, h = 7, center = false);
        translate([0,0,15]) cylinder(d = 14, h = 7, center = false);
        intersection() {
            translate([0,0,15]) cylinder(d = 18, h = 7, center = false);
            translate([0,0,15]) rotate([0,0,-45]) translate([-10,-13.5,0]) cube([20,15,10]);
            translate([0,0,15]) rotate([0,0,45]) translate([-10,-13.5,0]) cube([20,15,10]);
        }
        *for (y = [9.5,-9.5], z = [6,-7]) {
            translate([0,y,z]) rotate([0,90,0]) cylinder(d = 2.5, h = 10, center = true);
            translate([0,y,z]) rotate([0,90,0]) cylinder(d = 3.2, h = 10);
            translate([5,y,z]) rotate([0,90,0]) cylinder(d = 5.5, h = 10);
        }
    }
}

module handle(a) {
    rotate([0,0,a+45]) {
        difference() {
            union() {
                translate([0,0,17.8]) cylinder(h = 6.2, d = 11.5);
                hull() {
                    translate([0,0,22.6]) cylinder(h = 1.4, d = 11.5);
                    translate([14.5,0,22.6]) cylinder(h = 1.4, d = 3);
                    translate([-14.5,0,22.6]) cylinder(h = 1.4, d = 3);
                }
                hull() {
                    translate([0,0,18]) cylinder(h = 6, d = 3);
                    translate([0,-7,18]) cylinder(h = 6, d = 3);
                }
                translate([0,0,10.8]) rotate([0,0,-45]) tooth_join(8,7,4,1);
            }
            translate([0,0,8]) cylinder(h = 17, d = 3.2);
            for (i = [6.5:2:14.5]) {
                translate([i,0,22]) cylinder(d = 1.2, h = 3);
                translate([-i,0,22]) cylinder(d = 1.2, h = 3);
            }
        }
    }
}

module binding() {
    difference() {
        translate([0,0,4]) cube([32,32,34], center = true);
        translate([0,0,4]) cube([26.4,26.4,36], center = true);
        rotate([0,90,0]) cylinder(d = 15, h = 60, center = true);
    }
}

module valve(a,s) {
    translate([s,0,0]) intersection() {
        casing();
        translate([0,-40,-40]) cube([80,80,80]);
    }
    translate([-s,0,0]) intersection() {
        casing();
        translate([-80,-40,-40]) cube([80,80,80]);
    }
    ball(a);
    translate([0,0,s]) handle(a);
    translate([0,0,-2*s]) binding();
}

$fa = .1;
$fs = .2;
valve(0,20);
