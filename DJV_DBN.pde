/**
 _________________   ___
/______/______/__/\ /__/
|  __  \  __  \  \ \| ||
|  | \ |  |_| |   \ | ||
|  | | |  __  / |\ \| ||
|  | | |  | | | ||\   ||
|  |_/ |  |_| | || \  ||
|______/______/_|/  \_|/
  * DJV_DBN
  * v0.240219b
  */
  
  
int t;

String[] titles = {"D'S BENCHMARK", "made in 2024 in processing.", "", "BENCHMARK SCORE: ", "press esc to exit"};
int maxbn = 7;
int oldsecond = second();
int total = 0;
boolean debug = false;
int bndur = 300;
int totstep = 20;
int endt = -1; // -1 is not set
PImage imgon, imgoff, imgonw;
boolean update = true;
long maxMemory = Runtime.getRuntime().maxMemory();
long allocatedMemory = Runtime.getRuntime().totalMemory();
long freeMemory = Runtime.getRuntime().freeMemory();

int[] buildSettings = new int[101]; // lights
String[] buildTitle = {"pet shop", "hotel", "lidl", "store", "yummy food", "pharmacy", "HYPERMALL", "school", "police station", "mcdonalds"};
int[] buildTitleSettings = new int[101];
int[] buildSizes = new int[101];
color[] buildColor = {#777777, #000000, #574b2b, #572b2b, #3b572b, #2b5557, #2b2e57, #522b57, #444444, #aaaaaa};
int[] buildColorSettings = new int[101];

color[] gradients = new color[201];
color[] gradients2 = new color[201];
float[][] gradientsRot = new float[201][3];
float[][] gradientsVRot = new float[201][3];
float[] gradientsVZ = new float[201];
float[] gradientsZ = new float[201];

float[][] ballPos = new float[200][3];
float[][] ballV = new float[200][3];
int[] ballSize = new int[200];
color[] ballColor = new color[200];

int terrainzoom = 7;
int terraintypezoom = 20;
int terrainmaxalt = 700;
int terrainxoff = 0;
int terrainyoff = 500;
int terrainzoff = -300;
int terrainsize = 150;

int q3drmp = 2;

// SETUP 

void setup(){
  fullScreen(P3D);
  background(0);
  stroke(255);
  frameRate(999);
  textFont(loadFont("MS-Gothic-22.vlw"));
  imgon = loadImage("on.png");
  imgoff = loadImage("off.png");
  imgonw = loadImage("onw.png");
  perspective(PI/3.0, float(width)/float(height), ((height/2.0) / tan(PI*60.0/360.0))/10.0, 99999);
  for(int i = 0; i<buildSettings.length; i++){
    buildSettings[i]=(int)(Math.floor(random(0,3)));
  }
  for(int i = 0; i<buildTitleSettings.length; i++){
    buildTitleSettings[i]=(int)(Math.floor(random(0,buildTitle.length)));
  }
  for(int i = 0; i<buildSizes.length; i++){
    buildSizes[i]=(int)(Math.floor(random(-2,8)));
  }
  for(int i = 0; i<buildColorSettings.length; i++){
    buildColorSettings[i]=(int)(Math.floor(random(0,buildColor.length)));
  }
  for(int i = 0; i<buildColorSettings.length; i++){
    buildColorSettings[i]=(int)(Math.floor(random(0,buildColor.length)));
  }
  for(int i = 0; i<gradients.length; i++){
    int theone = (int)(random(0, 3));
    gradients[i]=color(random(0, 255*int(theone==0)),random(0, 255*int(theone==1)),random(0, 255*int(theone==2)));
    gradients2[i]=color(random(0, 64*int(theone==0)),random(0, 64*int(theone==1)),random(0, 64*int(theone==2)));
  }
  for(int i = 0; i<gradientsVRot.length; i++){
    gradientsVRot[i][(int)(random(0, 2))]=random(-0.3, 0.3);
  }
  for(int i = 0; i<gradientsVZ.length; i++){
    gradientsVZ[i]=int(random(-3, 10));
  }
  for(int i = 0; i<ballV.length; i++){
    ballV[i][(int)(random(0, 2))*2]=random(10, 40)*(int(random(0, 3))-1);
  }
  for(int i = 0; i<ballPos.length; i++){
    ballPos[i][0]=random(-6000, 6000);
    ballPos[i][1]=random(-3000, 3000);
    ballPos[i][2]=random(-6000, 6000);
  }
  for(int i = 0; i<ballSize.length; i++){
    ballSize[i]=int(random(100, 600));
  }
  for(int i = 0; i<ballColor.length; i++){
    ballColor[i]=color(random(127, 255), random(127, 255), random(127, 255), random(64, 191));
  }
}


// DRAWING


void draw(){
  update = true;
  background(0);
  int benchnr = (int)(Math.floor(t/bndur));
  if (benchnr > 0 && benchnr <= maxbn) {
    frameRate(999);
  } else {
    frameRate(30);
  }
  if (benchnr <= maxbn) {
  switch (benchnr){
    case 0: {
      textSize(40);
      for (int i = 0; i < 3; i++){
        text(titles[i], (width-textWidth(titles[i]))/2, height/2+i*40); 
      }
      break;
    }
    case 1: {
      for(int i = 0; i < 10000; i++){
        line(random(width), random(height), -1, random(width), random(height), -1);
      }
      break;
    }
    case 2: {
      noStroke();
      fill(255, 10);
      for(int i = 0; i < 1500; i++){
        rect(random(width), random(height), random(width/3), random(height/3));
      }
      break;
    }
    case 3: {
      for(int i = 0; i < 5000; i++){
        fill(255, random(127, 255));
        text("HELLO NUMBER "+i,random(width), random(height));
      }
      break;
    }
    case 4: {
      beginCamera();
      camera();
      translate(800, 1000, 0);
      rotateY(float(t)/1000);
      endCamera();
      directionalLight(255, 255, 255, 0, 1, 0);
      ambientLight(255, 255, 255);
      translate(80, 200, 0);
      for(int x = 0; x<25; x++){
      for(int y = 0; y<25; y++){
      pushMatrix();
      fill(255);
      translate(x*200-(200*25/2), -buildSizes[(x+y*40)%100]*25+40, y*200-(200*25/2));
      stroke(255);
      fill(buildColor[buildColorSettings[(x+y*40)%100]]);
      box(100, 300+buildSizes[(x+y*40)%100]*50+40, 100);
      translate(0, 0, -100);
      for (int s = 49; s>-120; s-=152){
      fill(255, 190);
      translate(0, 0, s);
      rotateY(PI);
      textSize(16);
      textLeading(10);
      int size = 300+buildSizes[(x+y*40)%100]*50;
      text(buildTitle[buildTitleSettings[(x+y*10)%buildTitleSettings.length]], -textWidth(buildTitle[buildTitleSettings[(x+y*10)%buildTitleSettings.length]])/2, -size/2-5, 90, 999);
      fill(255, 255, 0);
      for(int i = 0; i<8+(buildSizes[(x+y*40)%100]*2); i+=2){
        switch(buildSettings[(i+x+y*10)% 99]){
          case 0: image(imgon, -45, i*25-size/2+25);
          break;
          case 1: image(imgonw, -45, i*25-size/2+25);
          break;
          case 2: image(imgoff, -45, i*25-size/2+25);
          break;
        }
        switch(buildSettings[(i+1+x+y*10)% 99]){
          case 0: image(imgon, 5, i*25-size/2+25);
          break;
          case 1: image(imgonw, 5, i*25-size/2+25);
          break;
          case 2: image(imgoff, 5, i*25-size/2+25);
          break;
        }
      }
      }
      popMatrix();
      }
      }
      break;
    }
    case 5: {
      beginCamera();
      camera();
      translate(width, 0, -400);
      rotateY((float)(Math.toRadians(t))/10);
      endCamera();
      for(int x = 0; x<(int)(ceil(width/100)*4); x++){
        for(int y = 0; y<(int)(ceil(height/100)*4); y++){
          int pos = (int)((x+y*(int)(ceil(height/100)*3))%200);
          pushMatrix();
          translate(x*100-width, y*100-height/2, -100+gradientsZ[pos]);
          rotateX(gradientsRot[pos][0]);
          rotateY(gradientsRot[pos][1]);
          rotateZ(gradientsRot[pos][2]);
          setGradient(-50, -50, 100, 100, gradients[pos], gradients2[pos]);
          popMatrix();
        }
      }
      for(int i = 0; i<gradientsVRot.length; i++){
        gradientsRot[i][0]+=gradientsVRot[i][0];
        gradientsRot[i][1]+=gradientsVRot[i][1];
        gradientsRot[i][2]+=gradientsVRot[i][2];
        gradientsZ[i]+=gradientsVZ[i];
      }
      int theone = (int)(random(0, 3));
      int thegradient = (int)(random(0, 200));
      gradients[thegradient]=color(random(0, 255*int(theone==0)),random(0, 255*int(theone==1)),random(0, 255*int(theone==2)));
      gradients2[thegradient]=color(random(0, 64*int(theone==0)),random(0, 64*int(theone==1)),random(0, 64*int(theone==2)));
      break;
    }
    case 6: {
      lights();
      beginCamera();
      camera();
      translate(width, 0, -(t-1600)*50);
      endCamera();
      for(int i = 0; i<ballPos.length; i++){
        pushMatrix();
        translate(ballPos[i][0],ballPos[i][1],ballPos[i][2]);
        strokeWeight(1);
        stroke(255, 64);
        fill(ballColor[i]);
        sphere(ballSize[i]);
        popMatrix();
        ballPos[i][0]+=ballV[i][0];
        ballPos[i][1]+=ballV[i][1];
        ballPos[i][2]+=ballV[i][2];
      }
      break; 
    }
    case 7: {
      noStroke();
      background(20);
      lights();
      beginCamera();
      camera();
      translate(1000, 0, 0);
      rotateY(float(t)/100);
      endCamera();
      pushMatrix();
      translate(terrainxoff, terrainyoff, terrainzoff);
      for(float x = 0; x<terrainsize; x++){
        for(float y = 0; y<terrainsize; y++){
          float tl = noise(x/terrainzoom, y/terrainzoom)*terrainmaxalt;
          float tr = noise((x+1)/terrainzoom, y/terrainzoom)*terrainmaxalt;
          float br = noise((x+1)/terrainzoom, (y+1)/terrainzoom)*terrainmaxalt;
          float bl = noise(x/terrainzoom, (y+1)/terrainzoom)*terrainmaxalt;
          if(quad3dover(tl, tr, br, bl, 240)){
            if(quad3dover(tl, tr, br, bl, 400)){
              fill(0, 140, 0);
            } else {
              fill(100);
            }
          } else {
            fill(255);
          }
          quad3d(
            (x-terrainsize/2)*20, tl, (y-terrainsize/2)*20,
            (x-terrainsize/2)*20+20, tr, (y-terrainsize/2)*20,
            (x-terrainsize/2)*20+20, br, (y-terrainsize/2)*20+20,
            (x-terrainsize/2)*20, bl, (y-terrainsize/2)*20+20
          );
        }
      }
      popMatrix();
      break;
    }
    default: {
      text("no benchmark number "+ benchnr+" was found!!", 300, 300);
      update = false;
    }
  }
  beginCamera();
  camera();
  translate(0, 0, 0);
  rotateZ(0);
  endCamera();
  stroke(255);
  fill(0);
  strokeWeight(2);
  rect(0, 0, 100, 34, 10);
  fill(255);
  textSize(22);
  text("FPS: "+Math.round(frameRate), 10, 25);
  if (second() != oldsecond && benchnr>0) {
    oldsecond = second();
    total += frameRate;
    maxMemory = Runtime.getRuntime().maxMemory();
    allocatedMemory = Runtime.getRuntime().totalMemory();
    freeMemory = Runtime.getRuntime().freeMemory();
  }
  if(debug){
    stroke(255);
    fill(0);
    rect(0, 34, 300, 470, 10);
    fill(255);
    textLeading(24);
    text("total: "+total+
    "\nt: "+t+
    "\n"+mouseX+", "+mouseY+"\n\n"+
    PGraphicsOpenGL.OPENGL_RENDERER+
    "\nOpenGL version: "+PGraphicsOpenGL.OPENGL_VERSION+
    "\nGLSL version: "+ PGraphicsOpenGL.GLSL_VERSION+
    "\n\n\nmax memory: "+maxMemory/(1024*1024*1024)+" GB"+
    "\nallocated memory: "+allocatedMemory/(1024*1024)+" MB"+
    "\nfree memory: "+freeMemory/(1024*1024)+" MB"+
    "\n\n\nmade in 2024"
    , 10, 40, 280, height);
  }
  } else { // no indentation? too bad :)
    background(0);
    if (endt == -1) endt = t;
    int tt = t-endt;
    fill(255);
    textSize(60);
    text(titles[3], (width-textWidth(titles[3]+total))/2, height/2);
    text(total, (width+textWidth(titles[3])-textWidth(total+""))/2, min(tt*60-(60*60), height/2)); // FIXed yeyy
    textSize(20);
    int fpsonavy = max((60-tt+60)*60, height/2)+30;
    text("("+nf(float(total)/(maxbn*(bndur/60)), 0, 2)+ " FPS on average)", width/2, fpsonavy);
    text(titles[4], (width-textWidth(titles[4]))/2, height-30);
  }
  t=millis()/(1000/60);
}
void keyPressed() {
  if (key == 'd'||key=='D') debug = !debug;
}
void setGradient(int x, int y, float w, float h, color c1, color c2 ) {
  strokeWeight(5);
  noFill();
  for (int i = y; i <= y+h; i++) {
    float inter = map(i, y, y+h, 0, 1);
    color c = lerpColor(c1, c2, inter);
    stroke(c);
    line(x, i, x+w, i);
  }  
}
boolean quad3dover(float tl, float tr, float br, float bl, int n){
  return (int(tl>n)+ int(tr>n)+ int(br>n)+ int(bl>n))>=q3drmp;
}
void quad3d(float x1, float y1, float z1, float x2, float y2, float z2, float x3, float y3, float z3, float x4, float y4, float z4) { // this not really a quad but eh
  beginShape();
  vertex(x1, y1, z1);
  vertex(x2, y2, z2);
  vertex(x3, y3, z3);
  vertex(x4, y4, z4);
  endShape();
}
void tri3d(float x1, float y1, float z1, float x2, float y2, float z2, float x3, float y3, float z3) {
  beginShape();
  vertex(x1, y1, z1);
  vertex(x2, y2, z2);
  vertex(x3, y3, z3);
  endShape();
}
