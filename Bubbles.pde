//Define
class Bubbles{
  
 float x, y;
 float r;
 float speed;
 
//Constructor

Bubbles (float tempX, float tempY, float radius){
  x = tempX;
  y = tempY;
  r = radius;
  speed = random(0.5, 2);
}

void move(){
  y -= speed;
  if (y < 0){
    y = 1000;
    x = random(150, 780);
  }
}

void display(){
  noFill();
  stroke(225);
  strokeWeight(1);
  ellipse(x, y, r, r);
}
}

  
  
