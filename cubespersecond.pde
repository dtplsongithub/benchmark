int cubes = 0;

void cubespersecond() {
  hint(ENABLE_DEPTH_TEST);
  cubes = 0;
  background(30);
  translate(0, 0, -600);
  fill(200);
  stroke(190);
  while(cubes<10000) {
    float x = random(width);
    float y = random(height);
    float z = random((width + height)/2);
    translate(x, y, z);
    box(10, 10, 10);
    cubes++;
    translate(-x, -y, -z);
  }
  total+=cubes/10000;
  translate(0, 0, 600);
  hint(DISABLE_DEPTH_TEST);
  fill(0);
  boldText("this part was mostly made by hexahedron1", 2, height-50);
}

void boldText(String text, float x, float y) {
  fill(0);
  text(text, x, y+1);
  text(text, x, y-1);
  text(text, x+1, y);
  text(text, x-1, y);
  fill(255);
  text(text, x, y);
}
