$fn=100;

//show();
print();

module show() {
 // #battery_box();
 // #bread_board();
chasis_drilled();
#drive();
drag_wheel();
// #nodemcu();
// #bumper_sensor();
}

module print() {
chasis_drilled();
 translate([-70, 0, 0])
 rotate([180, 0, 0])
    drag_wheel();
}

module drag_wheel() {
translate([70, 0, 0])
{
    difference() {
    sphere(r=10);
    translate([0, 0, 6])
        cube([24, 24, 12], center=true);
     translate([0, 0, -20])
        cylinder(r=2, h=40);
     translate([0, 0, -12])
        cylinder(r=4, h=5);
        }
 }
}

module drive() {
    
translate([-70, -70, 26])
    rotate([0, 90, 0])
        motor(1);
    
translate([-70, 70, 26])
    mirror([0, 1, 0])
    rotate([0, 90, 0])
        motor(1);
    
}

module chasis_drilled() {
    difference() {
        chasis();
    translate([70, 0, 0]) {
   translate([0, 0, 6])
     translate([0, 0, -20])
        cylinder(r=2, h=40);
      translate([0, 0, 6])
        cylinder(r=4, h=5);
    }

    // kabelbinder loecher motor 1
       translate([-25, -42.5, 10])
        cube([5, 2, 40], center=true);
    translate([-15, -42.5, 10])
        cube([5, 2, 40], center=true);
    
        // kabelbinder loecher nodemcu
       translate([-49, -27, 10])
        cube([5, 2, 40], center=true);
       translate([-49, +27, 10])
        cube([5, 2, 40], center=true);
    
        
        // kabelbinder loecher battery-box
       translate([0, -35, 10])
         cube([5, 2, 40], center=true);
       translate([-0, +35, 10])
         cube([5, 2, 40], center=true);
    
    // motor kabelloch 1
    translate([-8, 50, 15])
            rotate([90, 0, 0])
              cylinder(r=3.5, h=10);
        
        mirror([0, 1 ,0]) {
            
            // motor kabelloch 2
            translate([-8, 50, 15])
            rotate([90, 0, 0])
              cylinder(r=3.5, h=10);
            
            // kabelbinder loecher motor 1
           translate([-25, -42.5, 10])
                cube([5, 2, 40], center=true);
            translate([-15, -42.5, 10])
                cube([5, 2, 40], center=true);
        }
        
            }
}

module chasis() {

    difference() 
    {
        translate([-20, 0, 0])
            resize([200, 120, 10])
                cylinder(h=20, r=80);
        
        difference() {
            translate([-20, 0, -5])
                resize([180, 90, 30])
                    cylinder(h=20, r=80);
              translate([-100, 0, 5])
                cube([25, 100, 30], center=true);
              translate([60, 0, 5])
                cube([25, 100, 30], center=true);
        }
        translate([-70, 70, 26])
            mirror([0, 1, 0])
                rotate([0, 90, 0])
                    motor(0);
    
        translate([-70, -70, 26])
            rotate([0, 90, 0])
                motor(1);        
   
        nodemcu();
        bumper_sensor();
    }
    
    // motor 1
    difference() {
        translate([-75, 44, 0])
            cube([75, 21, 20]);
    
        translate([-70, 70, 26])
            mirror([0, 1, 0])
                rotate([0, 90, 0])
                    motor(0);
    }
    
    // motor 2
    mirror([0,1,0])
        difference() {
            translate([-75, 44, 0])
                cube([75, 21, 20]);
        
        translate([-70, 70, 26])
            mirror([0, 1, 0])
                rotate([0, 90, 0])
                    motor(0);      
    }
    
    // battery holder
    difference()  {
        translate([0, 0, 10/2])
            cube([65, 90, 10], center=true);
        battery_box();
    }
    
    // nodemcu holder
    difference() {
        translate([-49, 0, 5/2])
            cube([10, 90, 5], center=true);
        nodemcu();
     }
    
    /*
    // bread-board holder
    difference() {
            translate([-98, 0, 18])
                cube([15, 62, 20], center=true);
            bread_board();      
            translate([-94, 0, 15])
                cube([8, 45, 40], center=true);    
        }
    difference() {
        translate([58, 0, 18])
                cube([15, 62, 20], center=true);
        bread_board();
        translate([54, 0, 15])
                cube([8, 45, 40], center=true);  
    }
   */
    /*
       // codebug stand
       translate([-108, 0, 18]) {
           difference() {
            cube([8, 20, 20], center=true);
           translate([0, 0, 10])
             cube([2.4, 15.5, 8], center=true);
           }
       }
    */
 }
module bumper_sensor() {
    translate([-115, 0, 15])
     cube([1.55, 8.9, 21.6], center=true);
}

module battery_box() {
    
    translate([0, 0, 15.7/2+2])
        cube([58, 62.7, 15.7], center=true);
    
    translate([0, 0, 15.7/2-8])
        cube([58-10, 62.7-10, 10], center=true);
    
    translate([-58+30, -62.7/2+30/2, 15.7/2+2])
       cube([15, 30, 15.7], center=true);
}

module nodemcu() {
    translate([-75, 0, 12])
        cube([58.6, 48.2,  20], center=true);
}

module bread_board() {
        translate([-20, 0, 25])
            cube([165, 54.6, 10], center=true);
}

module wheel() {
	translate([11.5, -2, 11])
		union() {
			difference() {
				rotate([90, 0, 0])
					cylinder(h=7.6, r=69/2);

				rotate([90, 0, 0])
					cylinder(h=7.6, r=69/2-5);
			}
			difference()
			{

				rotate([90, 0, 0])
					cylinder(h=7.6, r=69/2-20);	

				rotate([90, 0, 0])
					cylinder(h=8, r=2.2);

			}

			difference() {
			for ( i = [0 : 5] )
			{
				rotate([0, 60 * i, 0, 0])
					translate([0, -3, 0])
						cylinder(h=69/2 - 3, r=2);
			}
			rotate([90, 0, 0])
				cylinder(h=8, r=2.2);
			}
		}
}

module motor(show_wheel) {
	union() {
		cube([23, 21, 37]);
		intersection() {
			translate([11.5, 11.5, 37])
				cylinder(h=30, r=11.5);
	
			translate([0, 3, 37])
				cube([23, 18, 30]);
		}
		translate([11.5-6, 21, 37])
			cube([12, 3, 30]);

		translate([11.5, 0, 11])
			rotate([90, 0, 0])
				cylinder(h=8, r=3);
        
		translate([11.5, 31, 11])
			rotate([90, 0, 0])
				cylinder(h=10, r=4);
        }

	if(show_wheel == 1)
	{
		wheel();
	}
	else if(show_wheel == 2)
	{
		translate([0, -45, 0])
			wheel();
	}
}