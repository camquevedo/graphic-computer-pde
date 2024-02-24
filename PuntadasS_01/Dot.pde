class Dot {
  int x; 
  int y; 
  int s; 
  color c; 
  boolean selected;
   
  Dot(int localX, int localY) {
   
    x = localX;
    y = localY;
    s = 6;
  
  }
   void display(int dotColor) {
    fill(dotColor);
    stroke(0);
    strokeWeight(1);
    ellipse(x,y,s,s);
  }
}
