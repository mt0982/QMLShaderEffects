uniform mat4 qt_Matrix;

/* In */
attribute vec2 qt_MultiTexCoord0;
attribute vec4 qt_Vertex;

/* Out */
varying vec2 UV;

void main()
{
    UV = qt_MultiTexCoord0;
    gl_Position = qt_Matrix * qt_Vertex;
}
