

class Timer {
 
  int savedTime; // When Timer started
  int totalTime; // How long Timer should last
  boolean finished = false;
  
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
  // Starting the timer
  void start() {
  
    savedTime = millis(); 
  }
  
  void update(){
    
   if (!finished) { 
    
    int passedTime = millis()- savedTime;
    
    if (passedTime > 2500) {
      totalTime -= 1;
      savedTime = millis();
    }
    
    if (totalTime == 0){
      finished = true;
    } 
    }
  }
}