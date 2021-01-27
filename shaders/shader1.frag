//Simple gl_FragColor shader.
precision highp float;

uniform float u_time;
uniform vec2 u_resolution;
uniform vec2 u_mouse;


void main(){
    // gl_FragColor = vec4(1.0,0.0,0.0,1.0);
    gl_FragColor = vec4(
        abs(sin(u_time*5.0)),
        0.0,
        abs(cos(u_time*5.0)),
        1.0
    );//this flickers between red and blue
    //when cos(theta) is 0 sin(theta) is 1 thats why
}