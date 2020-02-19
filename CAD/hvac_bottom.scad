module hvac_bottom() {
    difference() {
        union() {
            cube([240,140,61.5]);
            translate([60,5,61.5]) linear_extrude(height = 5, scale = [.8,.5])
                square([80,5], center = true);
            translate([180,5,61.5]) linear_extrude(height = 5, scale = [.8,.5])
                square([80,5], center = true);
            translate([60,135,61.5]) linear_extrude(height = 5, scale = [.8,.5])
                square([80,5], center = true);
            translate([180,135,61.5]) linear_extrude(height = 5, scale = [.8,.5])
                square([80,5], center = true);
            translate([112.5,70,61.5]) linear_extrude(height = 5, scale = [.5,.8])
                square([3,80], center = true);
            translate([235,70,61.5]) linear_extrude(height = 5, scale = [.5,.8])
                square([5,80], center = true);
            for (i = [-50:10:50])
                translate([5,70+i,61.2]) linear_extrude(height = 5, scale = [.7,.7])
                    square([8,3], center = true);
        }

        translate([10,10,60]) cube([100,120,2]);        
        translate([10,20,-10]) cube([100,100,80]);
        for (i = [0:10:90])
            translate([12.5+i,-5,2]) cube([5,150,25]);
        
        translate([-5,22.5,2]) cube([50,5,25]);
        for (i = [10:10:80])
            translate([-5,22.5+i,2]) cube([150,5,25]);
        translate([-5,112.5,2]) cube([50,5,25]);

        for (i = [0:10:90])
            translate([-5,22.5+i,49]) cube([50,5,20]);
        
        hull() {
            translate([100.25,70,36.3]) rotate([90,0,0]) cylinder(d = 1.5, h = 100);
            translate([98.75,70,36.3]) rotate([90,0,0]) cylinder(d = 1.5, h = 100);
        }

        translate([130,10,60]) cube([100,120,2]);
        translate([130,20,48]) cube([100,100,20]);
        translate([145,30,44]) cube([70,80,5]);
        translate([155,35,-10]) cube([50,70,80]);
        hull() {
            translate([155,35,-40]) cylinder(r1 = 50, r2 = 0, h = 80);
            translate([205,35,-40]) cylinder(r1 = 50, r2 = 0, h = 80);
            translate([155,105,-40]) cylinder(r1 = 50, r2 = 0, h = 80);
            translate([205,105,-40]) cylinder(r1 = 50, r2 = 0, h = 80);
        }
        for (i = [0:10:40])
            translate([157.5+i,-5,2]) cube([5,150,33]);
        for (i = [0:10:60])
            translate([180,37.5+i,2]) cube([80,5,33]);
        
        translate([120,20,48]) cube([20,100,20]);
        translate([120,20,53]) rotate([-90,0,0]) cylinder(r = 5, h = 100);
        translate([115,20,53]) cube([20,100,20]);
        
        translate([146.5,-1,42.4]) rotate([-90,0,0]) cylinder(d = 2,h = 50);
        translate([149,-1,42.4]) rotate([-90,0,0]) cylinder(d = 2,h = 50);
        translate([145,45,41]) cube([11,43,4]);
        
        translate([5,5,61.5]) rotate([0,0,45]) rotate([0,-30,0])
            cylinder(d = 2.5, h = 13, center = true);
        translate([120,5,61.5]) rotate([0,0,90]) rotate([0,-30,0])
            cylinder(d = 2.5, h = 13, center = true);
        translate([235,5,61.5]) rotate([0,0,135]) rotate([0,-30,0])
            cylinder(d = 2.5, h = 13, center = true);
        translate([5,135,61.5]) rotate([0,0,-45]) rotate([0,-30,0])
            cylinder(d = 2.5, h = 13, center = true);
        translate([120,135,61.5]) rotate([0,0,-90]) rotate([0,-30,0])
            cylinder(d = 2.5, h = 13, center = true);
        translate([235,135,61.5]) rotate([0,0,-135]) rotate([0,-30,0])
            cylinder(d = 2.5, h = 13, center = true);
    }
}

$fs = .2;
$fa = .1;
hvac_bottom();