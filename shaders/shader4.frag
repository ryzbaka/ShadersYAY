precision highp float;

uniform vec2 u_mouse;
uniform vec2 u_resolution;
uniform float u_time;

void main(){
    gl_FragColor = vec4(abs(cos(u_time)),0.0,abs(sin(u_time)),1.0);
}
 