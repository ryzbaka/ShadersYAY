import hype.*;
import hype.extended.behavior.HRotate;
import hype.extended.layout.HGridLayout;
import hype.extended.behavior.HOscillator;
import java.util.ArrayList;

HImage logo;
HCanvas logoLayer;
HDrawablePool pool;//this is the pool of boxes
boolean beat=false;
ArrayList <HBox> boxes;
HRotate rot;
ArrayList<HRotate> rots;
HGridLayout grid;
HOscillator osc;
ArrayList<HOscillator> oscs;
int scaleModifier = (int)random(1,2);
boolean oscillate=false;
boolean rotate =false;
void setup() {
  size(1000, 1000, P3D);
  H.init(this).background(#000000).use3D(true);
  lights();
  frameRate(20);
  boxes = new ArrayList<HBox>();
  rots = new ArrayList<HRotate>();
  oscs = new ArrayList<HOscillator>();
  grid = new HGridLayout().startX(20).startY(10).spacing(105, 105).cols(10);
  //LOGO - START
  logoLayer = new HCanvas().autoClear(false).fade(4);

  logo = new HImage("pfwall.png");
  logo.anchorAt(H.CENTER).loc(width/2, height/2).scale(0);
  logoLayer.add(logo);
  //LOGO - END
  //GRID - START
  
  pool = new HDrawablePool(100);
  pool
    .autoAddToStage()
    .add(new HBox())
    .layout(grid)
    .onCreate(
    new HCallback() {
    public void run(Object obj) {
      HBox brick = (HBox) obj;
      int i = pool.currentIndex();
      brick
        .depth(100)
        .width(100)
        .height(100)
        .stroke(#000000)
        .fill(#ff3300)
        .z(-70)
        .strokeWeight(1);
        boxes.add(brick);
        rot = new HRotate().target(brick).speedX(0);
        rots.add(rot);
        osc = new HOscillator().target(brick).freq(5).speed(0).property(H.SCALE).range(0,1).currentStep(15);
        oscs.add(osc);
      ;
    }
  }
  )
  .requestAll()
    ;
  //GRID - END

  H.add(logoLayer);
}

void draw() {
  //directionalLight(255,255,255,0,1,0);
  //directionalLight(255,255,255,0,-1,0);
  System.out.println(frameRate);
  if(!beat){
    //directionalLight(255, 255, 255, 0, 1, 0);
    //directionalLight(255, 255, 255, 0, -1, 0);
    directionalLight(255, 255, 255, 0, 0, 1);
    directionalLight(255, 255, 255, 0, 0, -1);
    //directionalLight(255, 255, 255, 1, 0, 0);
    //directionalLight(255, 255, 255, 1, 0, 0);
  }
  else if (frameCount%10==0 && beat) {
    directionalLight(255, 255, 255, 0, 1, 0);
    directionalLight(255, 255, 255, 0, -1, 0);
  } else {
    directionalLight(10, 10, 10, 0, 1, 0);
    directionalLight(10, 10, 10, 0, -1, 0);
  }
  pool.requestAll();
  H.drawStage();
}

void keyPressed(){
  switch(key){
    case 'b':{
      if(beat){
        //turn off beat sync
        grid.spacing(105,105);
        for(int i=0;i<boxes.size();i++){
          HBox box = boxes.get(i);
          box.stroke(#000000).strokeWeight(1);
          //HRotate rot = rots.get(i);
          //rot.speedX(0);
          ////box.rotateX(0);
          //box.rotationX(0);
          //rotate=false;
        }
        beat=false;
      }else{
        //turn on beat sync
        grid.spacing(110,110);
        for(int i=0;i<boxes.size();i++){
          HBox box = boxes.get(i);
          box.stroke(#008080).strokeWeight(20);
        }
        beat=true;
      }
      break;
    }
  case 'o':{
    if(oscillate){
      //turn off oscillation
      oscillate = false;
      for(int i=0;i<boxes.size();i++){
          HOscillator osc = oscs.get(i);
          osc.currentStep(15).speed(0);
        }
    }else{
      //turn on oscillation
      oscillate = true;
      scaleModifier = (int) random(1,10);
      for(int i=0;i<boxes.size();i++){
          HOscillator osc = oscs.get(i);
          osc.currentStep(i*scaleModifier).speed(1);
        }
      }
      break;
    }
  case 'r':{
      if(rotate){
        rotate=false;
        //HRotate rot = rots.get(i);
        //  rot.speedX(2);
        for(int i=0;i<boxes.size();i++){
          HRotate rot = rots.get(i);
          HBox box = boxes.get(i);
          rot.speedX(0);
          //box.rotateX(0);
          box.rotationX(0);
          rotate=false;
        }
      }else{
        rotate = true;
        for(int i=0;i<boxes.size();i++){
          HRotate rot = rots.get(i);
          rot.speedX(2);
        }
      }
      break;
    }
  case 's':{
    //switch oscillation
    //scaleModifier = (int) random(1,10);
    //  for(int i=0;i<boxes.size();i++){
    //      HOscillator osc = oscs.get(i);
    //      osc.currentStep(i*scaleModifier).speed(1);
    //    }
    //  }
    if(oscillate){
      scaleModifier = (int) random(1,20);
      for(int i=0;i<boxes.size();i++){
        HOscillator osc = oscs.get(i);
        osc.currentStep(15);
        //HBox box = boxes.get(i);
        //box.scale(1);
        osc.currentStep(i*scaleModifier*5);
      }
    }
      break;
    }
   case 'f':{
     H.autoClear(false);
     break;
   }
   case 't':{
     H.autoClear(true);
     break;
   }
  }
}
