/*
 *  +X/+X counters for Magic: the Gathering
 */

/* [Value] */

value = "+1"; // ["+1","-1","+5","-5","+10","-10","+25","-25","+50","-50","+100","-100"]

/* [Dimensions] */

edge_len                = 20.0; // [0.1:0.1:100.0]
base_thickness          = 1.0;  // [0.1:0.1:100.0]
base_frame_thickness    = 0.5;  // [0.0:0.1:100.0]
label_margin            = 1.0;  // [0.1:0.1:100.0]
label_bump_height       = 1.0;  // [0.1:0.1:100.0]

/* [Hidden] */

base_plate_total_thickness = base_frame_thickness > 0.0
                           ? base_thickness + label_bump_height
                           : base_thickness;
base_plate_dim = [edge_len, edge_len, base_plate_total_thickness];
base_plate_separator_dim = [
    sqrt(2)*edge_len - base_frame_thickness,
    base_frame_thickness,
    base_thickness + label_bump_height
];

label_cutout_edge_len = edge_len - 2*base_frame_thickness;
assert(label_cutout_edge_len > 0);
label_cutout_dim = [label_cutout_edge_len, label_cutout_edge_len, label_bump_height];

label_padding = base_frame_thickness + label_margin;
label_edge_len = (edge_len/2) - 2*label_padding;
assert(label_edge_len > 0);
label_thickness = base_thickness + label_bump_height;
label_dim = [label_edge_len, label_edge_len, label_thickness];


module base_plate() {
    translate([-edge_len/2, -edge_len/2, 0.0]) {
        difference() {
            cube(base_plate_dim);
            translate([base_frame_thickness, base_frame_thickness, base_thickness]) {
                cube(label_cutout_dim);
            }
        }
    }
    rotate([0.0, 0.0, 45.0]) {
        translate([0.0, 0.0, base_plate_separator_dim.z/2]) {
            cube(base_plate_separator_dim, center=true);
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

module pxpx_counter(str) {
    label_offset = edge_len/4;
    
    base_plate();
    translate([-label_offset, label_offset, 0.0]) {
        label_text(str);
    }
    translate([label_offset, -label_offset, 0.0]) {
        label_text(str);
    }
}

pxpx_counter(value);
