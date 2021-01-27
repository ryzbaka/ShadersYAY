precision highp float;

uniform float u_time;
uniform vec2 u_resolution;
uniform vec2 u_mouse;

void main(){
	vec2 scaled = gl_FragCoord.xy/u_resolution;
	gl_FragColor=vec4(scaled.x,abs(sin(scaled.y)),abs(cos(u_time*5.0)),abs(sin(u_time*5.0)));
}

