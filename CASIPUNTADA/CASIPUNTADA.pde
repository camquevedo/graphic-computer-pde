
color dotColor= color(127);
color dotColorOver = color(255);
color dotColorClicked = color(0, 0, 0);

Dot[] dots = new Dot[999];
Dot[][] dots2 = new Dot[25][25];
Line[] lines = new Line[999];


int selectedDot=99, startDot= 99, endDot = 99;

boolean drawing;
boolean solved;

void setup() { 
  size(460, 460);

  frameRate(50);

  drawing=false;
  solved=false;

  int h=0;

  // Genera los puntos en el espacio
  for (int i =0; i<5; i++)
  {

    for (int j =0; j<5; j++)
    {

      dots[h] = new Dot(i*30+30, j*30+30);
      h++;
    }
  }

  // Color y visivilidad de los puntos
  for (int i=0; i<9; i++) {
    dots[i].c = dotColor;
    dots[i].display(dots[i].c);
  }

  int axy =0;
  for (int j=0; j<=20; j++) {
    for (int k=0; k<=20; k++) {

      lines[axy] = new Line(j, k);
      axy++;
    }
  }
}

void draw() {
  background(255);

  for (int i=0; i<25; i++) {
    dots[i].display(dots[i].c);
  }

  for (int i=0; i<99; i++) {
    if (lines[i].visible==true) { 
      lines[i].display();
    }
  }


  if (drawing==true) {    
    line(dots[selectedDot].x, dots[selectedDot].y, mouseX, mouseY);
  }
}

void mousePressed() {}

void mouseReleased() {
  if (solved==false) {

    drawing=false; 
    for (int i=0; i<25; i++) {
      if ((dots[i].selected()==true) ) {
        drawing=true;
        dots[i].c=dotColorClicked;
        selectedDot=i;
        break;
      }
    }

    if (drawing==true) {
      if (startDot==99) {
        startDot=selectedDot;
      } else if (endDot==99) {
        endDot=selectedDot;

        drawLine(startDot, endDot);
      }
      startDot=selectedDot;
      endDot=99;
    } else {
      startDot=99;
      endDot=99;
    }
  }
}

void mouseMoved() {
  if (solved==false) {
    for (int i=0; i<25; i++) {
      if (selectedDot==i) {
      } else
        if (dots[i].selected()==true) {
          dots[i].c=dotColorOver;
        } else {
          dots[i].c=dotColor;
        }
    }
  }
}


void mouseDragged() {
  mouseMoved();
}

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
    ellipse(x, y, s, s);
  }

  boolean selected() {

    float disX = x - mouseX;
    float disY = y - mouseY;

    if (sqrt(sq(disX) + sq(disY)) < s/2 ) {
      return true;
    } else {
      return false;
    }
  }
}

class Line {
  int startX, startY;
  int endX, endY;
  boolean visible;


  Line(int startDot, int endDot) {

    startX=dots[startDot].x;
    startY=dots[startDot].y;
    endX=dots[endDot].x;
    endY=dots[endDot].y;
    visible=false;
  }

  void display() {
    int out=0;
    if (out==0) {
      stroke(0, 189, 255);
      strokeWeight(1.5);
      line(startX, startY, endX, endY);
      out=1;
    }
    if (out==1) {
      stroke(255, 189, 0);
    }
  }
}

void drawLine(int startDot, int endDot) {

  int a = 99;
  int b = 99;

  if (startDot < endDot) {
    a = startDot;
    b = endDot;
  } else if (startDot > endDot) {
    a = endDot;
    b = startDot;
  } else {
    drawing=false;
  }

  if (drawing==true) {
    int h=0;
    for (int i=0; i<25; i++) {
      for (int j=0; j<25; j++) {
        if ((a==i)&&(b==j)) { 
          lines[h].visible=true;
        }
        h++;
      }
    }
    rect(460, 460, 0, 230);
  }
}
