//Define

class Fish{
  
  float x;
  float y;
  float speed;
  int r2;
  PImage fish;
 
  
//Constructor

Fish ( float tempX, float tempY){
  x =  tempX;
  y = tempY;
  r2 = 15;
  speed = random(2, 10);
  fish = loadImage("Fish1.png");
  
}

void move(){
 
    x += speed;
 
  if (x > width){
   x = -1000;
   y = random (180, 420);
  }
}

void display(){
  image(fish, x, y);
  
  //fill(120);
  //ellipse(Ex, Ey, r2, r2);
  
}

void caught(){
 
  x = -1000;
  point +=1;
}
}
