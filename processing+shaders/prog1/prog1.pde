//WARM AND FUZZY

import java.util.ArrayList;

PShader shader;
//float t = 0.0;
//float inc = 0.01;
boolean beat=false;
int offsetX = 90;
int offsetY = 120;
int numWalkers=7;
PGraphics border;
int dim = 200;
class perlinWalker{
  public float t;
  public float inc;
  public int size;
  public perlinWalker(float start,float increment){
     t=start;
     inc = increment;
     size = (int) random(50,100);
  }
  public void move(){
    this.t+=this.inc;
  }
  public void show(){
     this.move();
     strokeWeight(20);
     //if(beat&&frameCount%10==0){
     //  rect(random(0,width),random(0,height),0.2,10);
     //}
     if(frameCount%30==0 && beat){
       strokeWeight(20);
       ellipse(map(noise(t),0,1,offsetX,width-offsetX),map(noise(t,t),0,1,offsetY,height-offsetY),size*3,size*3);
     }else{
       ellipse(map(noise(t),0,1,offsetX,width-offsetX),map(noise(t,t),0,1,offsetY,height-offsetY),size,size);
     }
  }
}

ArrayList <perlinWalker> walkers;
String someText;
void setup(){
  smooth();
  size(1000,1000,P2D);
  //noStroke();
  frameRate(65);
  background(#202020);
  shader = loadShader("shader1.frag");
  stroke(#ffffff);
  fill(#202020,0);
  rect(100,100,800,800);
  someText = "Hamza Ali Ryzvy";
  textSize(16);
  fill(#ffffff);
  text(someText,100,90);
  someText = "1/28/2021";
  text(someText,800,90);
  someText = "Warm and Fuzzy.";
  textSize(20);
  text(someText,100,930);
  walkers = new ArrayList<perlinWalker>();
  for(int i=0;i<numWalkers;i++){
    perlinWalker walker = new perlinWalker(random(0,10),0.008);
    walkers.add(walker);
  }
  border = createGraphics(width,height);
}
void draw(){
  //rect()
  System.out.println(frameRate);
  shader.set("u_resolution",float(dim),float(dim));
  //shader.set("u_mouse",float(mouseX),float(mouseY));
  shader.set("u_time",millis()/1000.0);
  shader(shader);
  for(int i=0;i<walkers.size();i++){
    perlinWalker walker = walkers.get(i);
    walker.show();
  }
  
  //fill(#ff0000);
  //strokeWeight(50);
  //stroke(#000000);
  //if(frameCount%30==0){
  //ellipse(map(noise(t),0,1,0,width-offsetX),map(noise(t,t),0,1,0,height-offsetY),200,200);
  //}else{
  //  ellipse(map(noise(t),0,1,0,width-offsetX),map(noise(t,t),0,1,0,height-offsetY),100,100);
  //}
  //rect(0,0,width,height);
  //t+=inc;  
}

void keyPressed(){
  switch(key){
    case 'b':{
      if(beat){
        beat = false;
      }else{
        beat=true;
      }
      break;
    }
   case 'r':{
     saveFrame("render5.png");
   }
  }
}
