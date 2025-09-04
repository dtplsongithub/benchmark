void ballworld() {
  hint(ENABLE_DEPTH_TEST);
  lights();
  beginCamera();
  camera();
  translate(width, 0, -(t-1900)*50);
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
  hint(DISABLE_DEPTH_TEST);
}
