
module show(parts) {
	chasis_drilled();

	if(edubot_tail == "drag") {
		drag_wheel();
	}
	else if(edubot_tail == "wheel") {
		tail_wheel();
	}

	if(parts==1) {
		#battery_box();
		#gear();
	
		if(edubot_type == "nodemcu") {
			#nodemcu();
		}
		else if (edubot_type == "bboard" || edubot_type == "codebug") {
			#bread_board();
		}
		else if (edubot_type == "codebug") {
			// #codebug();
		}

		if(edubot_sensor == "bumper") {
			#bumper_sensor();
		}
	}

	motor_cover1();
	motor_cover2();
}

module print() {
	chasis_drilled();

	if(edubot_tail == "drag") {
		translate([-140, 0, 0])
			rotate([180, 0, 0])
				drag_wheel();
	}
	else if(edubot_tail == "wheel") {
		translate([-40, 85, 7.5])
			rotate([90, 0, 0])
				tail_wheel();
	}
}

module print_cover() {
	translate([50, 20, 28])
		rotate([180, 0, 0])
			motor_cover1();
	translate([50, -20, 28])
		rotate([180, 0, 0])
			motor_cover2();
}

module print_mb() {
    motor_box1();
    
	translate([50, 20, 28])
		rotate([180, 0, 0])
			motor_cover1();
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

module gear() {
	translate([-70, -70, 26])
		rotate([0, 90, 0])
			motor(0);
	translate([-70, 70, 26])
		mirror([0, 1, 0])
		rotate([0, 90, 0])
			motor(0);
}

module chasis_drilled() {
	difference() {
		chasis();

		if(edubot_tail == "drag") {
			// whole for drag wheel
			translate([70, 0, 0]) {
				translate([0, 0, 6])
					translate([0, 0, -20])
						cylinder(r=2, h=40);
				translate([0, 0, 6])
					cylinder(r=4, h=5);
			}
		}
		else if(edubot_tail == "wheel") {
			translate([71, 0, 5]) {
				rotate([0,0,90]) 
					cube([17, 35, 35], center=true);
				translate([0, 40, 0])
					rotate([90,0,0]) { 
						cylinder(r=2, h=80);
						translate([0, 0, -26])
							cylinder(r=4, h=50);
						translate([0, 0, 58])
							cylinder(r=4, h=50);
					}
			}
		}

		if(edubot_type == "nodemcu") {
		   // zip tie nodemcu
			translate([-92, -27, 10])
				cube([5, 2, 40], center=true);
			translate([-92, +27, 10])
				cube([5, 2, 40], center=true);
		}
        
		// zip tie battery-box
		if(edubot_batbox == "2x2x2" || edubot_batbox == "2x2") {
			translate([0, -38, 10])
				cube([5, 2, 40], center=true);
			translate([-0, +38, 10])
				cube([5, 2, 40], center=true);
		}
		else {
			translate([0, -36, 10])
				cube([5, 2, 40], center=true);
			translate([-0, +36, 10])
				cube([5, 2, 40], center=true);
		}
    
		// cable hole motor 1
		translate([-8, 50, 15])
            rotate([90, 0, 0])
              cylinder(r=3.5, h=10);

   		// drill hole motor 1
		translate([-72.5, 58, -15])
			cylinder(r=2, h=60);
 		translate([1, 58, -15])
			cylinder(r=1.8, h=60);
    
        mirror([0, 1 ,0]) {
            // cable hole motor 2
            translate([-8, 50, 15])
				rotate([90, 0, 0])
				cylinder(r=3.5, h=10);

			// drill hole motor 2
			translate([-72.5, 58, -15])
				cylinder(r=2, h=60);
 			translate([1, 58, -15])
				cylinder(r=1.8, h=60);
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
   
		if(edubot_type == "nodemcu") {
			nodemcu();
		}
		if(edubot_sensor == "bumper") {
			bumper_sensor();
		}
    }

  	if(edubot_sensor == "universal") {
		universal_sensor();
	}

    motor_box1();
    
	difference() {
		translate([0, 58, 0])
			cylinder(r=5, h=15);
       	translate([-70, 70, 26])
            mirror([0, 1, 0])
                rotate([0, 90, 0])
                    motor(0);
 	}

    motor_box2();

    // battery holder
    difference()  {
		if(edubot_batbox == "2x2x2" || edubot_batbox == "2x2") {
			translate([1, 0, 10/2])
				cube([68, 90, 10], center=true);
		}
		else {
			translate([0, 0, 10/2])
				cube([65, 90, 10], center=true);
		}
        battery_box();
    }
    
	if(edubot_type == "nodemcu") {
		// nodemcu holder
		difference() {
			translate([-49, 0, 5/2])
				cube([10, 90, 5], center=true);
			nodemcu();
		}
	}
    
	if(edubot_type == "bboard" || edubot_type == "codebug") {
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
	}

	if(edubot_type == "codebug") {
       // codebug stand
       translate([-108, 0, 18]) {
	 	 difference() {
			cube([8, 20, 20], center=true);
            translate([0, 0, 10])
              cube([2.4, 15.5, 8], center=true);
          }
       }
	}
}

module motor_box1() {
    
    // motor 1
    difference() {
        translate([-72.5, 44, 0])
            cube([72, 29, 15]);

        translate([-70, 70, 26])
        {
            mirror([0, 1, 0])
                rotate([0, 90, 0]) {
                    motor(0);
                    translate([11.5, 0, 11])
                        rotate([90, 0, 0])
                            cylinder(h=8, r=10);
                    translate([11.5, 0, 57])
                        rotate([90, 0, 0])
                            cylinder(h=8, r=10);
                }
             translate([10, 0, -21.5])
                cube([46, 10, 20]);
         }
    }

	// .. lower part
	difference() {
	translate([-72.5, 58, 0])
		cylinder(r=5, h=15);
	   	translate([-70, 70, 26])
            mirror([0, 1, 0])
                rotate([0, 90, 0])
                    motor(0);
 	}
	difference() {
		translate([0, 58, 0])
			cylinder(r=5, h=15);
       	translate([-70, 70, 26])
            mirror([0, 1, 0])
                rotate([0, 90, 0])
                    motor(0);
 	}
}

module motor_box2() {
	mirror([0, 1, 0])
		motor_box1();
}

module motor_cover1() {
	// .. upper part
    difference() {
    	translate([-72.5, 44, 15])
        	cube([72, 29, 13]);
   
        translate([-70, 70, 26]) {
            mirror([0, 1, 0])
                rotate([0, 90, 0]) {
                    motor(0);
                    translate([11.5, 0, 11])
                        rotate([90, 0, 0])
                            cylinder(h=8, r=10);
                    translate([11.5, 0, 57])
                        rotate([90, 0, 0])
                            cylinder(h=8, r=10);
                }
             translate([10, 0, -21.5])
                cube([46, 10, 20]);
        }
	
        // drill hole
		translate([-72.5, 58, -15])
			cylinder(r=2, h=60);
 		translate([1, 58, -15])
			cylinder(r=1.8, h=60);

		// cable hole motor 
		translate([-8, 50, 15])
            rotate([90, 0, 0])
              cylinder(r=3.5, h=10);
     }

    difference() {
	  	translate([-72.5, 58, 15])
			cylinder(r=5, h=13);
 
        translate([-70, 70, 26])
            mirror([0, 1, 0])
                rotate([0, 90, 0])
                    motor(0);
		// drill hole
		translate([-73.5, 58, -15])
			cylinder(r=1.8, h=60);
    }
	difference() {
		translate([0, 58, 15])
			cylinder(r=5, h=13);
       	translate([-70, 70, 26])
            mirror([0, 1, 0])
                rotate([0, 90, 0])
                    motor(0);
 		translate([1, 58, -15])
			cylinder(r=1.8, h=60);
	}
}

module motor_cover2() {
	mirror([0, 1, 0])
		motor_cover1();
}
 
module bumper_sensor() {
	translate([-115, 0, 15])
		cube([1.55, 8.9, 21.6], center=true);
}

module universal_sensor_solid() {
	translate([-112, 0, 10]) {
		cube([10, 4, 9], center=true);
		translate([0, 2, 5])
			rotate([90, 0, 0])  
				cylinder(r=5, h=4);
	}
}

module universal_sensor() {
	difference() {
		universal_sensor_solid();

		translate([-112, 0, 10]) {
			translate([0, 2, 5])
				rotate([90, 0, 0]) { 
					translate([0, 0, -11])
						cylinder(r=2, h=30);
				}
		}
	}
}

module battery_box() {
	if(edubot_batbox == "2x2") {
		translate([0, 0, 31/2+2])
			cube([61.5, 30, 31], center=true);
		translate([0, 0, 31/2-8])
			cube([61.5-8, 30-8, 31], center=true);
	}
	else if(edubot_batbox == "2x2x2") {
		translate([0, -17, 31/2+2])
			cube([57, 31, 31], center=true);
		translate([0, -17, 31/2-8])
			cube([57-8, 30-8, 31], center=true);

		translate([0, 17, 31/2+2])
			cube([57, 31, 31], center=true);
		translate([0, 17, 31/2-8])
			cube([57-8, 30-8, 31], center=true);
	}
	else {
		translate([0, 0, 15.7/2+2])
			cube([58, 62.7, 15.7], center=true);
		translate([0, 0, 15.7/2-8])
			cube([58-10, 62.7-10, 10], center=true);
		translate([-58+30, +62.7/2-30/2, 15.7/2+2])
		   cube([15, 30, 15.7], center=true);
	}
}

module nodemcu() {
    translate([-75, 0, 12])
        cube([58.7, 43.3,  20], center=true);
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
		translate([11.5-6, 0, 37])
			cube([12, 3, 30]);

		translate([11.5, 0, 11])
			rotate([90, 0, 0])
				cylinder(h=8, r=4);
        
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

module tail_wheel()
{
	translate([71, 0, 5]) {
		difference() {
			rotate([0,0,90]) 
				intersection()
				{
					cube([15, 50, 50], center=true);
					sphere(r=16);
				}
			translate([0, 40, 0])
				rotate([90,0,0])  
					cylinder(r=2.25, h=80);
			translate([9, 40, 0])
				rotate([90,0,0])  
					cylinder(r=4, h=80);
			translate([0, 40, 9])
				rotate([90,0,0])  
					cylinder(r=4, h=80);
			mirror(1, 0, 0) 
				translate([9, 40, 0])
					rotate([90,0,0])  
						cylinder(r=4, h=80);
			translate([0, 40, -9])
				rotate([90,0,0])  
					cylinder(r=4, h=80);
		}
	}
}
