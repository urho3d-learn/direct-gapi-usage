#include "Uniforms.glsl"
#include "Transform.glsl"

void VS()
{
    // Вершинный шейдер полностью соответствует шаблону
    // https://urho3d-doxygen.github.io/1_9_0_tutors/_shaders.html
    mat4 modelMatrix = iModelMatrix;
    vec3 worldPos = GetWorldPos(modelMatrix);
    gl_Position = GetClipPos(worldPos);
}

void PS()
{
    // В пиксельном шейдере просто выводим белый цвет
    gl_FragColor = vec4(1.0);
}
