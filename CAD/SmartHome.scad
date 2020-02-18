module hexagon(d) {
    a = d / sqrt(3);
    ha = 0.5 * a;
    hd = 0.5 * d;
    polygon([[-ha,-hd],[-a,0],[-ha,hd],[ha,hd],[a,0],[ha,-hd]]);
}

module house() {
    difference() {
        cube([360,300,150]);
        translate([15,15,15]) cube([165,270,150]); // living-room
        translate([195,135,15]) cube([150,150,150]); // bedroom
        translate([195,15,15]) cube([150,105,150]); // hall
        translate([344,45,15]) cube([17,45,100]);
        translate([179,45,15]) cube([17,45,100]);
        translate([225,119,15]) cube([45,17,100]);    
        translate([344,180,65]) cube([17,75,50]);
        translate([-1,45,65]) cube([17,75,50]);
        translate([-1,180,65]) cube([17,75,50]);
    }
}

module hvac() {
    difference() {
        cube([240,140,61.5]);

        translate([10,10,60]) cube([100,120,2]);        
        translate([10,20,-10]) cube([100,100,80]);
        for (i = [0:10:90])
            translate([12.5+i,-5,2]) cube([5,150,25]);
        
        translate([-5,22.5,2]) cube([50,5,25]);
        for (i = [10:10:80])
            translate([-5,22.5+i,2]) cube([150,5,25]);
        translate([-5,112.5,2]) cube([50,5,25]);

        for (i = [0:10:90])
            translate([-5,22.5+i,47]) cube([50,5,20]);

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
    }
    difference() {
        translate([0,0,61.5]) cube([240,140,71]);
        translate([10,20,-10]) cube([100,100,83.5]);
        translate([25,30,-10]) cube([70,80,87.5]);
        translate([35,35,-10]) cube([50,70,114.5]);
        translate([40,50,-10]) cube([40,40,125]);
        translate([60,70,115]) intersection() {
            union() {
                cylinder(d1 = 38, d2 = 56, h = 15);
                translate([-20,-20,15]) cube([40,40,40]);
            }
            translate([-20,-20,0]) cube([40,40,16.5]);
        }
        translate([76,86,0]) cylinder(d = 2.5, h = 118.5);
        translate([44,86,0]) cylinder(d = 2.5, h = 118.5);
        translate([76,54,0]) cylinder(d = 2.5, h = 118.5);
        translate([44,54,0]) cylinder(d = 2.5, h = 118.5);

        translate([130,20,-10]) cube([100,100,200]);
        for (i = [0:10:90])
            translate([-5,22.5+i,47]) cube([50,5,20]);
        
        translate([60,70,124]) rotate([-90,0,0]) union() {
            cylinder(d = 12, h = 200);
            difference() {
                cylinder(d = 12+3,h = 21.5);
                translate([0,0,20]) translate([0,0,1.5])
                    rotate_extrude() translate([7.5,0]) circle(d = 3);
            }
        }
        translate([60,70,124]) rotate([90,0,0]) union() {
            cylinder(d = 12, h = 200);
            difference() {
                cylinder(d = 12+3,h = 21.5);
                translate([0,0,20]) translate([0,0,1.5])
                    rotate_extrude() translate([7.5,0]) circle(d = 3);
            }
        }
        *translate([60,70,91]) rotate([0,-90,0]) union() {
            cylinder(d = 12, h = 44);
            difference() {
                cylinder(d = 12+3,h = 26.5);
                translate([0,0,25]) translate([0,0,1.5])
                    rotate_extrude() translate([7.5,0]) circle(d = 3);
            }
        }
        *translate([16,70,91]) rotate([-90,0,0]) cylinder(d = 12, h = 200, center = true);
        *translate([28,82,91]) rotate_extrude(angle = 90) translate([-12,0]) circle(d = 12);
        *translate([28,58,91]) rotate_extrude(angle = -90) translate([-12,0]) circle(d = 12);
    }
}

$fs = .2;
$fa = .1;
intersection() {
    translate([60,80,0]) hvac();
    translate([0,150,0]) cube([400,400,200]);
}

translate([0,0,131.5]) house();