void buildings() {
  setGradient(0, 0, width, height, color(0, 0, 127), color(0, 0, 0));
  hint(ENABLE_DEPTH_TEST);
  beginCamera();
  camera();
  translate(800, 1000, 0);
  rotateY(float(t)/1000);
  endCamera();
  directionalLight(255, 255, 255, 0, 1, 0);
  ambientLight(255, 255, 255);
  translate(80, 200, 0);
  for (int x = 0; x<25; x++) {
    for (int y = 0; y<25; y++) {
      pushMatrix();
      fill(255);
      translate(x*200-(200*25/2), -buildSizes[(x+y*40)%100]*25+40, y*200-(200*25/2));
      stroke(255);
      fill(buildColor[buildColorSettings[(x+y*40)%100]]);
      box(100, 300+buildSizes[(x+y*40)%100]*50+40, 100);
      translate(0, 0, -100);
      for (int s = 49; s>-120; s-=152) {
        fill(255, 190);
        translate(0, 0, s);
        rotateY(PI);
        textSize(16);
        textLeading(10);
        int size = 300+buildSizes[(x+y*40)%100]*50;
        text(buildTitle[buildTitleSettings[(x+y*10)%buildTitleSettings.length]], -textWidth(buildTitle[buildTitleSettings[(x+y*10)%buildTitleSettings.length]])/2, -size/2-5, 90, 999);
        fill(255, 255, 0);
        for (int i = 0; i<8+(buildSizes[(x+y*40)%100]*2); i+=2) {
          switch(buildSettings[(i+x+y*10)% 99]) {
          case 0:
            image(imgon, -45, i*25-size/2+25);
            break;
          case 1:
            image(imgonw, -45, i*25-size/2+25);
            break;
          case 2:
            image(imgoff, -45, i*25-size/2+25);
            break;
          }
          switch(buildSettings[(i+1+x+y*10)% 99]) {
          case 0:
            image(imgon, 5, i*25-size/2+25);
            break;
          case 1:
            image(imgonw, 5, i*25-size/2+25);
            break;
          case 2:
            image(imgoff, 5, i*25-size/2+25);
            break;
          }
        }
      }
      popMatrix();
    }
  }
}
