// increase number of faces on rounded faces
$fn=100;

module barbed_fitting() {
  length = 20;
  radius = 6.25/2;
  hole_radius = 3.50/2;
  radius_enlargement = 0.5;
  rotate_extrude()
    polygon([
      [hole_radius, 0],
      [radius, 0],
      [radius, length-8],
      [radius+radius_enlargement, length-8],
      [radius, length],
      [hole_radius, length]
      ]);
}

difference() {
  union() {
    rotate([0, 90, 0])
      barbed_fitting();
    rotate([0, -90, 0])
      barbed_fitting();
    rotate([-90, 0, 0])
      barbed_fitting();
  }

  // cleaning the inside-pipes from the union's articafts
  rotate([0, 90, 0])
    cylinder(h=42, r=3.5/2, center=true);
  rotate([-90, 0, 0])
    cylinder(h=21, r=3.5/2);
}

