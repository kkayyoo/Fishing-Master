//Define

class Boom{
  
  float x;
  float y;
  float speed;
  int r3;
  PImage boom;
 
  
//Constructor

Boom ( float tempX, float tempY){
  x =  tempX;
  y = tempY;
  r3 = 10;
  speed = random(.5,3);
  boom = loadImage("boom.png");
  
}

void move(){
 
  y += speed;
  
  if (y > height){
   y = -1000;
   x = random(180, 780);
  }
  
}

void display(){
  image(boom, x, y);
  
  //fill(120);
  //ellipse(Ex, Ey, r2, r2);
  
}

void caught(){
  y = -1000;
  //point -= 1;
}
}
