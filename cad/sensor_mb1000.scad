$fn=100;

module frame() {
	difference() {
		cube([24, 22, 2], center=true);
		translate([0, 5, 0])
			cube([11, 19, 4], center=true);
		translate([11-1.5-1.0, -10+1.5+1.4, -5])
			cylinder(r=2, h=10);
		translate([-11+1.5+0.95, +10-1.5-3.05, -5])
			cylinder(r=2, h=10);
	}

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
	translate([-12, -16, -4]) 
		rotate([0, 90, 0])
			cylinder(r=2, h=30);
	}
}

module mb1000() {
	translate([0, 0, 2]) {
		difference() {
			cube([22, 20, 1.8], center=true);
			translate([11-1.5-1.0, -10+1.5+1.4, -5])
				cylinder(r=1.5, h=10);
			translate([-11+1.5+0.95, +10-1.5-3.05, -5])
				cylinder(r=1.5, h=10);
		}

		translate([0, 0, 1.8/2])
			cylinder(r=16.35/2, h=14);
	}
}

module show() {
	#mb1000();
	frame();
}

module print() {
	translate([0, 0, 1])
		rotate([0, 180, 0])
			frame();
}

print();
