uniform sampler2D src;
uniform float value;

/* In */
varying vec2 UV;

// Source: http://kodemongki.blogspot.com/2011/06/kameraku-custom-shader-effects-example.html

const float step_w = 0.0015625;
const float step_h = 0.0027778;
//const float grid = 8.0;

void main(void)
{
    float grid = (value * 10) + 5;

    float offx = floor(UV.s  / (grid * step_w));
    float offy = floor(UV.t  / (grid * step_h));

    vec3 res = texture2D(src, vec2(offx * grid * step_w , offy * grid * step_h)).bgr;
    vec2 prc = fract(UV.st / vec2(grid * step_w, grid * step_h));
    vec2 pw = pow(abs(prc - 0.5), vec2(2.0));
    float  rs = pow(0.45, 2.0);
    float gr = smoothstep(rs - 0.1, rs + 0.1, pw.x + pw.y);

    float y = (res.r + res.g + res.b) / 3.0;
    vec3 ra = res / y;
    float ls = 0.3;
    float lb = ceil(y / ls);
    float lf = ls * lb + 0.3;
    res = lf * res;

    gl_FragColor = vec4(mix(res, vec3(0.1, 0.1, 0.1), gr), 1.0);
}
















