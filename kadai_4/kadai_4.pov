#include "colors.inc"
#include "shapes.inc"
#include "../utility.inc"
#include "textures.inc"
#include "woods.inc"
#include "glass.inc"
#include "skies.inc"

#declare BallRadius = 0.05;
#declare BallColor = Orange;

#declare BP = array[4];
#declare BP[0] = <0, 0.15>;
#declare BP[3] = <0.3, 0.02>;
#declare BP[1] = BP[0] + PtoR(0.2, 0);
#declare BP[2] = BP[3] + PtoR(0.1, 180);

#declare TMP = array[4];
#declare TMP[0] = BP[3];
#declare TMP[3] = <0.4, 0.3>;
#declare TMP[1] = TMP[0] + PtoR(0.1, 0);
#declare TMP[2] = TMP[3] + PtoR(0.2, -90);

#declare BP = Merge_Arrays(BP, TMP);

#declare TMP = array[4];
#declare TMP[0] = BP[7];
#declare TMP[3] = BP[7] + <0.0, 0.9>;
#declare TMP[1] = TMP[0] + PtoR(0.1, -90);
#declare TMP[2] = TMP[3] + PtoR(0.2, -90);

#declare BP = Merge_Arrays(BP, TMP);

#declare TMP = array[4];
#declare TMP[0] = BP[11];
#declare TMP[3] = BP[11] + <-0.27, 1.4>;
#declare TMP[1] = TMP[0] + PtoR(0.4, 90);
#declare TMP[2] = TMP[3] + PtoR(0.9, -90);

#declare BP = Merge_Arrays(BP, TMP);

#declare TMP = array[4];
#declare TMP[0] = BP[15];
#declare TMP[3] = BP[15] + <0.0, 0.12>;
#declare TMP[1] = TMP[0] + PtoR(0.1, 0);
#declare TMP[2] = TMP[3] + PtoR(0.1, -90);

#declare BP = Merge_Arrays(BP, TMP);

#declare TMP = array[4];
#declare TMP[0] = BP[19];
#declare TMP[3] = BP[19] + <-0.03, 0.06>;
#declare TMP[1] = TMP[0] + PtoR(0.01, 60);
#declare TMP[2] = TMP[3] + PtoR(0.05, 0);

#declare BP = Merge_Arrays(BP, TMP);

#declare TMP = array[4];
#declare TMP[0] = BP[23];
#declare TMP[3] = BP[23] + <0.0, -0.18>;
#declare TMP[1] = TMP[0] + PtoR(0.01, 90);
#declare TMP[2] = TMP[3] + PtoR(0.05, -90);

#declare BP = Merge_Arrays(BP, TMP);

#declare TMP = array[4];
#declare TMP[0] = BP[27];
#declare TMP[3] = BP[27] + <0.25, -1.4>;
#declare TMP[1] = TMP[0] + PtoR(0.9, -90);
#declare TMP[2] = TMP[3] + PtoR(0.4, 90);

#declare BP = Merge_Arrays(BP, TMP);

#declare TMP = array[4];
#declare TMP[0] = BP[31];
#declare TMP[3] = BP[31] + <0.0, -1.0>;
#declare TMP[1] = TMP[0] + PtoR(0.2, -90);
#declare TMP[2] = TMP[3] + PtoR(0.1, -90);

#declare BP = Merge_Arrays(BP, TMP);

#declare TMP = array[4];
#declare TMP[0] = BP[35];
#declare TMP[3] = <0.3, 0.17>;
#declare TMP[1] = TMP[0] + PtoR(0.01, -90);
#declare TMP[2] = TMP[3] + PtoR(0.05, 0);

#declare BP = Merge_Arrays(BP, TMP);

#declare TMP = array[4];
#declare TMP[0] = BP[39];
#declare TMP[3] = <0, 0.3>;
#declare TMP[1] = TMP[0] + PtoR(0.1, 180);
#declare TMP[2] = TMP[3] + PtoR(0.2, 0);

#declare BP = Merge_Arrays(BP, TMP);

#declare BottleBP = BP;

#declare BottleN = dimension_size(BottleBP, 1);

#declare BP = array[4];
#declare BP[0] = <0, 0>;
#declare BP[3] = <0.75, 0.02>;
#declare BP[1] = BP[0] + PtoR(0.2, 0);
#declare BP[2] = BP[3] + PtoR(0.01, -90);

#declare TMP = array[4];
#declare TMP[0] = BP[3];
#declare TMP[3] = TMP[0] + <0.0, 0.08>;
#declare TMP[1] = TMP[0] + PtoR(0.01, 0);
#declare TMP[2] = TMP[3] + PtoR(0.01, -90);

#declare BP = Merge_Arrays(BP, TMP);

#declare TMP[0] = BP[dimension_size(BP, 1) - 1];
#declare TMP[3] = TMP[0] + <-0.7, 0.5>;
#declare TMP[1] = TMP[0] + PtoR(0.2, 180);
#declare TMP[2] = TMP[3] + PtoR(0.65, -90);

#declare BP = Merge_Arrays(BP, TMP);

#declare TMP[0] = BP[dimension_size(BP, 1) - 1];
#declare TMP[3] = TMP[0] + <0.0, 0.4>;
#declare TMP[1] = TMP[0] + PtoR(0.2, 90);
#declare TMP[2] = TMP[3] + PtoR(0.2, -90);

#declare BP = Merge_Arrays(BP, TMP);

#declare TMP[0] = BP[dimension_size(BP, 1) - 1];
#declare TMP[3] = TMP[0] + <0.15, 0.3>;
#declare TMP[1] = TMP[0] + PtoR(0.2, 90);
#declare TMP[2] = TMP[3] + PtoR(0.1, -150);

#declare BP = Merge_Arrays(BP, TMP);

#declare TMP[0] = BP[dimension_size(BP, 1) - 1];
#declare TMP[3] = TMP[0] + <0.58, 0.5>;
#declare TMP[1] = TMP[0] + PtoR(0.2, -150);
#declare TMP[2] = TMP[3] + PtoR(0.3, -90);

#declare BP = Merge_Arrays(BP, TMP);

#declare TMP[0] = BP[dimension_size(BP, 1) - 1];
#declare TMP[3] = TMP[0] + <-0.27, 0.8>;
#declare TMP[1] = TMP[0] + PtoR(0.2, 90);
#declare TMP[2] = TMP[3] + PtoR(0.3, -60);

#declare BP = Merge_Arrays(BP, TMP);

#declare TMP[0] = BP[dimension_size(BP, 1) - 1];
#declare TMP[3] = TMP[0] + <-0.01, 0>;
#declare TMP[1] = TMP[0] + PtoR(0.01, 0);
#declare TMP[2] = TMP[3] + PtoR(0.01, 180);

#declare BP = Merge_Arrays(BP, TMP);

#declare TMP[0] = BP[dimension_size(BP, 1) - 1];
#declare TMP[3] = TMP[0] + <0.27, -0.8>;
#declare TMP[1] = TMP[0] + PtoR(0.3, -60);
#declare TMP[2] = TMP[3] + PtoR(0.2, 90);

#declare BP = Merge_Arrays(BP, TMP);

#declare TMP[0] = BP[dimension_size(BP, 1) - 1];
#declare TMP[3] = TMP[0] + <-0.58, -0.5>;
#declare TMP[1] = TMP[0] + PtoR(0.3, -90);
#declare TMP[2] = TMP[3] + PtoR(0.2, -150);

#declare BP = Merge_Arrays(BP, TMP);


camera{
    location <0, 1.0, -10> // カメラの位置
    look_at <0.0, 1.0, 0> // 注視点の位置
    angle 40 // 視角
}
// 光源
light_source{
    <0, 0, -10> // 光源の位置
    color White // 光源の色
}


object
{
    Reference_Image("wine_glass.png", 558, 800)
    translate <-1.175, -0.35, -0.9>
}
// union{
//     lathe{
//         bezier_spline
//         BottleN,
//         #for(i, 0, BottleN-1)
//             BP[i]
//         #end

//         texture {
//             pigment { Col_Glass_Winebottle }
//             finish{ F_Glass1 }
//         }
//         interior { ior 1.5 }
//     }

//     difference{
//         cylinder{<0, 0, 0>, <0, 1, 0>, 0.42}
//         cylinder{<0, 0, 0>, <0, 1.2, 0>, 0.41}
//         pigment{image_map { png "wine_label.png" map_type 2 } }
//         translate <0, 0.2, 0>
//     }
    
//     rotate <0, 90, 0>
// }



Draw_Spline(BP, "BZ")
// object{
//     plane{ y, 0 rotate 2*x }
//     pigment{ color ForestGreen }
//     normal { bumps 1 scale 0.01 }
// }

// sky_sphere{ S_Cloud1 }

Raster("XY")
background{color White}