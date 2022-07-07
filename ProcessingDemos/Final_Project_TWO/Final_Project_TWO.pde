
int playerX = 55;
int playerY = 310;
int playerWidth = 40;
int playerHeight = 40;
PImage backgroundImage;
PImage caveDash;
PImage play;

float[] triangleX = new float[3];
float [] triangleY = new float[3];

float[] triangleX2 = new float[3];
float[] triangleY2 = new float[3];

String screen = "start";


void setup() {
  size(500, 500);
  backgroundImage = loadImage("background.png");
  caveDash = loadImage("CaveDash.png");
  play = loadImage("PlayButton.png");
  for (int i = 0; i< triangleX.length; i ++) {
    triangleX[i] = random(0, width);
    triangleY[i] = random(240, 350);
  }
  for (int i = 0; i< triangleX2.length; i ++) {
    triangleX2[i] = random(0, width);
    triangleY2[i] = random(150, 200);
  }
}


void draw() {

  if (screen == "start") {
    startScreen();
  } else if (screen == "ingame") {
    gameScreen();
  } else if (screen == "gameOver") {
    gameOverScreen();
  }
}


void mousePressed() {
  if (screen == "start") {
    screen = "ingame"; // If you click while on
    // the start screen, change to the game screen
  } else if (screen == "ingame") {
  } else if (screen == "gameOver") {
    resetGame();
  }
}


void startScreen() {
  
  image(backgroundImage, 0, 0, 500, 500);
  image(caveDash, 90, 40, 320, 190);
  image(play,100,250,100,70);
  
  
}

void gameScreen() {
  background(0);

  image(backgroundImage, 0, 100, 500, 270);


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

  //image(backgroundImage,100,400,100,100);

  playerHitCircle();


  //Spikes facing up
  for (int i = 0; i< triangleX.length; i++) {
    triangleX[i] -= 1;
    if (triangleX[i] <= 0) {
      triangleX[i] = width;
    }
    triangles(triangleX[i], triangleY[i]);
  }
  
  //Spikes facing down
    for (int i = 0; i< triangleX2.length; i++) {
    triangleX2[i] -= 1;
    if (triangleX2[i] <= 0) {
      triangleX2[i] = width;
    }
    trianglesDown(triangleX2[i], triangleY2[i]);
  }


  //if (keyPressed == true){

  //}

  //for (int x <

  //Gold on the ground

  //
}

void gameOverScreen() {
  // Do everything you would want in draw() while on
  // the game over screen
}

void resetGame() {
  // Reset all your variables! Think of this like
  // a second setup() function

  triangleX = new float[3];
  triangleY = new float[3];
  
  triangleX2 = new float[3];
  triangleY2 = new float[3];
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
    if (playerY >= 300) {
      playerY = 300;
    }
    if (playerY <= 100) {
      playerY = 100;
    }
  }
  if (mouseX >=590 && mouseX <= width - playerHeight) {
    playerX = mouseX;
  }
}

void triangles(float x, float y) {
  strokeWeight(5);
  stroke(67, 67, 67);
  fill(20, 19, 20);
  //x1, y1, x2, y2, x3,y3
  triangle(x, 355, x+20, y, x+40, 355);
}

void trianglesDown(float x, float y) {
  strokeWeight(5);
  stroke(67, 67, 67);
  fill(20, 19, 20);
  //x1, y1, x2, y2, x3,y3
  triangle(x, 105, x+20, y, x+40, 105);
}
