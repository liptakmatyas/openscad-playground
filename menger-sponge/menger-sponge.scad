//  Level of Menger sponge
level = 1;

//  Render cross section? Or the sponge?
render_cross_section = false;

//  Rotation around the X axis (angles)
rot_x = 0;  // [-360:0.1:+360]

//  Rotation around the Y axis (angles)
rot_y = 0;  // [-360:0.1:+360]

//  Rotation around the Z axis (angles)
rot_z = 0;  // [-360:0.1:+360]


module menger_sponge(level=1) {
    assert(level >= 0,
        "Level of Menger sponge must be non-negative");

    //  Voxels of a 3x3x3 Menger sponge
    bitmap = [
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

    if (level > 0) {
        //  Level 1 and above, render the voxels out of
        //  third-sized Menger sponges one level lower.
        scale([1/3, 1/3, 1/3]) {
            for (x = [0:2], y = [0:2], z = [0:2]) {
                if (bitmap[x][y][z]) {
                    translate([x, y, z])
                    menger_sponge(level-1);
                }
            }
        }
    }
    else {
        //  A level-0 Menger sponge is just a cube.
        cube();
    }
}

rotate(a=[rot_x, rot_y, rot_z])
translate([-0.5, -0.5, -0.5])
menger_sponge(
    level = level,
    filled = start_inverse ? 0 : 1,
    flip = flip_to_inverse_between_levels
);

