/*
	name: 		fixme-price-list-franc-frame.scad
	author:	Aymeric B.
	date:		02.09.2014
*/

use <francs-digits.scad>;

/****** PARAMETERS ****/
$fn = 50;
fudge = 0.1;
_thickness = 2;
_clearance = 0.1;

_frame_height = 40;
_frame_width = 20;
_cleat_size = 4;
_cleat_elevation = 2;
_elevation = 5;
print = 0;

/****** MODULES ****/
module RoundingEdge(radius, length) {	
	difference() {
		translate([0, 0, -_clearance]) {
			cube([2*radius+_clearance, 
					2*radius+_clearance, 
					length+2*_clearance]);
		}
		translate([0, 0, -2*_clearance]) {
			cylinder(r=radius,h=length+4*_clearance);
		}
	}
}

module BackPlate(width, height, thickness) {
	cube([width, height, thickness]);
}

module FrameFull(width, height, elevation) {
	cube([width, height, elevation]);
}

module Draw(number) {
	BackPlate(_frame_width, _frame_height, _cleat_elevation);
	translate([0, _cleat_size, _cleat_elevation]) {
		difference() {
			FrameFull(_frame_width, 
							_frame_height-2*_cleat_size, 
							_elevation-_cleat_elevation);
			translate([_frame_width/2, _frame_height/2-_cleat_size, 0]) {
				franc_digit(print, _elevation);
			}
		}
	}
}

/****** RENDERS ****/
if (print >= 0 && print <= 9) {
	echo ("Call Draw(print)");
	Draw();
} else {
	echo ("ERROR: print must be between 0 and 9.");
}