/*
Clara Stevanovic
 6/29/2022
 Animated "Starry Night"
 
 Description:
 I took inspiration from Vincent Van Goh's Starry Night painting, using very similar
 colors and painting composition as Van Goh's origional. By animating the stars in the
 night sky, I added vivacity to one of the most iconic paintings in history.
 
 If I had more time, I would have added sparkles, using random dots, to the "land" part
 of the landscape. In my animation, there is nothing on the ground, wheras in Van Goh's
 painting, there are buildings and textures there.
 
 One thing that really bothers me though, is that the stars' glows osclate so quickly. I 
 think this gives the painting a sense of nervousness, and discomfort. I would need more
 time to figure out a way to generate random speed values, less than 1 and greater than
 zero, that will also consistantly producethe same speed values for both the yellow and 
 blue circles. 
 
 
 
 
 */


int speed;
float radiusMoona = 200;
float radiusMoonb = 140;
int speed2;
float radiusStar1a = 140;
float radiusStar1b = 90;
int speed3;
float radiusStar2a = 170;
float radiusStar2b = 100;
int speed4;
float radiusStar3a = 100;
float radiusStar3b = 50;
int speed5;
float radiusStar4a = 100;
float radiusStar4b = 50;
int speed6;
float radiusStar5a = 160;
float radiusStar5b = 90;
int speed7;
int speed8;
int speed9;
int speed10;
int speed11;
int speed12;

void setup() {
  size(650, 500);
  speed = int(random(1, 2));
  speed2 = int(random(1, 2));
  speed3 = int(random(1, 2));
  speed4 = int(random(1, 2));
  speed5 = int(random(1, 2));
  speed6 = int(random(1, 2));
  speed7 = int(random(1, 2));
  speed8 = int(random(1, 2));
  speed9 = int(random(1, 2));
  speed10 = int(random(1, 2));
  speed11 = int(random(1, 2));
  speed12 = int(random(1, 2));
}

void draw() {
  background(0, 10, 80);
  stroke(0);


  //back landscape

  fill(207, 165, 69);
  triangle(650, 290, 0, 500, 650, 500);

  //middle landscape

  fill(36, 22, 74);
  triangle(-200, 500, 650, 340, 650, 500);

  //front landscape

  fill(14, 7, 28);
  triangle(-400, 500, 650, 400, 650, 500);

  //(would have added sparkles within the parameters of this trianguar area.)


  //moon

  noStroke();
  fill(27, 90, 125);
  circle(530, 100, radiusMoona);

  fill(181, 193, 110);
  circle(530, 100, radiusMoonb);

  fill(197, 109, 13);
  circle(530, 100, 90);

  fill(181, 193, 110);
  circle(550, 80, 76);

  radiusMoona = radiusMoona + speed;

  if (radiusMoona < 200) {
    speed = abs(speed);
  }
  if (radiusMoona > 220) {
    speed = -abs(speed);
  }

  radiusMoonb = radiusMoonb + speed2;

  if (radiusMoonb < 140) {
    speed2 = abs(speed2);
  }
  if (radiusMoonb > 160) {
    speed2 = -abs(speed2);
  } //ANGIE: First comment - make two separate speed variables for moon a and b

  //star1

  fill(27, 90, 125);
  circle(350, 0, radiusStar1a);

  fill(181, 193, 110);
  circle(350, 0, radiusStar1b);

  fill(197, 109, 13);
  circle(350, 00, 30);

  radiusStar1a = radiusStar1a + speed3;

  if (radiusStar1a < 140) {
    speed3 = abs(speed3);
  }
  if (radiusStar1a > 160) {
    speed3 = -abs(speed3);
  }

  radiusStar1b = radiusStar1b + speed4;

  if (radiusStar1b < 90) {
    speed4 = abs(speed4);
  }
  if (radiusStar1b > 110) {
    speed4 = -abs(speed4);
  }


  //star2

  fill(27, 90, 125);
  circle(240, 200, radiusStar2a);

  fill(181, 193, 110);
  circle(240, 200, radiusStar2b);

  fill(197, 109, 13);
  circle(240, 200, 40);

  radiusStar2a = radiusStar2a + speed5;

  if (radiusStar2a < 140) {
    speed5 = abs(speed5);
  }
  if (radiusStar2a > 160) {
    speed5 = -abs(speed5);
  }

  radiusStar2b = radiusStar2b + speed6;

  if (radiusStar2b < 90) {
    speed6 = abs(speed6);
  }
  if (radiusStar2b > 110) {
    speed6 = -abs(speed6);
  }


  //star3

  fill(27, 90, 125);
  circle(360, 280, radiusStar3a);

  fill(181, 193, 110);
  circle(360, 280, radiusStar3b);

  fill(197, 109, 13);
  circle(360, 280, 20);

  radiusStar3a = radiusStar3a + speed7;

  if (radiusStar3a < 100) {
    speed7 = abs(speed7);
  }
  if (radiusStar3a > 120) {
    speed7 = -abs(speed7);
  }

  radiusStar3b = radiusStar3b + speed8;

  if (radiusStar3b < 50) {
    speed8 = abs(speed8);
  }
  if (radiusStar3b > 70) {
    speed8 = -abs(speed8);
  }

  //star4

  fill(27, 90, 125);
  circle(0, 280, radiusStar4a);

  fill(181, 193, 110);
  circle(0, 280, radiusStar4b);

  fill(197, 109, 13);
  circle(0, 280, 20);

  radiusStar4a = radiusStar4a + speed9;

  if (radiusStar4a < 100) {
    speed9 = abs(speed9);
  }
  if (radiusStar4a > 120) {
    speed9 = -abs(speed9);
  }

  radiusStar4b = radiusStar4b + speed10;

  if (radiusStar4b < 50) {
    speed10 = abs(speed10);
  }
  if (radiusStar4b > 70) {
    speed10 = -abs(speed10);
  }


  //star5

  fill(27, 90, 125);
  circle(20, 100, radiusStar5a);

  fill(181, 193, 110);
  circle(20, 100, radiusStar5b);

  fill(197, 109, 13);
  circle(20, 100, 30);

  radiusStar5a = radiusStar5a + speed11;

  if (radiusStar5a < 160) {
    speed11 = abs(speed11);
  }
  if (radiusStar5a > 180) {
    speed11 = -abs(speed11);
  }

  radiusStar5b = radiusStar5b + speed12;

  if (radiusStar5b < 90) {
    speed12 = abs(speed12);
  }
  if (radiusStar5b > 110) {
    speed12 = -abs(speed12);
  }


  //front trees

  fill(3, 1, 1);
  triangle(50, 500, 80, 180, 110, 500);
  triangle(70, 500, 120, 70, 160, 500);
  triangle(120, 500, 170, 330, 230, 500);
  triangle(180, 500, 210, 370, 300, 500);
}

/*
Feedback:
 
 Merit: said that I should add a mini light house --> but I think that would
 not look good in the landscape, which doesn't have any other buildings.
 
 Bea: use different shades of flashing/alternatingbackground --> I thought that this
 would make the picture look imbalanced, so I did not do it.
 
 Merit: change shades of stars --> I would have done this with more time.
 
 */
