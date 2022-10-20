#include "colors.inc"
#include "shapes.inc"
#include "../utility.inc"
#include "textures.inc"
#include "woods.inc"


#declare roll_radius = 0.1;
#declare roll_space = 0.25;

#macro roll(xpos, ypos, zpos)
object{
    sphere{<0,0,0>, roll_radius}
    translate <xpos, ypos, zpos>
}
#end

#declare roll_one =
object{
    roll(0, 0, 0)
};

#declare roll_two =
union{
    roll(-roll_space, 0, -roll_space)
    roll( roll_space, 0,  roll_space)
};

#declare roll_three =
union{
    object{roll_one}
    object{roll_two}
};

#declare roll_four =
union{
    roll(-roll_space, 0, -roll_space)
    roll(-roll_space, 0,  roll_space)
    roll(+roll_space, 0, -roll_space)
    roll(+roll_space, 0,  roll_space)
};

#declare roll_five =
union{
    object{roll_one}
    object{roll_four}
};

#declare roll_six =
union{
    roll(-roll_space, 0, 0 - roll_space)
    roll(-roll_space, 0, 0             )
    roll(-roll_space, 0, 0 + roll_space)
    roll(+roll_space, 0, 0 - roll_space)
    roll(+roll_space, 0, 0             )
    roll(+roll_space, 0, 0 + roll_space)
};

#declare roll_number=array[6]{roll_one, roll_two, roll_three, roll_four, roll_five, roll_six};

#macro body()
    object{
        intersection{
            box{<0,0,0>,<1, 1, 1>}
            sphere{<0.5, 0.5, 0.5>, 0.77}
        }
        translate <-0.5, -0.5, -0.5>
    }
#end

#macro dice(body_material, roll_material)
    difference{
        object{object{body()} material{body_material}}
        object{object{roll_number[0]} material{roll_material}                  translate <0.0, 0.5, 0.0>}
        object{object{roll_number[1]} material{roll_material} rotate<0, 0, 90> translate <0.5, 0.0, 0.0>}
        object{object{roll_number[2]} material{roll_material} rotate<90, 0, 0> translate <0.0, 0.0, 0.5>}
        object{object{roll_number[3]} material{roll_material} rotate<90, 0, 0> translate <0.0, 0.0, -0.5>}
        object{object{roll_number[4]} material{roll_material} rotate<0, 0, 90> translate <-0.5, 0.0, 0.0>}
        object{object{roll_number[5]} material{roll_material}                  translate <0.0, -0.5, 0.0>}
        // #for (i, 0, 5)
        //     object{object{roll_number[i]} material{roll_material} 
        //     #if (i = 0)
        //         translate <0.0, 0.5, 0.0>
        //     #end
        //     #if (i = 1)
        //         rotate<0, 0, 90>
        //         translate <0.5, 0.0, 0.0>
        //     #end
        //     #if (i = 2)
        //         rotate<90, 0, 0>
        //         translate <0.0, 0.0, 0.5>
        //     #end
        //     #if (i = 3)
        //         rotate<90, 0, 0>
        //         translate <0.0, 0.0, -0.5>
        //     #end
        //     #if (i = 4)
        //         rotate<0, 0, 90>
        //         translate <-0.5, 0.0, 0.0>
        //     #end
        //     #if (i = 5)
        //         translate <0.0, -0.5, 0.0>
        //     #end

        //     }
            
            
        // #end
    }
#end
camera{
    location <-10, 10, 10> // カメラの位置
    look_at <0.5, 0, 0.5> // 注視点の位置
    angle 40 // 視角
}
// 光源
light_source{
    <100, 1000, 100> // 光源の位置
    color White // 光源の色
}


object{
    dice(
        material {
            texture {
                pigment { color rgbf <1, 0, 0, 0.6> }
                finish { specular 0.3 roughness 0.08 }
            }
            interior { ior 1.5 caustics 1}
        },
        material {
            texture {
                pigment { color rgbf <1, 1, 1, 0.0> }
            }
        }
    )
    rotate<0, 0, 180>
    translate <2, 0.5, 2>
}

object{
    dice(
        material {
            texture {
                pigment { color rgbf <0, 1, 0, 0.6> }
                finish { specular 0.3 roughness 0.08 }
            }
            interior { ior 1.5 caustics 1}
        },
        material {
            texture {
                pigment { color rgbf <1, 1, 1, 0.0> }
            }
        }
    )
    rotate<0, 0, 90>
    translate <0, 0.5, 0>
}

object{
    dice(
        material {
            texture {
                pigment { color rgbf <0, 0, 1, 0.6> }
                finish { specular 0.3 roughness 0.08 }
            }
            interior { ior 1.5 caustics 1}
        },
        material {
            texture {
                pigment { color rgbf <1, 1, 1, 0.0> }
            }
        }
    )
    rotate<270, 0, 0>
    translate <1.5, 0.5, 0.5>
}

plane{
    <0, 1, 0>, 0
    texture{
        T_Wood15
    }
    finish{ambient 0.5}
}

background{
    color White
}