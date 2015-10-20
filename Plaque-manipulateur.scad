// increase number of faces on rounded faces
$fn=100;

circle_diameter=172;
plate_thickness = 5;
motor_width = 54;
rounding_radius = 5;

projection()
difference() {
  hull() {
    for(x=[-95+rounding_radius, 95-rounding_radius]) {
      for(y=[-95+rounding_radius, 95-rounding_radius]) {
        translate([x, y, 0])
        cylinder(r=rounding_radius, h=plate_thickness);
      }
    }
  }

  render()
  union() {
    // Holes to attach to the Youbot
    for(angle=[0:45:315]) {
      translate([circle_diameter/2*cos(angle), circle_diameter/2*sin(angle), -1])
        cylinder(h=plate_thickness+2, d=8);
    }

    // Holes to attach the arm
    for(x_shift=[-24,24]) {
      for(y_shift=[-24,24]) {
        translate([x_shift, y_shift, -1])
          cylinder(h=plate_thickness+2, d=3);
      }
    }

    // Hole to let the robot's cables through
    translate([7, 0-34/2, -1])
      cube([17, 34, plate_thickness+2]);

    // Screw holes to fix the arm's motor holders
    for(x=[-18,18]) {
      for(y=[15:12:45]) {
        translate([x, y+motor_width/2, -1])
          cylinder(h=7, d=3);
      }
    }
    for(x=[-18,18]) {
      for(y=[-15:-12:-45]) {
        translate([x, y-motor_width/2, -1])
          cylinder(h=7, d=3);
      }
    }

    // Extra holes for future use
    for (x=[-75:15:80]) {
      for (y=[-75:15:80]) {
        if ((x<=-35 || y<=-35 || x>=35 || y >=34) &&
            (x<-15 || x>15)) {
          translate([x, y, -1])
          cylinder(h=plate_thickness+2, d=3);
        }
      }
    }
  }
}
