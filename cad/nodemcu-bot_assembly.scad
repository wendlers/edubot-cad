include <parts.scad>;

$fn=100;

edubot_type="nodemcu";
edubot_sensor="universal";
edubot_batbox="1x4";
edubot_tail="wheel";

if($t >= 0) {
	chasis_drilled();
}

if($t >= 0.1) {
	tail_wheel();
}

if($t >= 0.2) {
	#gear();
}

if($t >= 0.3) {
	motor_cover1();
	motor_cover2();
}

if($t >= 0.4) {
	motor_cover1();
	translate([-70, +85, 5])
		wheel();
	translate([-70, -75, 5])
		wheel();
}

if($t >= 0.5) { 
	#battery_box();
}

if($t >= 0.6) {
	#nodemcu();
}

