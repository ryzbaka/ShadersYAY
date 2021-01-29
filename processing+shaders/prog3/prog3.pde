import hype.*;
import hype.extended.behavior.HRotate;
import hype.extended.behavior.HOscillator;

PShader shader;
HEllipse d;
int numRects=5;
void setup(){
 size(1000,1000,P2D);
 noStroke();
 smooth();
 frameRate(60);
 H.init(this).background(#000000).autoClear(false);
 shader = loadShader("shader.frag");
 shader.set("u_time",millis()/1000.0);
 for(int i=0;i<numRects;i++){
   d = new HEllipse();
   d.anchorAt(H.CENTER).loc((int)random(width),(int)random(height)).size(100);
   H.add(d);
   new HRotate(d,2);
   new HOscillator().target(d).freq((int)random(1,2)).speed(random(1,3)).range(0,width).property(H.X);
   new HOscillator().target(d).freq((int)random(1,2)).speed(random(1,3)).range(0,width).property(H.Y);
   new HOscillator().target(d).freq((int)random(1,2)).speed(random(1,3)).range(0,1).property(H.SCALE);
 }
}

void draw(){
  shader.set("u_time",millis()/1000.0);
  shader(shader);
  H.drawStage();
}
