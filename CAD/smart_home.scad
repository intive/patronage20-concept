use <hvac.scad>
use <house.scad>
use <valve.scad>

$fs = .2;
$fa = .1;
intersection() {
    translate([60,80,0]) hvac();
    *translate([0,150,0]) cube([400,400,200]);
    *translate([0,147,0]) cube([400,6,200]);
}
translate([0,0,136]) house();
//binding2();