#include "colors.inc"
#include "shapes.inc"
// カメラ
camera{
    location <10, 5, 10> // カメラの位置
    look_at <0, 0, 0> // 注視点の位置
    angle 30 // 視角
}
// 光源
light_source{
    <10, 10, -5> // 光源の位置
    color White // 光源の色
}
// 物体の記述
object{
    sphere{ <0, 0, 0 >, 1} // 物体の形状（原点に位置する、半径１の球体）
    pigment{color Orange} // 物体の色
}