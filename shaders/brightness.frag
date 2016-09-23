uniform sampler2D src;
uniform float value;

/* In */
varying vec2 UV;

void main()
{
    vec4 color = texture2D(src, UV);
    gl_FragColor = color + vec4(vec3(value), 1.0);
}
