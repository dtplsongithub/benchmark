void terrain() {
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
