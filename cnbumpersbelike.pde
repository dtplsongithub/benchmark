void cnbumpersbelike() {
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
