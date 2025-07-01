//
//  FloatingShader.metal
//  Pleasuroo
//
//  Created by Valery Zazulin on 26.01.25.
//

#include <metal_stdlib>
using namespace metal;

[[stitchable]] float2 floating(float2 position, float time) {
    position.y += 40 * sin(time * 4);
    position.x += 10 * sin(time * 3);
    return position;
}
