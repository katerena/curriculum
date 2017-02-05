import controlP5.*;
import java.util.*;

ControlP5 cp5;

int n = 15;
int fading = 50;

float waveJitter = 1000.0;
float noiseJitter = 200.0;

float noise1 = 7;
float noise2 = 1;

int magnitude = 20;

int trailLength = 25;

int rootColor = 0;
int colorShift = 10;

float confusion = 0;
boolean confused = false;

float confusion2 = 0;
boolean confused2 = false;

LinkedList<Float[]> trail = new LinkedList<Float[]>();

int knobx, knoby;

void setup() {
  
  size(800, 1000);
  
  knobx = 10;
  knoby = height - 110;
  
  frameRate(30);
  background(255);
  colorMode(RGB, 255, 255, 255);
  noFill();
  smooth();
  cp5 = new ControlP5(this);
  //knob("waveJitter", 1000, 5000, 1000);
  
}

void knob(String var, int min, int max, int current){
    cp5.addKnob(var)
       .setRange(min,max)
       .setValue(current)
       .setPosition(knobx,knoby)
       .setRadius(50)
       .setDragDirection(Knob.HORIZONTAL)
       ;
     knobx+=110;
}

void draw() 
{
  
  float basex = width/2;
  float basey = height/6;
  float totalheight = 2*height/3;
  
  while(trail.size() >= trailLength){
    trail.remove();
  }
  
  {
    Float[] thread = new Float[n-1];
    int threadAnchors = 0;
    for (int i=0; i<n-1; i++){
      threadAnchors = i+1;
      if ( threadAnchors >= n/2 ) threadAnchors = n-i;
      thread[i] = sin((n-i)*frameCount*(noise1/waveJitter)) * threadAnchors * magnitude * noise(frameCount*(noise1/noiseJitter)) -
                  cos((i+1)*frameCount*(noise2/waveJitter)) * threadAnchors * magnitude * noise(frameCount*(noise2/noiseJitter));
    }
    
    trail.add(thread);
  }
  
  background(255);
  

   int pos = 0;
    for (Float[] thread : trail){
      //stroke(gray - gray*pos/n, stroke);
      
      stroke(20, fading*pos/trail.size());
      
      strokeWeight(1);
      
      pos++;
      
      if (pos == trail.size() && rootColor>0){
          //strokeWeight(abs(cos(frameCount*nfTime)*magnitude)+1);
          float max = 0;
          for (float f : thread) {
            if(f>max) max = f;
          }
          max = min(max/(3*(1 - confusion2 + 0.1)), totalheight/4);
          
          strokeWeight(15);

          stroke(confusion2*rootColor/2, rootColor, (1-confusion2)*rootColor/2, fading);
          makeCurve(basex, basey+max, totalheight-max*2, thread);
          
          strokeWeight(10);
          
          stroke(rootColor, rootColor*(1-confusion2), rootColor*confusion2, fading);
          makeCurve(basex, basey-max, totalheight+max*2, thread);
          
          stroke(rootColor*(1-confusion), rootColor*confusion/2, rootColor*confusion);
          makeCurve(basex, basey, totalheight, thread);
      }
      
      else makeCurve(basex, basey, totalheight, thread);
  
    //}
  }
  
  if (magnitude > 20){
    if (rootColor > 0) rootColor -= colorShift;
    magnitude -= 1;
  }
  else if (magnitude < 20){
    magnitude += 1;
    if (rootColor < 255) rootColor += colorShift;
  }
  
  if (confused && waveJitter>500){
    confusion = (1000-waveJitter)/500.0;
    waveJitter-=50;
  } else if (!confused && waveJitter<1000) {
    confusion = (1000-waveJitter)/500.0;
    waveJitter+=50;
  } else if(!confused){
    confusion = 0;
  }
  /*
  if (confused2 && noiseJitter>100){
    confusion2 = (200-noiseJitter)/100.0;
    noiseJitter-=10;
  } else if (!confused2 && noiseJitter<200) {
    confusion2 = (200-noiseJitter)/100.0;
    noiseJitter+=10;
  } else if(!confused2){
    confusion2 = 0;
  }*/
  
  if (confused2 && confusion2 < 1.0){
    confusion2 += 0.1;
  } else if (!confused2 && confusion2 > 0.0) {
    confusion2 -= 0.1;
  }
}

void makeCurve(float basex, float basey, float totalheight, Float[] thread){
    beginShape();
    curveVertex(basex, basey);
    curveVertex(basex, basey);
    for (int i=0; i<thread.length; i++){
      float x = basex + thread[i];
      float y = basey + (i+1)*totalheight/n;
      curveVertex(x, y);
    }
    curveVertex(basex, basey + totalheight);
    curveVertex(basex, basey + totalheight);
    endShape();
}

void clearTrail(){
  trail = new LinkedList<Float[]>();
  println("New trail  @ " + frameCount);
  println("noise1       " + noise1);
  println("noise2       " + noise2);
  println("n            " + n);
  println("magnitude    " + magnitude);
  println("trailLength  " + waveJitter);
  println("waveJitter   " + trailLength);
  println("noiseJitter  " + noiseJitter);
  println("fading       " + fading);
}

void keyPressed() {
  switch(key) {
    case('1'): rootColor = 0; break;
    case('2'): rootColor = 255; magnitude = 40; clearTrail(); break;
    case('3'): rootColor = 1; magnitude = -5; clearTrail(); break;
    //case('4'): if(noise1 < 30) noise1++; clearTrail(); break;
    //case('5'): if(noise2 < 30) noise2++; clearTrail(); break;
    //case('6'): if(noise1 > 2) noise1--; clearTrail(); break;
    //case('7'): if(noise2 > 2) noise1--; clearTrail();  break;
    case('4'): confused = true; break;
    case('5'): confused = false;  break;
    case('6'): confused2 = true; break;
    case('7'): confused2 = false;  break;
    
  }
}