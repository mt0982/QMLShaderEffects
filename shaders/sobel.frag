uniform sampler2D src;
uniform float value;

/* In */
varying vec2 UV;

// Source: http://kodemongki.blogspot.com/2011/06/kameraku-custom-shader-effects-example.html

const float step_w = 0.0015625;
const float step_h = 0.0027778;

void main()
{
    vec3 t1 = texture2D(src, vec2(UV.x - step_w, UV.y - step_h)).bgr;
    vec3 t2 = texture2D(src, vec2(UV.x, UV.y - step_h)).bgr;
    vec3 t3 = texture2D(src, vec2(UV.x + step_w, UV.y - step_h)).bgr;
    vec3 t4 = texture2D(src, vec2(UV.x - step_w, UV.y)).bgr;
    vec3 t5 = texture2D(src, UV).bgr;
    vec3 t6 = texture2D(src, vec2(UV.x + step_w, UV.y)).bgr;
    vec3 t7 = texture2D(src, vec2(UV.x - step_w, UV.y + step_h)).bgr;
    vec3 t8 = texture2D(src, vec2(UV.x, UV.y + step_h)).bgr;
    vec3 t9 = texture2D(src, vec2(UV.x + step_w, UV.y + step_h)).bgr;

    vec3 xx = t1 + 2.0*t2 + t3 - t7 - 2.0*t8 - t9;
    vec3 yy = t1 - t3 + 2.0*t4 - 2.0*t6 + t7 - t9;

    vec3 color = sqrt(xx * xx + yy * yy);
    float y = (color.r + color.g + color.b) / 3.0;

    if (y > 1.0 - value) {
        color = vec3(0.0, 0.0, 0.0);
    } else {
        color = vec3(1.0, 1.0, 1.0);
    }

    gl_FragColor = vec4(color, 1.0);
}
















