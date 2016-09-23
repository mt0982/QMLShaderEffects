uniform sampler2D src;
uniform float value;

/* In */
varying vec2 UV;

void rgb2hsl(vec3 rgb, out float h, out float s, float l)
{
    float maxval = max(rgb.r , max(rgb.g, rgb.b));
    float minval = min(rgb.r, min(rgb.g, rgb.b));
    float delta = maxval - minval;

    l = (minval + maxval) / 2.0;
    s = 0.0;
    if (l > 0.0 && l < 1.0)
        s = delta / (l < 0.5 ? 2.0 * l : 2.0 - 2.0 * l);
    h = 0.0;
    if (delta > 0.0)
    {
        if (rgb.r == maxval && rgb.g != maxval)
            h += (rgb.g - rgb.b ) / delta;
        if (rgb.g == maxval && rgb.b != maxval)
            h += 2.0  + (rgb.b - rgb.r) / delta;
        if (rgb.b == maxval && rgb.r != maxval)
            h += 4.0 + (rgb.r - rgb.g) / delta;
        h *= 60.0;
    }
}

void main()
{
        vec4 color = texture2D(src, UV);
        float h, s, l;

        rgb2hsl(color, h, s, l);

        float y = 0.3 * color.r + 0.59 * color.g + 0.11 * color.b;

        vec4 result;
        if (h >= 180.0 && h <= 260.0) {
            result = color;
        } else{
            result = vec4(y, y, y, 1.0);
        }

        gl_FragColor.a = 1.0;
        gl_FragColor.rgb = result;
}
















