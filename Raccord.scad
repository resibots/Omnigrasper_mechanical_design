// increase number of faces on rounded faces
//$fn=50;

difference() {
  hull() {
    translate([-40, -22, 0]) cube(size=[80, 44, 5]);
    translate([0, 0, 30]) cylinder(h=3, d=86);
  }

  // radius of the circle on which the holes are placed
  radius_holes_versaball = 35.875;
  // position of the holes to hold the Versaball
  hole1_x = radius_holes_versaball * cos(60);
  hole1_y = radius_holes_versaball * sin(60);
  // digging the holes for screws holding the Versavall
  translate([hole1_x, hole1_y, -2]) cylinder(50, d=4.5);
  translate([hole1_x, -hole1_y, -2]) cylinder(50, d=4.5);
  translate([-hole1_x, hole1_y, -2]) cylinder(50, d=4.5);
  translate([-hole1_x, -hole1_y, -2]) cylinder(50, d=4.5);

  // TODO : add space for the screw's head

  for (x_shift = [-36:12:36]) {
    translate([x_shift, 18, -1]) cylinder(50, d=3.5);
    translate([x_shift, -18, -1]) cylinder(50, d=3.5);
  }

  // transversal hole
  translate([0, 0, 5])
    intersection() {
      translate([0, 0, -5]) rotate([90, 0, 0]) cylinder(h=90, r=25, center=true);
      translate([-50, -50, 0]) cube([100, 100, 30]);
    }

// longitudinal hole
translate([0, 0, 25])
  intersection() {
    rotate([90, 0, 90]) cylinder(h=90, r=20, center=true);
    translate([-50, -50, -30]) cube([100, 100, 30]);
  }
}

