precision highp float;

uniform float u_time;
uniform vec2 u_resolution;

void main(){
    vec2 scaled = gl_FragCoord.xy/u_resolution;
    float y = scaled.x;
    //assigning x coord of each pixel to variable y.
    vec3 color = vec3(y);//same as vec3(y,y,y)
    gl_FragColor = vec4(color,1.0);//same as vec4(y,y,y,1.0)
}