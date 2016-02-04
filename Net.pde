//Define

class Net{
  
  float x;
  float y;
  float r1;
  PImage hand;
  
  
//Constructor

Net(float  tempX, float tempY, float radius){
  x = tempX;
  y = tempY;
  r1 = radius;
  hand = loadImage("hand.png");

}

//Function

void move(float tempX, float tempY){
  
  x = tempX;
  y = tempY;
}
 
void display(){
  noCursor();
  image(hand, x, y);
  //fill(1);
  //ellipse(x, y, r1, r1);
}


// write a function that detects if two objects intersect:
// if the distance between the centers of the two circles < the sum of the 2 radiuses, they intersect
// if the two balls intersect return true.  Otherwise return false
 boolean intersect(Fish d){
   // Calculate distance between the center of the net and fishes
  float distance = dist(x, y, d.x, d.y);
   if (distance < r1 + d.r2 && mousePressed){
    return true;
  }else{
    return false;
  }
}
  boolean intersect(Boom d){
  float distance = dist(x, y, d.x, d.y);
   if (distance < r1 + d.r3 && mousePressed){
    return true;
  }else{
    return false;
  }
}
  boolean intersect(Money d){
  float distance = dist(x, y, d.x, d.y);
   if (distance < r1 + d.r4 && mousePressed){
    return true;
  }else{
    return false;
  }
}
}
