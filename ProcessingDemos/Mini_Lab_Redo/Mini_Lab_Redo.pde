/*
Clara Stevanovic
 7/5/2022
 Mini - Lab Redo
 Intro CS Summer 2022
 */

void setup() {

  size (500,500);

   for (int x = 60; x <= 400; x += 80) {
      teardrop(x, 100, 50);
 }
}

void teardrop(float x, float y, float w) {
  rect(x,y,w,100);
  triangle((x-w/2)+37, y+50, x+25, y-w+60, x+w/2+12, y+50);
  arc(x+25, y+50, w/2, w/2, radians(-3), radians(183), OPEN);

}

void diamond(float x, float y, float w) {
  rect(
  push();
  translate(x, y);
  rotate(radians(45));
  square(0, 0, w);
  pop();
}
