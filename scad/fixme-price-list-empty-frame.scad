/*
	name: 		fixme-price-list-empty-frame.scad
	author:	Aymeric B.
	date:		02.09.2014
*/


/****** PARAMETERS ****/
$fn = 50;
_thickness = 2;
_clearance = 0.1;

_frame_height = 40;
_frame_width = 25;
_cleat_size = 4;
_cleat_elevation = 2;
_elevation = 5;


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

module FrameBorder(width, height, elevation, thickness) {
	difference() {
		cube([width, height, elevation]); 
		translate([thickness, thickness, -thickness]) { 
			cube([width-2*thickness, 
					height-2*thickness, 
					elevation+2*thickness]);
		}
	}
}

module Draw() {
	BackPlate(_frame_width, _frame_height, _cleat_elevation);
	translate([0, _cleat_size, _cleat_elevation]) {
		FrameBorder(_frame_width, 
						_frame_height-2*_cleat_size, 
						_elevation-_cleat_elevation,
						_thickness);
	}
}

/****** RENDERS ****/
Draw();
