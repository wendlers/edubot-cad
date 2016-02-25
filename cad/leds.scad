include <parts.scad>;

$fn=100;

module led() {
	translate([0, 0, 3.1])
		cube([54, 10, 2.5], center=true);
		translate([0, 2.5-3.9, 4.3])
			cube([54, 5, 1], center=true);
}

module led_cover() {

	difference() {
	translate([72/2, -43-27/2, 2.1]) {
		// .. upper part
    	difference() {
    		translate([-72.5, 43, 0])
        		cube([72, 27, 3.2]);
   
    	    // drill hole
			translate([-72.5, 58, -15])
				cylinder(r=2, h=60);
 			translate([1, 58, -15])
				cylinder(r=1.8, h=60);

		}
   		 difference() {
		  	translate([-72.5, 58, 0])
				cylinder(r=5, h=3.2);

    	    // drill hole
			translate([-72.5, 58, -15])
				cylinder(r=2, h=60);
 			translate([1, 58, -15])
				cylinder(r=1.8, h=60);
    	}
		difference() {
			translate([0, 58, 0])
				cylinder(r=5, h=3.2);
   	    	// drill hole
			translate([-72.5, 58, -15])
				cylinder(r=2, h=60);
 			translate([1, 58, -15])
				cylinder(r=1.8, h=60);
		}
	}
		led();
		translate([54/2, -5, 2])
			cube([3, 20, 5.6], center=true);
		translate([-54/2, -5, 2])
			cube([3, 20, 5.6], center=true);
	}
}

// led();
led_cover();
