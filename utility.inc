#ifndef(MYUTILS_INC)
#declare MYUTILS_INC = "myutils.inc";

#include "shapes.inc"
#include "colors.inc"



#declare FRONT = 0;
#declare BACK = 1;
#declare SIDE_L = 2;
#declare SIDE_R = 3;
#declare TOP = 4;
#declare DEFAULT = 5;

#declare Orthographic_On = 1;
#declare Camera_Angle = 85;
#declare Camera_Extra_Shift = <0,0,0>;

#declare Default_Cam_Pos = <10, 10, -10>;
#declare Default_Cam_Look_At = <0, 0, 0>;
#declare Default_Cam_Angle = 30;

//-------------------------------------------------------------------------
/** 
 Camera placing macro
 Camera( Cam_ID )
    -  Cam_ID : Camera position identifier.  FRONT, BACK, TOP, SIDE_L, SIDE_R or DEFAULT 
*/
#macro Camera( Cam_ID )
    #switch (Cam_ID)
        #case (FRONT)
            #local Location = < 0, 0, -10>;
            #local Look_At = < 0, 0, 0>;
            #local Sky = y;
            #local Angle = Camera_Angle;
            #local Shift = Camera_Extra_Shift;
        #break 
        #case (BACK)
            #local Location = < 0, 0, 10>;
            #local Look_At = < 0, 0, 0>;
            #local Sky = y;
            #local Angle = Camera_Angle;
            #local Shift = Camera_Extra_Shift;
        #break 
    
        #case (SIDE_L)
            #local Location =  < -10, 0, 0>;
            #local Look_At = < 0, 0, 0>;
            #local Sky = y;
            #local Angle = Camera_Angle;
            #local Shift = Camera_Extra_Shift;
        #break

        #case (SIDE_R)
            #local Location =  < 10, 0, 0>;
            #local Look_At = < 0, 0, 0>;
            #local Sky = y;
            #local Angle = Camera_Angle;
            #local Shift = Camera_Extra_Shift;
        #break
        #case (TOP)
            #local Location =  < 0, 10, 0>;
            #local Look_At = < 0, 0, 0>;
            #local Sky = z;  
            #local Angle = Camera_Angle;
            #local Shift = Camera_Extra_Shift;
        #break

        #else
            #local Location =  Default_Cam_Pos;
            #local Look_At = Default_Cam_Look_At;
            #local Sky = y;  
            #local Angle = Default_Cam_Angle;
            #local Shift = <0, 0, 0>;
    #end // End of switch

    camera{
        #if ( Orthographic_On = 1 ) orthographic #end
        location Location 
        look_at Look_At
        sky Sky
        angle Angle
        translate Shift
    }
#end //End of macro Camera(...)



#declare Shadowless_On = 1;
//-------------------------------------------------------------------------
/** 
 Light placing macro
 Light( Light_ID )
    -  Light_ID : Light position  identifier.  FRONT, BACK, TOP, SIDE_L, SIDE_R or DEFAULT 
*/
#macro Light( Light_ID )
    #switch (Light_ID)
        #case (FRONT)
            #local Location = < 0, 0, -15>;
        #break 

        #case (BACK)
            #local Location = < 0, 0, 15>;
        #break 
    
        #case (SIDE_L)
            #local Location =  < -15, 0, 0>;
        #break

        #case (SIDE_R)
            #local Location =  < 15, 0, 0>;
        #break

        #case (TOP)
            #local Location =  < 0, 15, 0>;
        #break

        #else
            #local Location =  <15,15,-15>;
    #end // End of switch

    light_source{
        Location
        color White
        #if ( Shadowless_On = 1 ) shadowless #end
        parallel
        point_at <0,0,0>
    }
#end //End of macro Camera(...)



#declare Axis_Texture_Dark  = texture {
                               pigment{ color rgb<1,0.45,0>}
                               finish { phong 1}
                             }
                             
#declare Axis_Texture_Light = texture {
                               pigment{ color rgb<1,1,1>}
                               finish { phong 1}
                               }

//-------------------------------------------------------------------------
/** 
 Macro creating axis
 Axis_( AxisLen, Dark_Texture,Light_Texture)
        - AxisLen : Length of axis
        - Dark_Texture : Dark texture of axis
        - Light_Texture : Light texture of axis        
*/
#macro Axis_( AxisLen)
 union{
    cylinder { <0,-AxisLen,0>,<0,AxisLen,0>,0.05
               texture{checker texture{Axis_Texture_Dark }
                               texture{Axis_Texture_Light}
                       translate<0.1,0,0.1>}
             }
    cone{<0,AxisLen,0>,0.15,<0,AxisLen+0.6,0>,0
          texture{Axis_Texture_Dark}
         }
    no_shadow
     } // end of union
#end // End of macro "Axis()"

//------------------------------------------------------------------------
/** 
 Macro creating 3 axes
 Axis_( AxisLen, Dark_Texture,Light_Texture)
        - AxisLenX : Length of X axis
        - AxisLenY : Length of Y axis
        - AxisLenZ : Length of Z axis
*/
#macro AxisXYZ( AxisLenX, AxisLenY, AxisLenZ)
    union{
        #if (AxisLenX != 0)
            object { Axis_(AxisLenX )   rotate< 0,0,-90>}// x-Axis
            text { ttf "timrom.ttf",  "x",  0.15,  0  texture{Axis_Texture_Dark} 
               translate (AxisLenX+0.90)*x 
              }
        #end // of #if

        #if (AxisLenY != 0)
            object { Axis_(AxisLenY)   rotate< 0,0,  0>}// y-Axis
            text { ttf "timrom.ttf",  "y",  0.15,  0  texture{Axis_Texture_Dark}
              translate (AxisLenY+0.90)*y
              }
        #end // of #if

        #if (AxisLenZ != 0)
            object { Axis_(AxisLenZ)   rotate<90,0,  0>}// z-Axis
            text{ ttf "timrom.ttf",  "z",  0.15,  0  texture{Axis_Texture_Dark}
              translate (AxisLenZ+0.90)*z 
            }
        #end // of #if
        no_shadow
    } // end of union
#end// End of macro "AxisXYZ( ... )"



#declare RasterScale = 1;
#declare RasterHalfLine  = 0.025;
#declare RasterColor = color 0.6*Yellow transmit 0.3;
//-------------------------------------------------------------------------
/** 
 Macro defining raster texture 
 Raster(RScale, HLine)
    - RScale : Raster scaling coefficient
    - Hline : Half width of raster line
*/
#macro RasterTexture(RScale, HLine)
       pigment{ gradient x  scale RScale
                color_map{[0.000   color RasterColor]
                          [0+HLine/RScale color RasterColor]
                          [0+HLine/RScale color rgbt<1,1,1,1>]
                          [1-HLine/RScale color rgbt<1,1,1,1>]
                          [1-HLine/RScale color RasterColor]
                          [1.000   color RasterColor]} }
 #end// End of macro Raster(RScale, HLine)


#macro Raster( Type ) 
    #local ThinLine = 0.25*RasterHalfLine;
    object{
        plane{ z, 0}
        texture{ RasterTexture(0.1*RasterScale, ThinLine) }
        texture{ RasterTexture(0.1*RasterScale, ThinLine) rotate 90*z }
        texture{ RasterTexture(RasterScale, RasterHalfLine) }
        texture{ RasterTexture(RasterScale, RasterHalfLine) rotate 90*z }        

        #if( strupr(Type) = "XZ" )
            rotate 90*x
        #elseif( strupr(Type) = "YZ" )
            rotate 90*y
        #elseif( strupr(Type) = "XY" )
        #else
            #warning concat("Unknown Raster Type ",Type)
        #end
        no_shadow
    }

#end




#declare PPU = 237;
#macro Reference_Image( Filename, Img_w, Img_h)
    #declare W = Img_w/PPU;
    #declare H = Img_h/PPU;
    plane {-z, -1 pigment { image_map{ png Filename once} scale <W, H, 0.001>} }
#end



#declare BallRadius = 0.05;
#declare BallColor = Orange;

//-------------------------------------------------------------------------
/**
   Macro showing single point position by small ball. 
   Draw_Point(Point)
    - Point : Point position
*/
#macro Draw_Point(Point)
    sphere{ <0,0,0> , BallRadius
                pigment{ color BallColor}
                translate  Point}
#end // End of macro Draw_Point(...)

//-------------------------------------------------------------------------
/**
   Macro showing point positions by small balls. 
   Draw_Points(Points)
    - Points : Array of points
*/
#macro Draw_Points(Points)
    #local N_of_P = dimension_size(Points,1);
    #for (i, 0, N_of_P-1, 1)
        object{
            sphere{ <0,0,0> , BallRadius}
            pigment{ color BallColor}
            translate  Points[i]
        }
    #end
#end // End of macro Draw_Points(...)

//-------------------------------------------------------------------------
/**
   This macro shows label and position of single point. 
   Dot_Label(Point, Text)
    - Point : Point position
    - Text : Label Text
*/
#declare LabelSize = 0.2;
#declare LabelRotation = <0,0,0>;
#macro Dot_Label(Point, Text)
    #local TXT = text { ttf "timrom.ttf",  Text,  0.15,  0  scale <LabelSize,LabelSize,1> pigment{color Black}};
    #local BL = min_extent(TXT);
    #local TR = max_extent(TXT) ;
    union{
        object{TXT translate <-(TR.x-BL.x)/2,0.5*LabelSize,0> rotate LabelRotation}
        object{Draw_Point(<0,0,0>)}
        translate Point
    }
#end // End of macro Dot_Label(...)


//-------------------------------------------------------------------------
/**
   Macro to calculate a point on Bezier curve. 
   Bezier_Point(T, P0, P1, P2, P3 )
    - T : Parameter value. 0 <= T <= 1
    - P0 : First point of Bezier curve 
    - P1 : First control point of Bezier curve 
    - P2 : Second control point of Bezier curve
    - P3 : Last point of Bezier curve 
*/
#macro Bezier_Point(T, P0, P1, P2, P3 )

    (1-T)*(1-T)*(1-T)*P0 + 3*(1-T)*(1-T)*T*P1 + 3*(1-T)*T*T*P2 + T*T*T*P3

#end // End of macro Bezier_Point(...)


#declare SplineSweepRadius = 0.02;
#declare SplineSweepColor = Green;
#declare SplineHandleColor = White-SplineSweepColor;

//-------------------------------------------------------------------------
/**
    Macro to draw one segment of Bezier curve. 
    Draw_Bezier_Segment(P0, P1, P2, P3, N)
    - P0 : First point of Bezier curve 
    - P1 : First control point of Bezier curve 
    - P2 : Second control point of Bezier curve
    - P3 : Last point of Bezier curve 
    - N : Number of divisions
*/
#macro Draw_Bezier_Segment(P0, P1, P2, P3, N)

    sphere_sweep{
        linear_spline
        2
        P0, SplineSweepRadius
        P1, SplineSweepRadius
        pigment { color SplineHandleColor}
    }

     sphere_sweep{
        linear_spline
        2
        P2, SplineSweepRadius
        P3, SplineSweepRadius
        pigment { color SplineHandleColor}
    }

    #local dt = 1/N;
    #local i = 0;
    #while ( i < N-1) 
    object{
        sphere_sweep{
            linear_spline
            2
            Bezier_Point(i*dt, P0, P1, P2, P3 ) , SplineSweepRadius
            Bezier_Point((i+1)*dt, P0, P1, P2, P3 ), SplineSweepRadius
        }
        pigment { color SplineSweepColor}
    }
        #local i = i+1;
    #end 

#end // End of macro Draw_Bezier_Segment(...)



#declare Bezier_N_of_Divisions = 100;

//-------------------------------------------------------------------------
/**
    Macro to draw Bezier curve of multiple segments. 
    Draw_Bezier_Spline(Points)
    - Points : Array of points defining Bezier curve.
*/
#macro Draw_Bezier_Spline( Points )
    #local N_of_P = dimension_size(Points,1);
    #local j = 0;
    object{
        union{
            #while ( j < N_of_P )
                Draw_Bezier_Segment(Points[j+0], Points[j+1], Points[j+2], Points[j+3], Bezier_N_of_Divisions)
                #local j = j+4;
            #end 
        }
    }

#end //End of macro Draw_Bezier_Spline(...)



#macro Draw_Spline(Points, Type)

    #if (strupr(Type) = "BZ" )
        Draw_Bezier_Spline( Points )
    #else
    
    #local N_of_P = dimension_size(Points,1);
        sphere_sweep{
            #if (strupr(Type) = "C" )
                cubic_spline
            #elseif (strupr(Type) = "B" )
                b_spline
            #elseif (strupr(Type) = "L" )
                linear_spline
            #else
                #warning concat("Unknown spline type ",Type,". Using linear spline instead.")
                linear_spline
            #end     
            N_of_P,
            #for (i, 0, N_of_P-1, 1)
                Points[i] , SplineSweepRadius
            #end
            pigment { color SplineSweepColor}
        }
    #end

#end



//-------------------------------------------------------------------------
/**
  Macro to convert 2D polar coordinates to 2D rectangular coordinates. 
  PtoR(r, theta)
    - r : radius
    - theta : angle
*/
#macro PtoR(r, theta)
    <r*cos(radians(theta)), r*sin(radians(theta)) >
#end // End of macro PtoR(...)



//-------------------------------------------------------------------------
/**
  Macro to convert 3D spherical coordinates to 3D rectangular coordinates. 
  StoR(r, pol, azi)
    - r : radius
    - pol : polar angle
    - azi : azimutal angle
*/
#macro StoR (r, pol, azi)
  < r*sin(radians(pol))*cos(radians(azi)),
    r*cos(radians(pol)),
    r*sin(radians(pol))*sin(radians(azi))
  >
#end // End of macro StoR(...)



//-------------------------------------------------------------------------
/**
  Macro to convert 3D rectangular coordinates to 3D spherical coordinates. 
  RtoS (V, ID)
    - V : Vector of rectangular coordinates
    - ID : Identifier for desired return value. One of "R", "POL" or "AZI"
*/

#macro RtoS (V, Type)
    #if(strupr(Type) = "R")
        #local retval = vlength(V);
    #elseif (strupr(Type) = "POL")
        #local retval = degrees(acos(V.y/vlength(V)));
    #elseif (strupr(Type) = "AZI")
        #local retval = degrees(atan2(V.z,V.x));
    #else
        #warning concat("Wrong type in RtoS ",Type)
        #local 0;
    #end
    retval
#end

//-------------------------------------------------------------------------
/**
  Macro to generate rando mumber from interval [-0.5,0.5) 
  pm_rand( Rnd )
    - Rnd : Random seed
*/
#macro pm_rand( Rnd )
    (rand(Rnd)-0.5)
#end


//-------------------------------------------------------------------------
/**
  Macro to merge two arrays into one.

    Merge_Arrays(Arr1, Arr2)
    - Arr1 : First array
    - Arr2 : Second array
*/
#macro Merge_Arrays(Arr1, Arr2)
    #local N = dimension_size(Arr1,1) + dimension_size(Arr2,1);
    #local retval = array[N];
    #local cnt=0;
    #for(i,0, dimension_size(Arr1,1) - 1)
        #local retval[cnt] =  Arr1[i];
        #local cnt = cnt+1;
    #end
    #for(i,0, dimension_size(Arr2,1) - 1 )
        #local retval[cnt] = Arr2[i];
        #local cnt = cnt+1;
    #end
    retval 
#end


#end
