import hype.*;

PShader shader;

void setup(){
  size(600,600,P2D);
  background(#202020);
  shader = loadShader("shader.frag");
}
void draw(){
  shader.set("u_resolution",float(width),float(height));
  shader.set("u_time",millis()/1000.0);
  shader.set("u_mouse",float(mouseX),float(mouseY));
  shader(shader);
  rect(100,100,100,100);w
  resetShader();
  fill(#ff3300);
  rect(200,200,100,100);
}
