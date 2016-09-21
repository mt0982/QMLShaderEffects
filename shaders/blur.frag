uniform sampler2D src;
uniform float value;

/* In */
varying vec2 UV;

void main()
{
    /* Radius */
    int radius = value * 10;
    if(!radius) radius = 0;
    int size = pow((radius * 2) + 1, 2);

    /* Original Image */
    vec4 color = texture2D(src, UV);

    /* Offset */
    vec2 tab[101];
    vec2 tsize = 1.0f / textureSize(src, 0);

    /* Image Processing */
    color = vec4(0.0);
    for (int i = -radius; i <= radius; i++) {
        for (int j = -radius; j <= radius; j++) {
            color += texture2D(src, UV + tsize * vec2(j,i));
        }
    }

    color /= size;

    gl_FragColor = color;
}
















