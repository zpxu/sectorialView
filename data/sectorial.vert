// GLSL vertex shader

varying float sig;

void main()
{
    sig      	     = gl_MultiTexCoord0.x;
    vec4 pos         = vec4(gl_Vertex.x, gl_Vertex.y, 0.0, 1.0);
    gl_Position      = gl_ModelViewProjectionMatrix * pos;
}
