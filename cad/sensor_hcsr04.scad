$fn=100;

module hcsr04() {
	// Draw the sensors
	translate(v = [-13.5, 0, 7.5]) {
		cylinder(h = 13.8, r = 8, center = true, $fn=36);
	}

	translate(v = [13.5, 0, 7.5]) {
		cylinder(h = 13.8, r = 8, center = true, $fn=36);
	}

    difference() {
        // Draw the PCB
        cube(size = [45,20,1.2], center = true);

        // Draw the screw holes
        union() {
            union() {
                translate(v = [-20, -8, 0]) {
                    cylinder(h = 4, r = 1.5, center = true, $fn=18);
                }

                translate(v = [-20, 8, 0]) {
                    cylinder(h = 4, r = 1.5, center = true, $fn=18);
                }
            }

            union() {
                translate(v = [20, 8, 0]) {
                    cylinder(h = 4, r = 1.5, center = true, $fn=18);
                }

                translate(v = [20, -8, 0]) {
                    cylinder(h = 4, r = 1.5, center = true, $fn=18);
                }
            }
        }
    }
}

module frame() {
    difference () {
        union () {
          cube ([55, 31, 3]);
          translate ([23.5, 26, 0]) 
            cube ([4, 10, 3]);
        }
        union () {
            translate ([14, 15, 0]) 
               cylinder  (h=3, r=8.5 , $fs=0.1 );
              translate ([40, 15, 0]) 
                 cylinder  (h=3, r=8.5 , $fs=0.1 );
              translate ([20, 5, 0]) 
                 cube ([14, 21, 3]);
              translate ([6, 23, 0]) 
                 cylinder  (h=3, r=1.2 , $fs=0.1 );
              translate ([47, 6, 0]) 
                 cylinder  (h=3, r=1.2 , $fs=0.1 );
        }
    }
    translate([23.5, 50, 9])
        difference() {
            translate([0, -16, -4]) {
                translate([2, 4.5, 0])
                    cube([4, 8.5, 10], center=true);
                rotate([0, 90, 0])
                    cylinder(r=5, h=4);
                translate([0, 8, 0])
                    rotate([0, 90, 0])
                        cylinder(r=5, h=4);
            }
            translate([-12, -7, -4]) 
                rotate([0, 90, 0])
                    cylinder(r=2, h=30);
        }
}

module show() {
    translate([0, 0, 3])
        rotate([180,0,0])
            #hcsr04();
    translate([-27.5, -15, 0])
        frame();
}

module print() {
    translate([-27.5, -15, 0])
        frame();
}

print();
// show();
