precision highp float;

uniform float u_time;

void main(){
    gl_FragColor = vec4(0.0,abs(cos(u_time*3.0)),abs(sin(u_time*2.0)),abs(cos(u_time)));
    // gl_FragColor = vec4(0.0,abs(sin(u_time*2.0)),0.0,1.0);
}
 
