use <common.scad>

module ball(a) {
    rotate([0,0,a]) difference() {
        union() {
            sphere(d = 18);
            cylinder(d = 8.1, h = 16);
            cylinder(d = 11.5, h = 9);
            linear_extrude(height = 20) hexagon(4.8);
        }
        rotate([0,90,0]) cylinder(d = 12, h = 20, center = true);
        translate([0,0,13]) cylinder(h = 10, d = 2.5);
    }
}

module casing() {
    difference() {
        translate([0,0,3]) cube([26,26,28], center = true);
        rotate([0,90,0]) cylinder(d = 12, h = 60, center = true);
        sphere(d = 18.4);
        cylinder(d = 12, h = 22, center = false);
        translate([0,0,9]) cylinder(d = 22, h = 7, center = false);
        translate([0,0,15]) cylinder(d = 18, h = 7, center = false);
        *translate([0,0,15]) cylinder(d = 14, h = 7, center = false);
        for (y = [9.5,-9.5], z = [6,-7]) {
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
                translate([0,0,16]) cylinder(h = 7, d = 11.5);
                hull() {
                    translate([0,0,21.5]) cylinder(h = 1.5, d = 11.5);
                    translate([14.5,0,21.5]) cylinder(h = 1.5, d = 3);
                    translate([-14.5,0,21.5]) cylinder(h = 1.5, d = 3);
                }
                hull() {
                    translate([0,0,16.2]) cylinder(h = 6.8, d = 3);
                    translate([0,-7,16.2]) cylinder(h = 6.8, d = 3);
                }
            }
            rotate([0,0,-45]) linear_extrude(height = 20) hexagon(4.8);
            translate([0,0,13]) cylinder(h = 11, d = 3.2);
            for (i = [6.5:2:14.5]) {
                translate([i,0,21]) cylinder(d = 1, h = 3);
                translate([-i,0,21]) cylinder(d = 1, h = 3);
            }
        }
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
}

$fa = .1;
$fs = .2;
valve(0,0);
