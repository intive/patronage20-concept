use <hvac_bottom.scad>
use <hvac_top.scad>

module hvac() {
    hvac_bottom();
    hvac_top();
}

$fs = .2;
$fa = .1;
hvac();