//Yaqi Qiu Final Project -- Fishing Master (Game)
//I used object, loop, conditional, and intersect features as the main part of this game.
//I also add timer, Images, and sound to make this game more interesting.
//Pleasse enjoy it!


import ddf.minim.*;

//image
PImage sea;
PImage begin;
PImage state1;
PImage coinbag;
PImage end;
PImage end2;
PImage button2;

PFont heading;
PFont f;

//declare all sound variables
Minim minim;
//sound effects
AudioPlayer background_music;
AudioPlayer match;
AudioPlayer boom;
AudioPlayer coin;
AudioPlayer failed;
AudioPlayer congratulation;

//declare all class variables
Net net;
Fish [] fishes;
Boom [] booms;
Money [] money;
Bubbles[] bubbles;

int totalFish = 0;
int totalBoom = 0;
int totalMoney = 0;
int totalBubbles = 0;

//coin number
public int point = 0;
//timer
Timer timer;
public int  totalTime;
//game state
int gameState = 0;


void setup(){
  
  size(970, 545);
  smooth();
  
  minim = new Minim(this);
  
  sea = loadImage("background.png"); 
  begin = loadImage("state0.jpg");
  state1 = loadImage("state1.jpg");
  coinbag = loadImage("money.png");
  end = loadImage("state3.jpg");
  end2 = loadImage("end2.jpg");
  button2 = loadImage("button2.png");
  
  background_music = minim.loadFile("seaworld.mp3");
  match = minim.loadFile("match.mp3");
  boom = minim.loadFile("boom.wav");
  coin = minim.loadFile("coin.wav");
  failed = minim.loadFile("failed.mp3");
  congratulation = minim.loadFile("Congratulation.mp3");
  
 
  fishes = new Fish[20];
  for (int i = 0; i < fishes.length; i++){
  fishes[i] = new Fish( random(-1000,-100), random(150,400));
  }
  
  booms = new Boom[4];
  for (int i = 0; i < booms.length; i++){
  booms[i] = new Boom( random(150,780), random(-500, 0));
  }
  
  money = new Money[2];
  for (int i = 0; i < money.length; i++){
  money[i] = new Money( random(200,700), random(-1500, 1000));
  }
  
  bubbles = new Bubbles[20];
  for (int i = 0; i < bubbles.length; i++){
    bubbles[i] = new Bubbles(random(width), 550, random(10,20));
  }
  
  net = new Net(mouseX, mouseY, 25);
  
  timer = new Timer(20);
   
}//setup

void draw(){
  
  gameBegin();
  gameHelp();
  game();
  gameEnd();
  gameFailed();
  
}//draw


void gameBegin () {
  if (gameState == 0){
     background(255);
     image(begin, 0, 0);
    
  }//state0
}//gameBegin

void gameHelp () {
   if (gameState == 1){
    background(255);
    image (state1,0,0);
   }//state1
}//gameHelp

void game () {
  if (gameState == 2){
   
    background(255);
    image(sea, 0,0);
    noCursor();
    
    image(coinbag, 18,18);
    f = loadFont("Breathe-Regular-26.vlw");
    textAlign(CENTER);
    fill(252,109,25);
    textFont(f, 24);
    text("Coin:", 130, 56);
    text(point, 170, 56);
    
    timer.update();
    if(timer.totalTime >= 10){
    text("Time:  00 : " + timer.totalTime, 165, 85);
    } else {
      text("Time:  00 : 0" + timer.totalTime, 165, 85);
    }
    
    //fish
    for( int i = 0; i < fishes.length; i++){
      fishes[i].move();
      fishes[i].display();
    if (net.intersect(fishes[i])){
      fishes[i].caught();
      match = minim.loadFile("match.mp3");
      match.play();
    }
  }
  
  //boom
   for( int i = 0; i < booms.length; i++){
      booms[i].move();
      booms[i].display();
    if (net.intersect(booms[i])){
      booms[i].caught();
      boom = minim.loadFile("boom.wav");
      boom.play();
      gameState=4;
      background_music.close();
    }
  }
  
  //moneybag
    for( int i = 0; i < money.length; i++){
      money[i].move();
      money[i].display();
    if (net.intersect(money[i])){
      money[i].caught();
      coin = minim.loadFile("coin.wav");
      coin.play();
    }
  }
  
   //bubbles
    for (int i = 0; i < bubbles.length; i++){
      bubbles[i].move();
      bubbles[i].display();
     } 
     
   //hand  
   net.move(mouseX, mouseY);
   net.display();
    
   }//state2
}//game

void gameEnd () {
  
   if(timer.finished){
     gameState=3;
     background_music.close();
   }
  
   if  (gameState == 3){  
     
     cursor();  
     //background(255);
     image(end,0,0);
     image(button2, 430, 300);
     heading = loadFont("AGaramondPro-BoldItalic-58.vlw");
     textFont(heading, 72);
     textAlign(CENTER);
     fill(255, 112, 3);
     //text("Congratulation!", 350, 250);
     textFont(heading, 42);
     strokeWeight(8);
     textAlign(CENTER);
     fill(255, 166, 0);
     text("You got " + point, 210, 340);
     text("coins", 362, 340);
     congratulation.play();
     }//state3
}//gameEnd

void gameFailed () {
   if (gameState == 4){
       cursor();
       image(end2, 0,0);
       image(button2, 650, 420);
       heading = loadFont("AGaramondPro-BoldItalic-58.vlw");
       textFont(heading, 72);
       textAlign(CENTER);
       fill(255);
       text("You Failed...", width/2, 320);
       //failed = minim.loadFile("failed.mp3");
       failed.play();
     }//state4
}//gameFailed
 
 
void mousePressed(){ //switch game in different states
  
   if (gameState == 0 && mouseY > 410 && mouseY < 470){
     if (mouseX > 610 && mouseX < 680){
       gameState = 1;
     }else if (mouseX > 310 && mouseX < 410){
      gameState = 2;
      timer.start();
      point = 0;
      background_music = minim.loadFile("seaworld.mp3");
      background_music.play();
     }
   }
    
  if (gameState == 1 && mouseX > 460 && mouseX < 550 && mouseY > 410 && mouseY < 470){
    gameState = 0;
    timer = new Timer(20);
    timer.start();
  }
  
  if (gameState == 3 && mouseX > 430 && mouseX < 570 && mouseY > 280 && mouseY < 360 ){
    gameState = 0;
    timer = new Timer(20);
    timer.start();
     congratulation.close();
  }
  
  if (gameState == 4 && mouseX > 650 && mouseX < 780 && mouseY > 420 && mouseY < 500 ){
    gameState = 0;
    timer = new Timer(20);
    timer.start();
  }
  
}//mousepressed  


  
  
 

  
