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
    vec2 tsize = 1.0f / textureSize(src, 0);

    /* Filter */
    color = vec4(0.0);
    int mid = 0;
    for(int x = -radius; x <= radius; x++) {
        for(int y = -radius; y <= radius; y++) {
            if(mid != size/2) color -= texture2D(src, UV + tsize * vec2(x,y));
            else color += texture2D(src, UV + tsize * vec2(x,y)) * (size-1);
            mid++;
        }
    }

    gl_FragColor = color;
}
















