/**
	Copyright (c) 2021 etkaar <https://github.com/etkaar>
	
	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:
	
	The above copyright notice and this permission notice shall be included in
	all copies or substantial portions of the Software.
	
	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
	THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
	OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
	ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
	OR OTHER DEALINGS IN THE SOFTWARE.
**/

/**
*	Used to fix render bugs, therefore should not have
*	any visual or technical effect, see:
*	https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/FAQ#What_are_those_strange_flickering_artifacts_in_the_preview?
*/
OVERLAP1 = 0.01;
OVERLAP2 = 2 * OVERLAP1;

WIDTH = 41;
LENGTH = 46;
THICKNESS = 4;
HEIGHT = 3.4;

HIDE_TOP_PLATE = true;
HIDE_BASE_PLATE = false;

LED_HOLE_DMTR = 5.4;
LED_HOLDER_WIDTH = 10;

if (!HIDE_BASE_PLATE) {
	plate(1);
}

if (!HIDE_TOP_PLATE) {
	translate([0, 0, HEIGHT])
	#plate(2);
}

module plate(_PART) {
	_plate_height = (_PART == 1)
		? (HEIGHT)
		: (1.6);
	
	difference() {
		cube([LENGTH + 2 * THICKNESS, WIDTH + 2 * THICKNESS, _plate_height]);
		
		translate([THICKNESS, THICKNESS, -OVERLAP1]) {
			cube([LENGTH, WIDTH, HEIGHT + OVERLAP2]);
		}
		
		translate([2 + 2 * THICKNESS, 2 * THICKNESS + OVERLAP1, -OVERLAP1]) {
			cube([LENGTH - 2 - 3 * THICKNESS, WIDTH, HEIGHT + OVERLAP2]);
		}

		// Recess on the right side
		translate([LENGTH + THICKNESS - OVERLAP1, THICKNESS + 10, -OVERLAP1]) {
			cube([1, WIDTH - 10 - 1, HEIGHT + OVERLAP2]);
		}
		
		// Chamfers
		translate([0, 0, -OVERLAP1])
		cylinder($fn=4, h=HEIGHT + OVERLAP2, d=8);
		
		translate([0, WIDTH + 2 * THICKNESS, -OVERLAP1])
		cylinder($fn=4, h=HEIGHT + OVERLAP2, d=4);
		
	}

	_width = (LED_HOLDER_WIDTH + 4) * (-1);
	_height = -13;
	_pitch = -14;

	/**
	*	Slope
	*/
	translate([25, 0, 0]) {
		difference() {
			linear_extrude(_plate_height)
			polygon([[0, 0], [_width, 0], [_width + _pitch, _height], [_pitch, _height]]);
			
			// LED hole
			translate([-15.6, _height + 5, -OVERLAP1]) {
				if (_PART == 1) {
					cylinder($fn=16, h=_plate_height + OVERLAP2, d=LED_HOLE_DMTR);
					
					translate([0, 0, _plate_height - 1]) {
						cylinder($fn=16, h=1, d=LED_HOLE_DMTR * 1.15);
					}
				} else if (_PART == 2) {
					translate([-LED_HOLE_DMTR / 2 + 1.5, 0, 0])
					#cylinder($fn=16, h=_plate_height + OVERLAP2, d=1.5);
					
					translate([LED_HOLE_DMTR / 2 - 1.5, 0, 0])
					#cylinder($fn=16, h=_plate_height + OVERLAP2, d=1.5);
				}
			}
		}
	}

	/**
	*	Left
	*/
	translate([-20, (WIDTH - THICKNESS / 2) / 2, 0]) {
		difference() {
			cube([20, LED_HOLDER_WIDTH, _plate_height]);
			
			// LED hole
			translate([5, LED_HOLDER_WIDTH / 2, -OVERLAP1]) {
				if (_PART == 1) {
					cylinder($fn=16, h=_plate_height + OVERLAP2, d=LED_HOLE_DMTR);
					
					translate([0, 0, _plate_height - 1]) {
						cylinder($fn=16, h=1, d=LED_HOLE_DMTR * 1.15);
					}
				} else if (_PART == 2) {
					translate([0, -LED_HOLE_DMTR / 2 + 1.5, 0])
					#cylinder($fn=16, h=_plate_height + OVERLAP2, d=1.5);
					
					translate([0, LED_HOLE_DMTR / 2 - 1.5, 0])
					#cylinder($fn=16, h=_plate_height + OVERLAP2, d=1.5);
				}
			}
		}
	}

	/**
	*	Right
	*/
	translate([LENGTH + 2 * THICKNESS, (WIDTH - THICKNESS / 2) / 2, 0]) {
		difference() {
			cube([LED_HOLDER_WIDTH, LED_HOLDER_WIDTH, _plate_height]);
			
			// LED hole
			translate([LED_HOLDER_WIDTH - 5, LED_HOLDER_WIDTH / 2, -OVERLAP1]) {
				if (_PART == 1) {
					cylinder($fn=16, h=HEIGHT + OVERLAP2, d=LED_HOLE_DMTR);
					
					translate([0, 0, HEIGHT - 1]) {
						cylinder($fn=16, h=1, d=LED_HOLE_DMTR * 1.15);
					}
				} else if (_PART == 2) {
					translate([0, -LED_HOLE_DMTR / 2 + 1.5, 0])
					#cylinder($fn=16, h=_plate_height + OVERLAP2, d=1.5);
					
					translate([0, LED_HOLE_DMTR / 2 - 1.5, 0])
					#cylinder($fn=16, h=_plate_height + OVERLAP2, d=1.5);
				}
			}
		}
	}
}


