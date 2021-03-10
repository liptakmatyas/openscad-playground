/* [Model] */

//  Camera body visible?
camera_body_visible = true;

//  Lens tube visible?
camera_lens_visible = true;

//  Body cover visible?
camera_body_cover_visible = true;

//  Lens ring visible?
camera_lens_ring_visible = true;

//  Model resolution
model_resolution = 16;          // [8:very low,16:low,64:medium,128:high,256:very high]
$fn = model_resolution;

//  Wall thickness
wall_thickness = 5.0;
cover_thickness = wall_thickness;

/* [Assembly] */

//  Assembly mode
assembly_mode = 0;              // [0:assembled,1:explode,2:3D print]

//  Explode factor
explode_factor = 1.0;           // [0.0:0.01:1.0]

//  Spacing between exploded pieces
spacing_for_explode = 100.0;    // [10.0:200.0]

//  Spacing between pieces for 3D-printing
spacing_for_3dprint = 20.0;     // [1.0:100.0]

/* [Body] */

//  Width of the camera body
body_x_size = 133.0;            // [50.0:0.01:250.0]

//  Depth of the camera body without grip
body_y_size = 54.0;             // [10.0:0.01:100.0]

//  Height of the camera body including the cover
body_z_fullsize = 85.0;         // [20.0:0.01:200.0]

body_z_size = body_z_fullsize - cover_thickness;
body_center_y = body_y_size / 2.0;

//  Radius of the grip
grip_r = 17.5;                  // [5.0:0.01:100.0]

grip_x_size = grip_r * 2.0;
grip_y_size = body_y_size + grip_r;

//  Radius of the holes for the body screws
body_screw_hole_r = 2.0;        // [0.5:0.01:10.0]

//  Depth of the holes for the body screws
body_screw_hole_h = 6.0;        // [0.5:0.01:20.0]

body_screw_tube_r = wall_thickness;
body_screw_tube_h = body_screw_hole_h;
body_screw_sphere_r = wall_thickness;

//  Radius of the hole for the bottom screw
bottom_screw_hole_r = 2.0;      // [0.5:0.01:10.0]

//  Depth of the hole for the bottom screw
bottom_screw_hole_h = 6.0;      // [0.5:0.01:20.0]

bottom_screw_tube_r = bottom_screw_hole_r + wall_thickness;
bottom_screw_tube_h = bottom_screw_hole_h + wall_thickness;

/* [Lens] */

//  Length of the lens tube
lens_y_size = 120.0;            // [10.0:0.01:250.0]

//  Radius of the lens tube
lens_r = 36.0;                  // [0.5:0.01:100.0]

//  X coordinate of the center of the lens
lens_center_x = 47.0;           // [0.5:0.01:200.0]

lens_center_z = body_z_fullsize / 2.0;

//  Thickness of the lens plate
lens_plate_thickness = 3.0;     // [0.1:0.01:10.0]

//  Radius of the holes for the lens plate screw heads
lens_plate_screw_head_r = 2.75; // [0.5:0.01:10.0]

//  Depth of the holes for the lens plate screw heads
lens_plate_screw_head_h = 3.0;  // [0.1:0.01:20.0]

//  Radius of the holes for the lens plate screws
lens_plate_screw_hole_r = 0.5;  // [0.1:0.01:10.0]

//  Depth of the holes for the lens plate screws
lens_plate_screw_hole_h = 2.0;  // [0.1:0.01:20.0]

lens_plate_size = 2 * lens_r;
lens_plate_screw_tube_r = wall_thickness;
lens_plate_screw_tube_h = lens_plate_screw_hole_h + lens_plate_screw_head_h;

/* [Body cover] */

//  Width of the flash
flash_x_size = 50.0;            // [1.0:0.01:100.0]

//  Height of the flash
flash_z_size = 10.0;            // [1.0:0.01:100.0]

flash_y_size = body_y_size;
flash_center_x = lens_center_x;
flash_center_y = body_center_y;
flash_center_z = cover_thickness + (flash_z_size / 2.0);

//  Radius of the holes for the body cover screw heads
cover_screw_head_r = 2.75;      // [0.5:0.01:10.0]

//  Depth of the holes for the body cover screw heads
cover_screw_head_h = 3.0;       // [0.1:0.01:20.0]

//  Radius of the holes for the body cover screws
cover_screw_hole_r = 0.5;       // [0.1:0.01:10.0]

cover_screw_hole_h = cover_thickness - cover_screw_head_h;

/* [Lens ring] */

//  Width of the lens ring
lens_ring_y_size = 35.0;        // [1.0:0.01:50.0]

//  Length of the end of the lens tube after the ring
lens_ring_y_offset = 12.0;      // [0.0:0.01:50.0]

lens_ring_r = 85.0 / 2.0;

/* [Hidden] */

body_screw_back_left_pos =
    [ body_screw_tube_r, body_screw_tube_r, 0.0 ];
body_screw_back_right_pos =
    [ body_x_size - body_screw_tube_r, body_screw_tube_r, 0.0 ];
body_screw_front_left_pos =
    [ body_screw_tube_r, body_y_size - body_screw_tube_r, 0.0 ];
body_screw_front_right_pos = // this is the corner
    [ body_x_size - body_screw_tube_r, body_y_size - body_screw_tube_r, 0.0 ];
body_screw_front_grip_pos = // this is in the middle of the grip
    [ body_x_size - grip_r, body_y_size, 0.0 ];

bottom_screw_pos =
    [ lens_center_x, body_center_y, 0.0 ];

//  NOTE:   These coordinates are when the lens plate is lying flat on the
//          XY-plane.
lens_plate_screw_bottom_left =
    [ lens_plate_screw_tube_r, lens_plate_screw_tube_r, 0.0 ];
lens_plate_screw_bottom_right =
    [ lens_plate_size - lens_plate_screw_tube_r, lens_plate_screw_tube_r, 0.0 ];
lens_plate_screw_top_left =
    [ lens_plate_screw_tube_r, lens_plate_size - lens_plate_screw_tube_r, 0.0 ];
lens_plate_screw_top_right =
    [ lens_plate_size - lens_plate_screw_tube_r, lens_plate_size - lens_plate_screw_tube_r, 0.0 ];

//  ----

module curve_to_cylinder(h, r, alpha) {
    y = r * sin(alpha);
    s = 1 / (1 - sin(alpha));

    R = y * s;
    x = r * s * cos(alpha);

    difference() {
        cube([ x, y, h ]);
        translate([ x, R, 0.0 ])
            cylinder(h = h, r = R);
    }
}

module grip_solid(z_size) {
    union() {
        translate([ body_x_size - grip_r, body_y_size, 0.0 ]) {
            cylinder(h = z_size, r = grip_r);
            translate([ 0.0, 0.0, z_size ])
                rotate([ 180.0, 0.0, 180.0 ])
                curve_to_cylinder(h = z_size, r = grip_r, alpha = 30);
        }
    }
}

module body_with_grip_solid(z_size) {
    union() {
        cube([ body_x_size, body_y_size, z_size ]);
        grip_solid(z_size);
    }
}

module missing_corners(z_size) {
    //  back left
    cube([ body_screw_tube_r, body_screw_tube_r, z_size ]);

    //  back right
    translate([ body_x_size - body_screw_tube_r, 0.0, 0.0 ])
        cube([ body_screw_tube_r, body_screw_tube_r, z_size ]);

    //  front left
    translate([ 0.0, body_y_size - body_screw_tube_r, 0.0 ])
        cube([ body_screw_tube_r, body_screw_tube_r, z_size ]);
}

module body_with_grip(z_size) {
    difference() {
        body_with_grip_solid(z_size);
        missing_corners(z_size);
    }
}

module corner(z_size) {
    cylinder(h = z_size, r = wall_thickness);
}

module camera_body() {

    module body_inner_hole() {
        //  NOTE:   No top wall in +Z direction, that's why only one wall
        //          thickness is subtracted.
        translate([ wall_thickness, wall_thickness, wall_thickness ])
            cube([  body_x_size - 2.0 * wall_thickness,
                    body_y_size - 2.0 * wall_thickness,
                    body_z_size - 1.0 * wall_thickness ]);
    }

    module inner_corner() {
        translate([ wall_thickness, wall_thickness, wall_thickness ])
            cylinder(h = body_z_size - wall_thickness, r = wall_thickness);
    }

    module body_screw_inner_corner() {
        h = body_screw_tube_h + body_screw_sphere_r + wall_thickness;
        difference() {
            translate([ 0.0, 0.0, -h ]) {
                union() {
                    cylinder(h = h, r = body_screw_tube_r);
                    curve_to_cylinder(h = h, r = body_screw_tube_r, alpha = 30);
                    translate([ 0.0, 0.0, h ])
                        rotate([ 0.0, 180.0, 0.0 ])
                        rotate([ 0.0, 0.0, 90.0 ])
                        curve_to_cylinder(h = h, r = body_screw_tube_r, alpha = 30);
                }
            }

            translate([ body_screw_sphere_r, body_screw_sphere_r, -h ])
                sphere(r = sqrt(2) * body_screw_sphere_r);
        }
    }

    module body_screw_hole() {
        translate([ 0.0, 0.0, body_screw_tube_h - body_screw_hole_h ])
            cylinder(h = body_screw_hole_h, r = body_screw_hole_r);
    }

    module bottom_screw_tube() {
        cylinder(h = bottom_screw_tube_h, r = bottom_screw_tube_r);
    }

    module bottom_screw_hole() {
        cylinder(h = bottom_screw_hole_h, r = bottom_screw_hole_r);
    }

    module lens_plate_screw_hole() {
        cylinder(h = wall_thickness, r = body_screw_hole_r);
    }

    //  ----

    difference() {
        union() {
            //  Rough shell
            difference() {
                body_with_grip(body_z_size);
                body_inner_hole();
            }

            translate(body_screw_back_left_pos) {
                difference() {
                    corner(body_z_size);
                    inner_corner();
                }

                translate([ 0.0, 0.0, body_z_size ])
                    body_screw_inner_corner();
            }

            translate(body_screw_back_right_pos)
                rotate([ 0.0, 0.0, 90.0 ]) {
                    difference() {
                        corner(body_z_size);
                        inner_corner();
                    }

                    translate([ 0.0, 0.0, body_z_size ])
                        body_screw_inner_corner();
                }

            translate(body_screw_front_left_pos)
                rotate([ 0.0, 0.0, -90.0 ]) {
                    difference() {
                        corner(body_z_size);
                        inner_corner();
                    }

                    translate([ 0.0, 0.0, body_z_size ])
                        body_screw_inner_corner();
                }

            translate(body_screw_front_right_pos)
                rotate([ 0.0, 0.0, 180.0 ]) {
                    difference() {
                        corner(body_z_size);
                        inner_corner();
                    }
                }

            translate(bottom_screw_pos)             bottom_screw_tube();
        }

        //  Screw holes
        translate(body_screw_back_left_pos)
            translate([ 0.0, 0.0, body_z_size - body_screw_tube_h ])
            body_screw_hole();
        translate(body_screw_back_right_pos)
            translate([ 0.0, 0.0, body_z_size - body_screw_tube_h ])
            body_screw_hole();
        translate(body_screw_front_left_pos)
            translate([ 0.0, 0.0, body_z_size - body_screw_tube_h ])
            body_screw_hole();
        translate(body_screw_front_grip_pos)
            translate([ 0.0, 0.0, body_z_size - body_screw_tube_h ])
            body_screw_hole();

        translate(bottom_screw_pos)             bottom_screw_hole();

        translate([ lens_center_x - lens_r, body_y_size, lens_center_z - lens_r ])
            rotate([ 90.0, 0.0, 0.0 ]) {
                translate(lens_plate_screw_bottom_left)     lens_plate_screw_hole();
                translate(lens_plate_screw_bottom_right)    lens_plate_screw_hole();
                translate(lens_plate_screw_top_left)        lens_plate_screw_hole();
                translate(lens_plate_screw_top_right)       lens_plate_screw_hole();
            }
    }
}

module camera_body_cover() {

    module cover_screw() {
        cylinder(h = cover_screw_hole_h, r = cover_screw_hole_r);

        translate([ 0.0, 0.0, cover_screw_hole_h ])
            cylinder(h = cover_screw_head_h, r = cover_screw_head_r);
    }

    module flash() {
        translate([ flash_center_x, flash_center_y, cover_thickness ])
            scale([ flash_x_size / 2.0, flash_y_size / 2.0, flash_z_size ])
            cylinder(h = 1.0, r1 = 1.0, r2 = 0.8);
    }

    //  ----


    difference() {
        union() {
            body_with_grip(cover_thickness);

            translate(body_screw_back_left_pos)     corner(cover_thickness);
            translate(body_screw_back_right_pos)    corner(cover_thickness);
            translate(body_screw_front_left_pos)    corner(cover_thickness);
            translate(body_screw_front_grip_pos)    corner(cover_thickness);
        }

        //  Screw holes
        translate(body_screw_back_left_pos)     cover_screw();
        translate(body_screw_back_right_pos)    cover_screw();
        translate(body_screw_front_left_pos)    cover_screw();
        translate(body_screw_front_grip_pos)    cover_screw();
    }

    flash();
}

module camera_lens() {

    module lens_plate_screw() {
        cylinder(h = lens_plate_screw_hole_h, r = lens_plate_screw_hole_r);

        translate([ 0.0, 0.0, lens_plate_screw_hole_h ])
            cylinder(h = lens_plate_screw_head_h, r = lens_plate_screw_head_r);
    }

    difference() {
        union() {
            difference() {
                //  Lens plate
                cube([ lens_plate_size, lens_plate_size, lens_plate_thickness ]);

                //  Cut corners
                cube([ lens_plate_screw_tube_r, lens_plate_screw_tube_r, lens_plate_thickness ]);
                translate([ lens_plate_size - lens_plate_screw_tube_r, 0.0, 0.0 ])
                    cube([ lens_plate_screw_tube_r, lens_plate_screw_tube_r, lens_plate_thickness ]);
                translate([ 0.0, lens_plate_size - lens_plate_screw_tube_r, 0.0 ])
                    cube([ lens_plate_screw_tube_r, lens_plate_screw_tube_r, lens_plate_thickness ]);
                translate([ lens_plate_size - lens_plate_screw_tube_r, lens_plate_size - lens_plate_screw_tube_r, 0.0 ])
                    cube([ lens_plate_screw_tube_r, lens_plate_screw_tube_r, lens_plate_thickness ]);
            }

            //  Lens plate screws
            translate(lens_plate_screw_bottom_left)     corner(lens_plate_screw_tube_h);
            translate(lens_plate_screw_bottom_right)    corner(lens_plate_screw_tube_h);
            translate(lens_plate_screw_top_left)        corner(lens_plate_screw_tube_h);
            translate(lens_plate_screw_top_right)       corner(lens_plate_screw_tube_h);

            //  Lens tube
            translate([ lens_r, lens_r, 0.0 ])
                cylinder(h = lens_y_size, r = lens_r);
        }

        //  Lens plate screw holes
        translate(lens_plate_screw_bottom_left)     lens_plate_screw();
        translate(lens_plate_screw_bottom_right)    lens_plate_screw();
        translate(lens_plate_screw_top_left)        lens_plate_screw();
        translate(lens_plate_screw_top_right)       lens_plate_screw();

        //  Lens tube hole
        translate([ lens_r, lens_r, 0.0 ])
            cylinder(h = lens_y_size - wall_thickness, r = lens_r - wall_thickness);
    }
}

module camera_lens_ring() {
        difference() {
            cylinder(h = lens_ring_y_size, r = lens_ring_r);
            cylinder(h = lens_ring_y_size, r = lens_r);
        }
}


//
//  Position and rotation for each piece based on the current `assembly_mode`.
//
//  NOTE:   The order of the values must be in sync with the description of the
//          `assembly_mode` values.
//

function explode_spacing() = explode_factor * spacing_for_explode;

//  Camera body is always in the same place
function camera_body_pos() = [ 0.0, 0.0, 0.0 ];
function camera_body_rot() = [ 0.0, 0.0, 0.0 ];

function camera_body_cover_pos() = [
    //  assembled
    [ 0.0, 0.0, body_z_size ],

    //  explode
    [ 0.0, 0.0, body_z_size + explode_spacing() ],

    //  3D print
    [ 0.0, grip_y_size + spacing_for_3dprint, 0.0 ],
][assembly_mode];

function camera_body_cover_rot() = [
    //  assembled
    [ 0.0, 0.0, 0.0 ],

    //  explode
    [ 0.0, 0.0, 0.0 ],

    //  3D print
    [ 0.0, 0.0, 0.0 ],
][assembly_mode];

function camera_lens_pos() = [
    //  assembled
    [ lens_center_x - lens_r, body_y_size, lens_center_z + lens_r ],

    //  explode
    [
        lens_center_x - lens_r,
        body_y_size + explode_spacing(),
        lens_center_z + lens_r
    ],

    //  3D print
    [ body_x_size + spacing_for_3dprint, 0.0, 0.0 ],
][assembly_mode];

function camera_lens_rot() = [
    //  assembled
    [ -90.0, 0.0, 0.0 ],

    //  explode
    [ -90.0, 0.0, 0.0 ],

    //  3D print
    [ 0.0, 0.0, 0.0 ],
][assembly_mode];

function camera_lens_ring_pos() = [
    //  assembled
    [
        lens_center_x,
        body_y_size + lens_y_size - lens_ring_y_size - lens_ring_y_offset,
        lens_center_z
    ],

    //  explode
    [
        lens_center_x,
        (body_y_size + explode_spacing()) +
            lens_y_size - lens_ring_y_size - lens_ring_y_offset + explode_spacing(),
        lens_center_z
    ],

    //  3D print
    [
        lens_ring_r + body_x_size + spacing_for_3dprint,
        lens_ring_r + lens_plate_size + spacing_for_3dprint,
        0.0
    ],
][assembly_mode];

function camera_lens_ring_rot() = [
    //  assembled
    [ -90.0, 0.0, 0.0 ],

    //  explode
    [ -90.0, 0.0, 0.0 ],

    //  3D print
    [ 0.0, 0.0, 0.0 ],
][assembly_mode];

if (camera_body_visible) {
    color("blue") {
        translate(camera_body_pos()) {
            rotate(camera_body_rot()) {
                camera_body();
            }
        }
    }
}

if (camera_body_cover_visible) {
    color("red") {
        translate(camera_body_cover_pos()) {
            rotate(camera_body_cover_rot()) {
                camera_body_cover();
            }
        }
    }
}

if (camera_lens_visible) {
    color("green") {
        translate(camera_lens_pos()) {
            rotate(camera_lens_rot()) {
                camera_lens();
            }
        }
    }
}

if (camera_lens_ring_visible) {
    color("yellow") {
        translate(camera_lens_ring_pos()) {
            rotate(camera_lens_ring_rot()) {
                camera_lens_ring();
            }
        }
    }
}

