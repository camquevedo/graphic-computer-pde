int out=0;
color dotColor= color(192);
color dotColorOver = color(255);
color dotColorClicked = color(255,0,0);


ArrayList<Dot> dots = new ArrayList <Dot>();//crear puntos
ArrayList<Line> lines = new ArrayList <Line>();//crear lineas

PImage s;
PImage sel;
int selectedDot=50625, startDot= 50625, endDot = 50625;
 

boolean drawing;
boolean solved;
 
void setup() { 
  size(900, 900);
  s= loadImage("MENUFINAL.png");
  frameRate(90);
   
  drawing=false;
  solved=false;
  
 
   for(int i =0 ;i<15;i++) // # filas
  {  
    for(int j =0;j<15;j++) // # columnas
    {
  dots.add(new Dot(j*30+200,i*30+(width/4)));
    }
  }
  for(int i=0; i<225; i++) {
    dots.get(i).c = dotColor;
    dots.get(i).display(dots.get(i).c);
  }

  for(int j=0; j<225; j++){ //# de puntos
    for(int k=0; k<225; k++){   //# de puntos
      lines.add(new Line(j,k)); 
    }
  }

}
 
void draw() {
  background(255);
   image(s,0,0);
   

if (key == 'a' || key == 'A'){
sel= loadImage("5FINAL.png");//iluminar la puntada escogida
image(sel,0,0);
}


   
   
   
   
   
  for(int i=0; i<225; i++) { //# de puntos
    dots.get(i).display(dots.get(i).c);
  }
 
  
 for(int i=0; i<50625; i++) { //#de filas elevado a la 4
    
    if(out%2==0){//Intercalar color de la linea para simular puntada
     stroke(0);}
    else{
    stroke(120);}
    if (lines.get(i).visible==true) { lines.get(i).display();
    out++;}
  
 }
 
  if (drawing==true) {  
    line(dots.get(selectedDot).x,dots.get(selectedDot).y,mouseX,mouseY);
      
  }
}
 
void mousePressed() {
  
}
 
void mouseReleased() {
  if(solved==false) {  //Cambia el color cuado se selecciona
 
    drawing=false; 
    for(int i=0; i<225; i++) { //# de puntos
      if((dots.get(i).selected()==true) && (i!=startDot)) {
        drawing=true;
        dots.get(i).c=dotColorClicked;
        selectedDot=i;
        break;
      }
    }
     
    if (drawing==true) {  //Toma los punots y dice si es final o inicial
      if(startDot==50625) {
        startDot=selectedDot;
      } else if (endDot==50625) {
        endDot=selectedDot;
       
        drawLine(startDot,endDot);
        
        
       
      }
      startDot=selectedDot;
      endDot=50625;
    } else {
      startDot=50625;
      endDot=50625;
    }
  }
}
 
void mouseMoved() {
  if(solved==false) {
    for(int i=0; i<225; i++) { //# de puntos
      if(selectedDot==i) {
   
      } else
      if(dots.get(i).selected()==true) {
        dots.get(i).c=dotColorOver;
      } else {
        dots.get(i).c=dotColor;
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
    s = 8;
  
  }
   
  void display(int dotColor) {
    fill(dotColor);
    stroke(0);
    strokeWeight(1);
    ellipse(x,y,s,s);
  }
   
  boolean selected() {
  
    float disX = x - mouseX; //posicion del mouse con la formula de magnitud
    float disY = y - mouseY;
   
    if(sqrt(sq(disX) + sq(disY)) < s ) {
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
     
    startX=dots.get(startDot).x;
    startY=dots.get(startDot).y;
    endX=dots.get(endDot).x;
    endY=dots.get(endDot).y;
    visible=false;
    
  }
 
  void display() {
    stroke(0);
     strokeWeight(1.5);
     line(startX,startY,endX,endY);
  
   
  }
}
 
void drawLine(int startDot,int endDot) {
   
  int a = 50625;
  int b = 50625;
   
  if(startDot < endDot) {
    a = startDot;
    b = endDot;
  } else if(startDot > endDot) {
    a = endDot;
    b = startDot;
  } else {
    drawing=false;
  }
   
  if(drawing==true) {
   int h=0;
    for (int i=0; i<=224; i++){ //# de puntos-1
    for (int j=0; j<=224; j++){
    if((a==j)&&(b==i)) {lines.get(h).visible=true;}
    h++;
    }
    }

}}
