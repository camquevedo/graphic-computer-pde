int brai, brad, pierna;
int pos_x, pos_y, dx, dy, posix, posiy, posfx, posfy;
float e, s;

void setup(){
size(720,480);
//rectMode(CENTER);
//background(150);
}

// _________________________________________________________________
//                             Partes del cuerpo

void torso()
{
  rect(342,175,45,45);  // Cabeza
  rect (355,220,20,10); // Cuello
  rect(340,230,50,80);  // Torso
}
//________________________________________________
void antebrazo_i()
{
  ellipse(0,0,20,20);    // Codo
  rect(-40,-10,30,20);  // Mano
}
//________________________________________________
void brazo_i()
{
  ellipse(0, 0, 20,20); // Hombro izq
  rect(-40, -10,30,20);      // Biscep izq
}
//________________________________________________
void antebrazo_d()
{
  ellipse(0,0,20,20);    // Codo
  rect(10,-10,30,20);      // Mano
}
//________________________________________________
void brazo_d()
{
  ellipse(0,0,20,20);    // Hombro
  rect(10,-10,30,20);        // Bisep
}
//________________________________________________
void muslo_i()
{
  ellipse(0,0,20,20);
  rect(-10,10,20,30);    //Muslo
  //ellipse(7,58,16,16);  //Rodilla
  /*
  rect(345,280,15,30);    //Muslo
  ellipse(352,318,15,15);  //Rodilla
  */
}
//________________________________________________
void pierna_i()
{
  ellipse(0,0,20,20);  //Rodilla
  rect(-10,10,20,30);    //Canilla
  ellipse(-5,48,30,16);  // Pie
  /*rect(345,325,15,30);    //Canilla
  ellipse(352,363,15,15);  // Pie
  */
}
//________________________________________________
void muslo_d()
{
  ellipse(0,0,20,20);
  rect(-10,10,20,30);  //Muslo
  //ellipse(8,38,15,15);  //Rodilla
  /*
  rect(370,280,15,30);  //Muslo
  ellipse(378,318,15,15);  //Rodilla
  */
}
//________________________________________________
void pierna_d()
{
  ellipse(0,0,20,20);  //Rodilla
  rect(-10,10,20,30);  //Canilla
  ellipse(5,48,30,16);  //Pie
  /*
  rect(370,325,15,30);  //Canilla
  ellipse(378,363,15,15);  //Pie
  */
}
//________________________________________________
//________________________________________________

void draw (){
  
  background(150);
//  scale(e);
  //_______________________________________________________________________________________
  //Torso
  pushMatrix();
    translate(dx,dy);
    scale(s);
    torso();
  popMatrix();
  
  //_______________________________________________________________________________________
  // Brazo Izquierdo
  pushMatrix();
  translate(330+dx,240+dy); // Desplaza de origen hasta Hombro
  scale(s);
          if(brai ==1)
    {
      rotate(mouseX/float(width));
      brazo_i();
      pushMatrix();
        translate(-50,0); // Desplaza de hombro hasta Codo
        antebrazo_i();
      popMatrix();
    }
    
    else if (brai ==2)
    {
      brazo_i();
      pushMatrix();
        translate(-50,0); // Desplaza de hombro hasta Codo
        rotate(mouseX/float(width));
        antebrazo_i();
      popMatrix();
    }
    
    else if (brai ==3)
    {
      rotate(mouseX/float(width));
      brazo_i();
      pushMatrix();
        translate(-50,0); // Desplaza de hombro hasta Codo
        rotate(mouseX/float(width));
        antebrazo_i();
      popMatrix();
    }
    
    else
    {
      brazo_i();
      pushMatrix();
        translate(-50,0); // Desplaza de hombro hasta Codo
        antebrazo_i();
      popMatrix();
    }
  popMatrix();
  
  //_______________________________________________________________________________________
  // Brazo Derecho
  pushMatrix();
    translate(400+dx,240+dy);
    scale(s);
         if(brad==1)
    {
      rotate(-mouseX/float(width));
      brazo_d();
      pushMatrix();
        translate(50,0);
        antebrazo_d();
      popMatrix();
    }
    else if(brad == 2)
    {
      brazo_d();
      pushMatrix();
        translate(50,0);
        rotate(-mouseX/float(width));
        antebrazo_d();
      popMatrix();
    }
    else if(brad == 3)
    {
      rotate(-mouseX/float(width));
      brazo_d();
      pushMatrix();
        translate(50,0);
        rotate(-mouseX/float(width));
        antebrazo_d();
      popMatrix();
    }
    else
    {
      brazo_d();
      pushMatrix();
        translate(50,0);
        antebrazo_d();
      popMatrix();
    }
  popMatrix();
  
  //_______________________________________________________________________________________  
  //Pierna Izquierda
  pushMatrix();
    translate(350+dx,320+dy);
    scale(s);
         if(pierna ==1)
    {
      rotate(mouseY/float(height));
      muslo_i();
      pushMatrix();
        translate(0,50);
        //rotate(mouseY/float(height));
        pierna_i();
      popMatrix();
    }
    else if(pierna ==2)
    {
      //rotate(mouseY/float(height));
      muslo_i();
      pushMatrix();
        translate(0,50);
        rotate(-mouseY/float(height));
        pierna_i();
      popMatrix();
    }
    else if(pierna ==3)
    {
      rotate(mouseY/float(height));
      muslo_i();
      pushMatrix();
        translate(0,50);
        rotate(-2*mouseY/float(height));
        pierna_i();
      popMatrix();
    }
    else
    {
      muslo_i();
      pushMatrix();
        translate(0,50);
        pierna_i();
      popMatrix();
    }
    
  popMatrix();
  //_______________________________________________________________________________________
  //Pierna Derecha
  pushMatrix();
    translate(380+dx,320+dy);
    scale(s);
         if(pierna ==1)
    {
      rotate(-mouseY/float(height));
      muslo_d();
      pushMatrix();
        translate(0,50);
        //rotate(-mouseY/float(height));
        pierna_d();
      popMatrix();
    }
    else if(pierna ==2)
    {
      //rotate(-mouseY/float(height));
      muslo_d();
      pushMatrix();
        translate(0,50);
        rotate(mouseY/float(height));
        pierna_d();
      popMatrix();
    }
    else if(pierna ==3)
    {
      rotate(-mouseY/float(height));
      muslo_d();
      pushMatrix();
        translate(0,50);
        rotate(2*mouseY/float(height));
        pierna_d();
      popMatrix();
    }
    else
    {
      muslo_d();
      pushMatrix();
        translate(0,50);
        pierna_d();
      popMatrix();
    }
  popMatrix();
}

/*void rotate(){
  
}*/

void keyPressed(){
       if(key == 'q')
      brai = 1;
  else if(key == 'a')
      brai = 2;
  else if(key == 'z')
      brai = 3;
  else if(key == 'e')
      brad = 1;
  else if(key == 'd')
      brad = 2;
  else if(key == 'c')
      brad = 3;
  else if(key == 'w')
      pierna = 1;
  else if(key == 's')
      pierna = 2;
  else if(key == 'x')
      pierna = 3;
  else if(key == 'r')
  {
      brai = 0;
      brad = 0;
      pierna = 0;
  }
  
}
void mousePressed() {
  posix = mouseX;
  posiy = mouseY;
  
  /*dx-= mouseX;
  dy-= mouseY;*/
}
void mouseDragged() 
{
  pos_x= mouseX - posix;
  pos_y= mouseY - posix;
  dx = mouseX-posix;
  dy = mouseY-posiy;
}
void mouseReleased() {
  posfx = mouseX;
  posfy = mouseY;
    
  dx = posfx - posix;
  dy = posfy - posiy;
}
void mouseWheel(MouseEvent event) {
  e = event.getCount();
  s += e;
  println(e);
}
