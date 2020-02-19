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
        translate([60,80,0]) {
            translate([5,5,-1]) cylinder(d = 3.2, h = 20);
            translate([115,5,-1]) cylinder(d = 3.2, h = 20);
            translate([235,5,-1]) cylinder(d = 3.2, h = 20);
            translate([5,135,-1]) cylinder(d = 3.2, h = 20);
            translate([115,135,-1]) cylinder(d = 3.2, h = 20);
            translate([235,135,-1]) cylinder(d = 3.2, h = 20);
            translate([5,5,3]) cylinder(d = 5.5, h = 20);
            translate([115,5,3]) cylinder(d = 5.5, h = 20);
            translate([235,5,3]) cylinder(d = 5.5, h = 20);
            translate([5,135,3]) cylinder(d = 5.5, h = 20);
            translate([115,135,3]) cylinder(d = 5.5, h = 20);
            translate([235,135,3]) cylinder(d = 5.5, h = 20);
        }
    }
}

$fs = .2;
$fa = .1;
house();