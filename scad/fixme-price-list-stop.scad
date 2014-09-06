/*
	name: 		fixme-price-list-stop.scad
	author:	Aymeric B.
	date:		05.09.2014
*/


/****** PARAMETERS ****/
$fn = 50;
_thickness = 2;
_clearance = 0.1;

_frame_height = 40;
_frame_width = 25;
_cleat_size = 4;
_cleat_elevation = 4;
_elevation = 5;


/****** MODULES ****/
module InnerPart(width, height, thickness) {
	scale([width, height, 1]) {
		translate([0.5, -0.1, 0]) {
			scale([1/61.871844, -1/61.871844, 1]) union()
			{
				linear_extrude(height=thickness)
					polygon([[-30.935922,-6.629086],[30.935922,-6.539796],[30.935922,0.099260],[-30.935922,17.867117]]);
				linear_extrude(height=thickness)
					polygon([[17.172659,-17.866952],[21.465809,-17.866952],[29.294451,-6.502795],[25.001301,-6.502795]]);
				linear_extrude(height=thickness)
					polygon([[5.303226,-17.867117],[9.596376,-17.867117],[17.425074,-6.502877],[13.131924,-6.502877]]);
				linear_extrude(height=thickness)
					polygon([[-6.917324,-17.861847],[-2.624174,-17.861847],[5.204525,-6.497607],[0.911375,-6.497607]]);
		}
		}
	}
}

module OuterPart(width, height, elevation) {
	cube([width, height, elevation]);
}

module Draw() {
	translate([-_thickness, -_cleat_size, 0]) {
		OuterPart(_thickness, _frame_height+2*_cleat_size, _cleat_elevation);
	}
	translate([0, _thickness/2-1, 0]) {
		scale([1, -1, 1]) {
			InnerPart(10, 10, _cleat_elevation);
		}
	}
	translate([0, _frame_height+1-_thickness/2, 0]) {
		InnerPart(10, 10, _cleat_elevation);
	}
}

/****** RENDERS ****/
Draw();
