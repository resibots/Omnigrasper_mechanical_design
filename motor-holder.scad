// increase number of faces on rounded faces
$fn=100;

/*projection()
rotate([90, 0, 0])*/
difference() {
  translate([0, 21, 0])
    rotate([90, 0, 0])
      linear_extrude(42)
        polygon([
          [0, 0],
          [30, 0],
          [30, 2],
          [2, 2],
          [2, 45],
          [0, 45]
          ]);

  for(y=[-18,18]) {
    for(z=[15:12:45]) {
      translate([-1, y, z])
        rotate([0, 90, 0])
          cylinder(h=4, d=3);
    }
  }

  for(x=[15:12:30]) {
    for(y=[-18,18]) {
      translate([x, y, -1])
        cylinder(h=4, d=3);
    }
  }
}
