precision highp float;

uniform float u_time;
uniform vec2 u_resolution;
uniform vec2 u_mouse;

void main(){
    vec2 scaledCoords = gl_FragCoord.xy/u_resolution;
    gl_FragColor=vec4(scaledCoords.y,0.0,scaledCoords.x,1.0);
    //this shows gradient from black to red L2R
    //the coordinates of each pixel are scaled between 1 and 0
    //by dividing the coordiante point by the resolution.
    gl_FragColor=vec4(0.0,scaledCoords.y,0.0,1.0);
    //bottom to up black to green gradient
    // gl_FragColor = vec4(scaledCoords.x,0.0,scaledCoords.y,1.0);
    //(0,0) is at bottom left.
    gl_FragColor = vec4(scaledCoords.x,0.0,scaledCoords.y,
    abs(sin(u_time*5.0)));
}