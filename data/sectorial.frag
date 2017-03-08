// GLSL fragment shader

varying float sig;

void main()
{
     sig = clamp(sig, 0.0, 1.0);
     vec4 colorBeg = vec4(1, 0, 0, 0);
     vec4 colorEnd = vec4(0, 0, 1, 0);
     gl_FragColor = (1.0 - sig) * colorBeg + sig * colorEnd;
}
