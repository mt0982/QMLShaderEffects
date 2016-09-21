uniform sampler2D src;

/* In */
varying vec2 UV;

void main()
{
    vec4 color = texture2D(src, UV);
    float gray = color.r;
    gl_FragColor = vec4(vec3(gray, gray, gray), 1.0);
}
