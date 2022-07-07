int playerX = 55;
int playerY = 300;
int playerWidth = 55;
int playerHeight = 55;
PImage backgroundImage;

void setup() {
  size(500, 500);
  backgroundImage = loadImage("background_png");
}

void draw() {

  background(0);
 
 
  
  // Border
  strokeWeight(5);
  stroke(255);
  
  line(0, 360, 500, 360);
  line(0, 380, 500, 380);

  line(0, 100, 500, 100);
  line(0, 80, 500, 80);

  //Score
  strokeWeight(1);
  fill(255);
  rect(10, 10, 150, 50);
  fill(0);
  textSize(25);
  text("Score:", 20, 50);

  //Time
  stroke(255);
  fill(255);
  rect(180, 10, 200, 50);
  fill(0);
  textSize(25);
  text("Time:", 200, 50);

  //Pause Game
  fill(255);
  textSize(15);
  text("Press space key to pause game.", 10, 450);
  
  image(backgroundImage,100,400,100,100);
  
  playerHitCircle();
  
  
  //Spikes facing down
//  for (int x = 10){
  //triangles(random(300,500));
  //}


  //if (keyPressed == true){

  //}

  //for (int x <

  //Gold on the ground

  //
}

void playerHitCircle() {
  stroke(204, 132, 0);
  strokeWeight(4);
  fill(255);
  rect(playerX, playerY, playerWidth, playerHeight, 100);
}

void mouseDragged() {
  if (mouseY >= 0 && mouseY <= height - playerWidth + 1) {
    playerY = mouseY;
    if (playerY >= 300){
     playerY = 300; 
    }
    if (playerY <= 100){
     playerY = 100; 
    }
  }
  if (mouseX >=590 && mouseX <= width - playerHeight) {
    playerX = mouseX;
  }
}

void triangles(float x) {
  
  triangle(x,350,x+20,270,x+40,350);
  
  
}
