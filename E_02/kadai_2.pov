#include "colors.inc"
#include "shapes.inc"
#include "utility.inc"
#include "textures.inc"
#include "woods.inc"

#declare N = 6;
#declare Height = 50;
#declare Default_Color = color rgb <0.5, 0.5, 0.5>;
#declare Purple = color <1, 0.0, 1>;

#declare paper = object{
    box{
        <0, 0, 0>, <1, 1, 0.01>
    }
    pigment{image_map{png "paper.png" map_type 0}}
    rotate <90, 0, 0>
    scale <100, 0.05, 141.4>
    translate <-50, 0.001, -50>
};

#declare mainbody_parts_1 =
prism{
    linear_spline
    0,Height
    N + 1
    #for(i,0,N)
    PtoR(1,360/N*i)
    #end
};

#declare mainbody_parts_2 =
cylinder{
    <0,0,0>,<0,Height,0>,0.3
    texture{
        pigment{Default_Color}
    }
};


#macro mainbody(lead_texture, surface_texture, body_texture)
    union{
        difference {
            object{mainbody_parts_1}
            object{mainbody_parts_1 scale <0.99, 1.01, 0.99>}
            texture{surface_texture}
        }
        difference {
            object{mainbody_parts_1 scale <0.99, 0.99, 0.99>}
            object{mainbody_parts_2}
            texture{body_texture}
        }
        object{mainbody_parts_2 texture{lead_texture}}
    }
#end

#macro pencil(lead_texture, surface_texture, body_texture)
    union{
        mainbody(lead_texture, surface_texture, body_texture)
        intersection{
            object{mainbody(lead_texture, surface_texture, body_texture) translate <0, Height, 0>}
            cone{<0,Height,0>,2.0,<0,Height + 10.0,0>,0}
            cutaway_textures
        }
    }
    translate(<0, -(Height + 10), 0>)
    scale <1.5, 1.5, 1.5>
#end

camera{
    location <-50, 100, -100> // カメラの位置
    look_at <0, 0, 0> // 注視点の位置
    angle 40 // 視角
}
// 光源
light_source{
    <10, 1000, -10> // 光源の位置
    color White // 光源の色
}

plane{
    <0, 1, 0>, 0
    texture{
        T_Wood15
    }
    finish{ambient 0.5}
}

paper

object{
    pencil(pigment{Red}, pigment{Red}, DMFWood1)
    rotate <90, 0, 0>
    rotate <0, -4, 0>
    translate <-23, 1.5, 50>
}

object{
    pencil(pigment{Purple}, pigment{Purple}, DMFWood1)
    rotate <90, 0, 0>
    rotate <0, -10, 0>
    translate <-13, 1.5, 50>
}

object{
    pencil(pigment{Orange}, pigment{Orange}, DMFWood1)
    rotate <90, 0, 0>
    rotate <0, -7, 0>
    translate <5, 1.5, 48>
}

object{
    pencil(pigment{Green}, pigment{Green}, DMFWood1)
    rotate <90, 0, 0>
    rotate <0, -20, 0>
    translate <15, 1.5, 42>
}

background{
    color White
}