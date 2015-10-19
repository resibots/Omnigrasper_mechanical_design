// increase number of faces on rounded faces
$fn=100;

circle_diameter=172;
plate_thickness = 5;

projection()
difference() {
  linear_extrude(plate_thickness)
    square(190, center=true);

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

  // Hole to let the robo's cables through
  translate([20-17/2, 0-34/2, -1])
    cube([17, 34, plate_thickness+2]);

}
