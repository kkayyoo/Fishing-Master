//Define

class Money{
  
  float x;
  float y;
  float speed;
  int r4;
  PImage moneybag;
 
  
//Constructor

Money ( float tempX, float tempY){
  x =  tempX;
  y = tempY;
  r4 = 10;
  speed = random(4, 8);
  moneybag = loadImage("moneybag.png");
  
}

void move(){
  
  y += speed;
  
  if (y > height){
   y = -1000;
   x = random (200,680);
  }
}

void display(){
  image(moneybag, x, y);
  
  //fill(120);
  //ellipse(Ex, Ey, r2, r2);
  
}

void caught(){
  y = -1000;
  point += 5;
}
}
