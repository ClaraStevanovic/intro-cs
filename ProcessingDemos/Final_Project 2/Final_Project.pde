/*
Clara Stevanovic
 7/8/22
 Final Project: Collision Game
 
 
 Image citations:
 background: https://www.newgrounds.com/art/view/vannzilla/pixel-art-cave-background
 "Cave Dash" logo: https://www.behance.net/gallery/29595201/Cave-Dash-iOS-game
 play button: https://pngtree.com/freepng/play-button-candy-blue_5306396.html
 character: https://www.shutterstock.com/fr/image-vector/abstract-video-game-characters-cute-creatures-1654971382
 
 
 FEEDBACK:
 
 Bea and Merit: Make circle into an image. Add lives. Speed it up gradually.
 
 */

//VARIABLES

//player circle
int playerX = 60;
int playerY = 215;
int playerWidth = 40;
int playerHeight = 40;

float controlY = 100;
float playerSpeed = 5;
float playerYSpeed = 5;

float setplayer;

//movement
boolean upKey = false;
boolean downKey = false;

//replay
boolean spaceKey = false;

//images
PImage backgroundImage;
PImage caveDash;
PImage play;
PImage player;
PImage player2;
PImage player3;
PImage player4;
PImage gameOver;

int value = 0;
int keyChoice;

//coins and triangles
float[] triangleX = new float[3];
float[] triangleY = new float[3];

float[] triangleX2 = new float[3];
float[] triangleY2 = new float[3];

float[] coinsUpX = new float[3];
float[] coinsUpY = new float[3];

float[] coinsDownX = new float[3];
float[] coinsDownY = new float[3];

//changing screens
String screen = "start";

//score
float score = 0;

void setup() {
  size(500, 500);

  //images
  backgroundImage = loadImage("background.png");
  caveDash = loadImage("CaveDash.png");
  play = loadImage("PlayButton.png");
  player = loadImage("Sans titre.png");
  player2 = loadImage("player2.png");
  player3 = loadImage("player3.png");
  player4 = loadImage("player4.png");
  gameOver = loadImage("gameOver.jpg");

  //coin locations
  for (int i = 0; i< coinsUpX.length; i ++) {
    coinsUpX[i] = random(0, width);
    coinsUpY[i] = random(240, 350);
  }
  for (int i = 0; i< coinsDownX.length; i ++) {
    coinsDownX[i] = random(0, width);
    coinsDownY[i] = random(150, 200);
  }

  //triangle locations
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

  //changing between screens

  if (screen == "start") {
    startScreen();
  } else if (screen == "ingame") {
    gameScreen();
  } else if (screen == "gameOver") {
    gameOverScreen();
  }
  if (key == 'H' || key =='h') {
    screen = "start";
    restart();
    key = 'j';
  } else if (key == ' ') {
    screen = "ingame";
    replay();
    key = 'j';
  }
}


void mousePressed() {

  //start game
  if (screen == "start") {
    screen = "ingame";
  } else if (screen == "ingame") {
  } else if (screen == "gameOver") {
    resetGame();
  }
}


void startScreen() {

  //home page images
  image(backgroundImage, 0, 0, 500, 500);
  image(caveDash, 80, 30, 350, 200);
  image(play, 80, 183, 350, 200);

  stroke(204, 132, 0);
  strokeWeight(4);
  fill(255);
  rect(50, 350, 50, 50, 100);
  image(player, 50, 350, 50, 50);

  rect(120, 350, 50, 50, 100);
  image(player2, 120, 350, 50, 50);

  rect(190, 350, 50, 50, 100);
  image(player3, 190, 350, 50, 50);

  rect(190, 350, 50, 50, 100);
  image(player3, 190, 350, 50, 50);

  rect(260, 350, 50, 50, 100);
  image(player4, 260, 350, 50, 50);

  text("PLAYERS:", 10, 340);

  text("1", 70, 425);
  text("2", 140, 425);
  text("3", 210, 425);
  text("4", 280, 425);

  //instructions
  fill(255);
  textSize(15);
  text("Press up arrow to move up, and press down arrow to move down.", 20, 460);
  text("OBJECT:   Do not bump into anything, and collect the coins.", 20, 480);
  //text("Collect the coins to increase score.", 20, 480);
}




void gameScreen() {
  background(0);

  //background
  image(backgroundImage, 0, 100, 500, 270);


  // boarder lines
  strokeWeight(5);
  stroke(255);

  line(0, 360, 500, 360);
  line(0, 380, 500, 380);

  line(0, 100, 500, 100);
  line(0, 80, 500, 80);

  //scoreboard
  strokeWeight(1);
  fill(255);
  rect(10, 10, 180, 50);
  fill(0);
  textSize(25);
  text("Score:" + int(score), 20, 50);


  //CaveDash logo
  image(caveDash, 370, 10, 100, 50);



  //instructions
  fill(255);
  textSize(15);
  text("Press space to restart. Press H to return home.", 10, 450);


  //player functions
  playerHitCircle();
  movePlayer();
  
  
  if (key == '1' || key =='!') {
    keyChoice = 1;
  } else if (key == '2' || key =='@') {
    keyChoice = 2;
  } else if (key == '3' || key =='#') {
    keyChoice = 3;
  } else if (key == '4' || key =='$') {
    keyChoice = 4;
  }
 
  if (keyChoice == 1) {
   image(player, playerX, playerY, playerWidth, playerHeight);
   } else if (keyChoice == 2) {
   image(player2, playerX, playerY, playerWidth, playerHeight);
   } else if (keyChoice == 3) {
   image(player3, playerX, playerY, playerWidth, playerHeight);
   } else if (keyChoice == 4) {
   image(player4, playerX, playerY, playerWidth, playerHeight);
   }
  


  //COINS

  //coins at the bottom

  for (int i = 0; i< coinsUpX.length; i++) {
    coinsUpX[i] -= 3;
    if (coinsUpX[i] <= 0) {
      coinsUpX[i] = random(width, width*2-10);
    }
    coinsUp(coinsUpX[i], coinsUpY[i]);
    if (circleCircleCollisionCheck(coinsUpX[i], coinsUpY[i], 10, float(playerX), float(playerY), 50.0)) {
      coinsUpX[i] = 0;
      score = score+1;
    }
  }

  //coins at the top
  for (int i = 0; i< coinsDownX.length; i++) {
    coinsDownX[i] -= 3;
    if (coinsDownX[i] <= 0) {
      coinsDownX[i] = random(width, width*2-10);
    }
    coinsDown(coinsDownX[i], coinsDownY[i]);
    if (circleCircleCollisionCheck(coinsDownX[i], coinsDownY[i], 10, float(playerX+20), float(playerY+20), 50.0)) {
      coinsDownX[i] = 0;
      score = score+1;
    }
  }


  //SPIKES

  //Spikes facing down
  for (int i = 0; i< triangleX2.length; i++) {
    triangleX2[i] -= 1;
    if (triangleX2[i] <= 0) {
      triangleX2[i] = random(width, width*2);
    }
    trianglesDown(triangleX2[i], triangleY2[i]);
    if (rectangleCircleCollisionCheck(triangleX2[i]+10, triangleY2[i]-75, 15, 60, float(playerX+20),
      float(playerY+20), 50.0)) {
      screen = "gameOver";
      playerY = 200;
    }
  }


  //Spikes facing up
  for (int i = 0; i< triangleX.length; i++) {
    triangleX[i] -= 3;
    if (triangleX[i] <= 0) {
      triangleX[i] = random(width, width*2-10);
    }
    triangles(triangleX[i], triangleY[i]);
    if (rectangleCircleCollisionCheck(triangleX[i]+15, triangleY[i], 10, 70, playerX+20,
      playerY+20, 50)) {
      screen = "gameOver";
      playerY= 200;
    }
  }

  if (playerY <= 100) {
    screen = "gameOver";
    playerY = 200;
  }
  if (playerY >=320) {
    screen = "gameOver";
    playerY = 200;
  }
}

void gameOverScreen() {

  //game over image
  image(gameOver, 60, 100, width/2+100, height/2);
}

void resetGame() {

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

void coinsDown(float x, float y) {
  strokeWeight(3);
  stroke(253, 248, 60);
  fill(255, 280, 37);
  circle(x, y, 10);
}

void coinsUp(float x, float y) {
  strokeWeight(3);
  stroke(253, 248, 60);
  fill(255, 280, 37);
  circle(x, y, 10);
}

void movePlayer() {
 
  if (keyChoice == 1) {
   image(player, playerX, playerY, playerWidth, playerHeight);
   } else if (keyChoice == 2) {
   image(player2, playerX, playerY, playerWidth, playerHeight);
   } else if (keyChoice == 3) {
   image(player3, playerX, playerY, playerWidth, playerHeight);
   } else if (keyChoice == 4) {
   image(player4, playerX, playerY, playerWidth, playerHeight);
   }
   
  playerYSpeed = 0;

  if (upKey) playerYSpeed -= playerSpeed;
  if (downKey) playerYSpeed += playerSpeed;

  if (playerYSpeed != 0) {
    playerYSpeed = playerYSpeed/sqrt(2);
  }
  playerY += playerYSpeed;
}

void keyPressed() {
  if (keyCode == UP) {
    upKey = true;
  } else if (keyCode == DOWN) {
    downKey = true;
  }
}

void keyReleased() {
  if (keyCode == UP) {
    upKey = false;
  } else if (keyCode == DOWN) {
    downKey = false;
  }
}

void restart() {

  score = 0;
  backgroundImage = loadImage("background.png");
  caveDash = loadImage("CaveDash.png");
  play = loadImage("PlayButton.png");
  player = loadImage("Sans titre.png");
  gameOver = loadImage("gameOver.jpg");

  for (int i = 0; i< coinsUpX.length; i ++) {
    coinsUpX[i] = random(0, width);
    coinsUpY[i] = random(240, 350);
  }
  for (int i = 0; i< coinsDownX.length; i ++) {
    coinsDownX[i] = random(0, width);
    coinsDownY[i] = random(150, 200);
  }

  for (int i = 0; i< triangleX.length; i ++) {
    triangleX[i] = random(0, width);
    triangleY[i] = random(240, 350);
  }
  for (int i = 0; i< triangleX2.length; i ++) {
    triangleX2[i] = random(0, width);
    triangleY2[i] = random(150, 200);
  }
}





void replay() {

  score = 0;

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
  rect(10, 10, 180, 50);
  fill(0);
  textSize(25);
  text("Score:" + int(score), 20, 50);


  //Logo
  image(caveDash, 370, 10, 100, 50);




  fill(255);
  textSize(15);
  text("Press space to restart. Press H to return home.", 10, 450);



  movePlayer();
  //coins



  //coins at the bottom

  for (int i = 0; i< coinsUpX.length; i++) {
    coinsUpX[i] -= 3; 
    if (coinsUpX[i] <= 0) {
      coinsUpX[i] = random(width, width*2-10);
    }
    coinsUp(coinsUpX[i], coinsUpY[i]);
    if (circleCircleCollisionCheck(coinsUpX[i], coinsUpY[i], 10, float(playerX+20), float(playerY+20), 50.0)) {
      coinsUpX[i] = 0;
      score = score+1;
    }
  }

  //coins at the top
  for (int i = 0; i< coinsDownX.length; i++) {
    coinsDownX[i] -= 3;
    if (coinsDownX[i] <= 0) {
      coinsDownX[i] = random(width, width*2-10);
    }
    coinsDown(coinsDownX[i], coinsDownY[i]);
    if (circleCircleCollisionCheck(coinsDownX[i], coinsDownY[i], 10, float(playerX+20), float(playerY+20), 50.0)) {
      coinsDownX[i] = 0;
      score = score+1;
    }
  }




  //Spikes facing down
  for (int i = 0; i< triangleX2.length; i++) {
    triangleX2[i] -= 1;
    score= score+0.05;
    if (triangleX2[i] <= 0) {
      triangleX2[i] = random(width, width*2);
    }
    trianglesDown(triangleX2[i], triangleY2[i]);
    if (rectangleCircleCollisionCheck(triangleX2[i]+10, triangleY2[i]-75, 10, 70, float(playerX+20),
      float(playerY+50), 50.0)) {
      rect(triangleX2[i]+10, triangleY2[i]-75, 15, 60);
      screen = "gameOver";
    }
  }


  //Spikes facing up
  for (int i = 0; i< triangleX.length; i++) {
    triangleX[i] -= 3;
    if (triangleX[i] <= 0) {
      triangleX[i] = random(width, width*2-10);
    }
    triangles(triangleX[i], triangleY[i]);
    if (rectangleCircleCollisionCheck(triangleX[i]+10, triangleY[i]-5, 10, 70, playerX-20,
      playerY+20, 50)) {
      rect(triangleX[i]+10, triangleY[i]-5, 10, 70);
      screen = "gameOver";
    }
  }
}
