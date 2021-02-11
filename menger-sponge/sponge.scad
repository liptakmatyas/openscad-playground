/* [Sponge] */

//  Type of sponge
sponge_type = 0;    // [0:Menger sponge,1:diagonal]

//  Level of sponge
level = 1;          //  [0:8]

//  Start with an inverse sponge on level 1?
start_inverse = false;

//  Flip normal/inverse between levels?
flip_to_inverse_between_levels = false;

//  Rotate sponge types between levels? If this is ON, then the sponge type above has no effect, and the sponge pattern below is used instead.
rotate_type_between_levels = false;

//  Rotate between these sponges:
sponge_pattern = [0, 0, 0, 0];  // [0:6]

/* [Position and Rotation] */

//  Center on origin?
center = false;

//  Rotation around the X axis (angles)
rot_x = 0;          // [-360:0.1:+360]

//  Rotation around the Y axis (angles)
rot_y = 0;          // [-360:0.1:+360]

//  Rotation around the Z axis (angles)
rot_z = 0;          // [-360:0.1:+360]

/*  [Hidden]  */

//  Voxels of the different types of 3x3x3 sponges for `filled == 1`.
//
//  The bitmaps are layered as follows in the below definitions:
//  bitmap = [ z2_layer, z1_layer, z0_layer ]
//  zi_layer = [ y2_row, y1_row, y0_row ]
//  yj_row = [x0_voxel, x1_voxel, x2_voxel]
//
//  In other words, the first 3x3 matrix is the top layer, then 3rd on is the
//  bottom layer. The lower left corner of each matrix is on the Z-axis. X/Y
//  grows right and up. So the array is in [z][y][x] order, but z and y are
//  flipped.
//
//  See (i.e. render) the level-1 `diagonal_bitmap` for more details.

menger_bitmap = [
    [
        [ 1, 1, 1 ],
        [ 1, 0, 1 ],
        [ 1, 1, 1 ],
    ],
    [
        [ 1, 0, 1 ],
        [ 0, 0, 0 ],
        [ 1, 0, 1 ],
    ],
    [
        [ 1, 1, 1 ],
        [ 1, 0, 1 ],
        [ 1, 1, 1 ],
    ],
];

diagonal_bitmap = [
    [
        [ 0, 0, 1 ],
        [ 0, 0, 0 ],
        [ 0, 0, 0 ],
    ],
    [
        [ 0, 0, 0 ],
        [ 0, 1, 0 ],
        [ 0, 0, 0 ],
    ],
    [
        [ 0, 0, 0 ],
        [ 0, 0, 0 ],
        [ 1, 0, 0 ],
    ],
];

//  All the bitmaps
//
//  NOTE:   Make sure the order in the customizer dropdown (see top
//          of this file) aligns with the below order or bitmaps.

bitmaps = [
    menger_bitmap,
    diagonal_bitmap,
];

//  Number of bitmaps
n_bitmaps = len(bitmaps);

module sponge(type=0, level=1, filled=1, flip=false, rotate_type=false) {
    assert(level >= 0,
        "Level of sponge must be non-negative");
    assert(filled == 0 || filled == 1,
        "Parameter `filled` must be either 0 or 1");

    if (level > 0) {
        //  If the sponge types are rotated between levels, then get the
        //  current type from the sponge pattern based on the level. Otherwise,
        //  use the specified type for the level.
        //
        //  NOTE:   We're in the `level > 0` case; level 0 is always a cube.
        this_type = rotate_type
            ? sponge_pattern[(level-1) % len(sponge_pattern)]
            : type;
        assert(0 <= this_type && this_type < n_bitmaps,
            concat("Invalid sponge type: ", str(this_type)));

        //  Level 1 and above, render the voxels out of
        //  third-sized sponges one level lower.
        //  Optionally flip to inverse.
        //
        //  NOTE:   It's easy to create 1x1x1 cubes everywhere (e.g. makes
        //          the coordinates simpler). But we want the end result to be
        //          1x1x1, so we scale everything down once this level is done.
        scale([1/3, 1/3, 1/3]) {
            for (x = [0:2], y = [0:2], z = [0:2]) {
                //  This weird [2-z][2-y][x] indexing makes sure that the
                //  bitmap definions above make sense visually and the
                //  3D coordinates make sense here.
                if (bitmaps[this_type][2-z][2-y][x] == filled) {
                    translate([x, y, z])
                    sponge(
                        type,
                        level-1,
                        flip ? 1-filled : filled,
                        flip,
                        rotate_type
                    );
                }
            }
        }
    }
    else {
        //  A level-0 sponge is just a cube, no matter its type.
        cube();
    }
}

//  The sponge is 1x1x1 in size
translation = center ? [-0.5, -0.5, -0.5] : [0,0,0];

//  Log debugging info to console

echo("========================================");

echo("bitmaps:");
for (bm = bitmaps) {
    echo(bm);
}

echo("----------------------------------------");

echo("sponge type", sponge_type);
echo("starting level", level);
echo("start inverse", start_inverse);
echo("flip to inverse between levels", flip_to_inverse_between_levels);
echo("rotate sponge type between levels", rotate_type_between_levels);
if (rotate_type_between_levels) {
    echo("sponge pattern", sponge_pattern);
}

echo("----------------------------------------");

echo("X/Y/Z rotation:", rot_x, rot_y, rot_z);
echo("center", center);

//  Render sponge
rotate(a=[rot_x, rot_y, rot_z])
translate(translation)
sponge(
    type = rotate_type_between_levels ? 0 : sponge_type,
    level = level,
    filled = start_inverse ? 0 : 1,
    flip = flip_to_inverse_between_levels,
    rotate_type = rotate_type_between_levels
);

echo("========================================");

