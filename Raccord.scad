// increase number of faces on rounded faces
//$fn=50;

translate([0, 60, 0])
difference() {
  union() {
    hull() {
      translate([-40, -22, 0]) cube(size=[80, 44, 5]);
      translate([0, 0, 10]) cylinder(h=3, d=86);
    }
    height = 1.5;
    width = 2.3;
    chamfer = 0.5; // 0.5 mm of chamfer
    translate([0, 0, 13])
      rotate_extrude()
        translate([39, 0, 0])
          polygon([[0, 0], [width, 0], [width, height-chamfer], [width-chamfer, height], [chamfer, height], [0, height-chamfer]]);
  }

  // radius of the circle on which the holes are placed
  radius_holes_versaball = 35.875;
  // position of the holes to hold the Versaball
  hole1_x = radius_holes_versaball * cos(60);
  hole1_y = radius_holes_versaball * sin(60);

  // digging the holes for screws holding the Versavall
  translate([hole1_x, hole1_y, -1]) cylinder(50, d=4);
  translate([hole1_x, -hole1_y, -1]) cylinder(50, d=4);
  translate([-hole1_x, hole1_y, -1]) cylinder(50, d=4);
  translate([-hole1_x, -hole1_y, -1]) cylinder(50, d=4);

  // Screw head's holes for the Versaball
  translate([hole1_x, hole1_y, -1]) cylinder(11, d=7);
  translate([hole1_x, -hole1_y, -1]) cylinder(11, d=7);
  translate([-hole1_x, hole1_y, -1]) cylinder(11, d=7);
  translate([-hole1_x, -hole1_y, -1]) cylinder(11, d=7);

  // TODO : ajouter une rigole pour le maintien circulaire de la versaball

  // TODO : ajouter un conduit d'air

  // holes to attach this piece to the arm
  for (x_shift = [-36:12:36]) {
    translate([x_shift, 18, -1]) cylinder(h=50, d=3);
    translate([x_shift, -18, -1]) cylinder(h=50, d=3);

    translate([x_shift, 18, 3]) cylinder(h=15, d=5.6);
    translate([x_shift, -18, 3]) cylinder(h=15, d=5.6);
  }
}

