// increase number of faces on rounded faces
$fn=100;

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
        translate([39.55, 0, 0])
          polygon([[0, 0], [width, 0], [width, height-chamfer], [width-chamfer, height], [chamfer, height], [0, height-chamfer]]);

    // junction pipe to the Versaball
    pipe_height = 8;
    hole_radius = 11.80/2;
    pipe_radius = 11;
    chamfer = 0.5;
    seal_inner_radius = 17.46/2;
    seal_thickness = 2.55; // the 3/32 inches theoretical value was
                           // underestimating the real one
    translate([0, 0, 13])
      rotate_extrude()
        polygon([
          [hole_radius, 0],
          [pipe_radius, 0],
          [pipe_radius, 4-0.5*seal_thickness],
          [seal_inner_radius, 4-0.5*seal_thickness],
          [seal_inner_radius, 4+seal_thickness],
          [pipe_radius, 4+seal_thickness],
          [pipe_radius, pipe_height-chamfer],
          [pipe_radius-chamfer, pipe_height],
          [hole_radius, pipe_height]
          ]);

    // junction to plug the vacuum tube
    junction_radius = 6.25/2;
    junction_hole_radius = 3.50/2;
    junction_enlargement = 0.5;
    translate([40, 0, 6])
      rotate([0, 90, 0])
        rotate_extrude()
          polygon([
            [junction_hole_radius, 0],
            [junction_radius, 0],
            [junction_radius, 8],
            [junction_radius+junction_enlargement, 8],
            [junction_radius, 16],
            [junction_hole_radius, 16]
            ]);
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
  // wall thickness : 3mm
  // diameter of the screw head is 7mm but we take 9.2 mm as we add washers shich
  // external diameter is 9mm.
  translate([hole1_x, hole1_y, -1]) cylinder(11, d=9.2);
  translate([hole1_x, -hole1_y, -1]) cylinder(11, d=9.2);
  translate([-hole1_x, hole1_y, -1]) cylinder(11, d=9.2);
  translate([-hole1_x, -hole1_y, -1]) cylinder(11, d=9.2);

    // holes to attach this piece to the arm
  for (x_shift = [-36:12:36]) {
    translate([x_shift, 18, -1]) cylinder(h=50, d=3);
    translate([x_shift, -18, -1]) cylinder(h=50, d=3);

    translate([x_shift, 18, 3]) cylinder(h=15, d=5.6);
    translate([x_shift, -18, 3]) cylinder(h=15, d=5.6);
  }

  // Air ducts through the piece
  small_air_duct_radius = 3.5/2;
  translate([0, 0, 6])
  rotate([0, 90, 0])
  cylinder(h=100, r=small_air_duct_radius);

  wide_air_duct_radius = 11.80/2;
  translate([0, 0, 6-small_air_duct_radius])
  cylinder(h=50, r=wide_air_duct_radius);
}