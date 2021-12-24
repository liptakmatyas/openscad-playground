/*
 *  Text counters for Magic: the Gathering
 */

/* [Label] */

label = "Wizard";

/* [Dimensions] */

width                   = 20.0; // [0.1:0.1:100.0]
height                  = 5.0;  // [0.1:0.1:100.0]
base_thickness          = 1.0;  // [0.1:0.1:100.0]
base_frame_thickness    = 0.5;  // [0.0:0.1:100.0]
label_margin            = 0.5;  // [0.1:0.1:100.0]
label_bump_height       = 1.0;  // [0.1:0.1:100.0]

/* [Hidden] */

base_plate_total_thickness = base_frame_thickness > 0.0
                           ? base_thickness + label_bump_height
                           : base_thickness;
base_plate_dim = [width, height, base_plate_total_thickness];

label_cutout_width = width - 2*base_frame_thickness;
label_cutout_height = height - 2*base_frame_thickness;
label_cutout_dim = [label_cutout_width, label_cutout_height, label_bump_height];

label_padding = base_frame_thickness + label_margin;
label_width = width - 2*label_padding;
label_height = height - 2*label_padding;
label_thickness = base_thickness + label_bump_height;
label_dim = [label_width, label_height, label_thickness];

module base_plate() {
    translate([-width/2, -height/2, 0.0]) {
        difference() {
            cube(base_plate_dim);
            translate([base_frame_thickness, base_frame_thickness, base_thickness]) {
                cube(label_cutout_dim);
            }
        }
    }
}

module label_text(str) {
    resize(label_dim) {
        linear_extrude(label_thickness) {
            text(str, 10, "FreeMono:style=Bold", halign="center", valign="center");
        }
    }
}

module text_counter(str) {
    base_plate();
    label_text(str);
}

text_counter(label);
