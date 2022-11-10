#include "colors.inc"
#include "shapes.inc"
#include "utility.inc"

#declare tetrahedron_angle = 109.4711;
#declare Carbon = union{
    object{
        sphere{ <0.5, 0, 0 >, 0.25} 
        pigment{color Red}
        finish{phong 1}
    }
    object{
        cylinder{<0, 0, 0>, <0.5, 0, 0>, 0.05}
        pigment{color <0.5, 0.5, 0.5>}
    }
};

#declare Hydrogen = union{
    object{
        sphere{ <0.75, 0, 0 >, 0.15}
        pigment{color Navy} 
        finish{phong 1}
    }
    object{
        cylinder{<0, 0, 0>, <0.75, 0, 0>, 0.05}
        pigment{color <0.5, 0.5, 0.5>}
    }
};

#declare half_molecule = union{
    object{
        Carbon
    }
    #for(i, 0, 2)
        object{
            Hydrogen
            rotate <0, 0, 180 - tetrahedron_angle>
            rotate <120 * i, 0, 0>
            translate <0.5, 0, 0>
        }
    #end
};

camera{
    location <10, -10, -10> // カメラの位置
    look_at <0.0, 0, 0> // 注視点の位置
    angle 30 // 視角
}
// 光源
light_source{
    <10, 10, -10> // 光源の位置
    color White // 光源の色
}

object{
    union {
        object{
            half_molecule
        }
        object{
            half_molecule
            rotate <0, 180, 0>
            rotate <180, 0, 0>
        }
    }
}


background{
    color White
}