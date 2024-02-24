PImage s;
int xo=-2000,yo=-2000,xf,yf;
int aux=0;
int tam=100;
boolean drawing;
boolean solved;
color dotColor= color(192);
color dotColorOver = color(255);
color dotColorClicked = color(255,0,0);
 Dot[] dots = new Dot[1000];

void setup(){
size(900,900);
s= loadImage("MENUFINAL.png");
image(s,0,0);

drawing=false;
  solved=false;
 
  int h=0;
  for(int i =0 ;i<15;i++)
  {  
    for(int j =0;j<15;j++)
    {
        dots[h] = new Dot(j*30+200,i*30+220);
        h++;
    
    }
  }
  for(int i=0; i<225; i++) {
    dots[i].c = dotColor;
    dots[i].display(dots[i].c);
  }
}

void draw(){

background(255,255,255);
  updatePixels();

   
  for(int i=0; i<225; i++) {
    dots[i].display(dots[i].c);
  }
image(s,0,0);


}
