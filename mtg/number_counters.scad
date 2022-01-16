/*
 *  Number counters for Magic: the Gathering
 */

/* [Value] */

value = "100";

/* [Dimensions] */

radius                  = 20.0; // [0.1:0.1:100.0]
base_thickness          = 1.0;  // [0.1:0.1:100.0]
base_frame_thickness    = 1.0;  // [0.0:0.1:100.0]
label_margin            = 1.0;  // [0.1:0.1:100.0]
label_bump_height       = 1.0;  // [0.1:0.1:100.0]

/* [Hidden] */

base_plate_total_thickness = base_frame_thickness > 0.0
                           ? base_thickness + label_bump_height
                           : base_thickness;
base_plate_dim = [radius, radius, base_plate_total_thickness];

label_padding = base_frame_thickness + label_margin;
label_radius = radius - base_frame_thickness;

label_thickness = base_thickness + label_bump_height;
label_edge_len = sqrt(2) * (label_radius - label_margin);
label_dim = [label_edge_len, label_edge_len, label_thickness];

module base_plate() {
    difference() {
        cylinder(base_plate_total_thickness, radius, radius);
        translate([0.0, 0.0, base_plate_total_thickness-label_bump_height]) {
            cylinder(label_bump_height, label_radius, label_radius);
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

module number_counter(str) {
    base_plate();
    translate([0.0, 0.0, 0.0]) {
        label_text(str);
    }
}

number_counter(value);
