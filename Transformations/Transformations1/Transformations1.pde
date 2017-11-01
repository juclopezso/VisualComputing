char lastKey = ' ';
float r=0;
int[] coords = {mouseX, mouseY};


void setup(){
  
  size(400, 400);
  background(255);
  noStroke();
  fill(0);
  rectMode(CENTER);
  
}

void draw(){
  mouseCoords();
  background(255);
  
  pushMatrix();
    
  if(lastKey=='t'){
    translate(coords[0], coords[1]);
  }else{
    translate(height/2, width/2);
  }
  rotate(r);
  
  if(lastKey=='s')
    scale(1.3);
  
  if(lastKey=='r'){         
      pushMatrix();
      translate(-100+coords[0]-height/2, -100+coords[1]-width/2);
      rotate(r);
      rect(0, 0, 20, 20);
      popMatrix();
        
      pushMatrix();         
      translate(-100+coords[0]-height/2, 100+coords[1]-width/2);
      rotate(r);
      rect(0, 0, 20, 20);
      popMatrix();
         
      pushMatrix();         
      translate(100+coords[0]-height/2, -100+coords[1]-width/2);
      rotate(r);
      rect(0, 0, 20, 20);
      popMatrix();
       
      pushMatrix();         
      translate(100+coords[0]-height/2, 100+coords[1]-width/2);
      rotate(r);
      rect(0, 0, 20, 20);
      popMatrix();
  }else if(lastKey=='e'){         
      pushMatrix();
      translate(-100+coords[0]-height/2, -100+coords[1]-width/2);
      shearX(1*(coords[0]-height/2)*0.01);
      shearY(1*(coords[0]-width/2)*0.01);
      rect(0, 0, 20, 20);
      popMatrix();
        
      pushMatrix();         
      translate(-100+coords[0]-height/2, 100+coords[1]-width/2);
      shearX(1*(coords[0]-height/2)*0.01);
      shearY(1*(coords[0]-width/2)*0.01);
      rect(0, 0, 20, 20);
      popMatrix();
         
      pushMatrix();         
      translate(100+coords[0]-height/2, -100+coords[1]-width/2);
      shearX(1*(coords[0]-height/2)*0.01);
      shearY(1*(coords[0]-width/2)*0.01);
      rect(0, 0, 20, 20);
      popMatrix();
       
      pushMatrix();         
      translate(100+coords[0]-height/2, 100+coords[1]-width/2);
      shearX(1*(coords[0]-height/2)*0.01);
      shearY(1*(coords[0]-width/2)*0.01);
      rect(0, 0, 20, 20);
      popMatrix();
  }
  else{
      pushMatrix();
      translate(-100, -100);
      rotate(r);
      rect(0, 0, 20, 20);
      popMatrix();
        
      pushMatrix();         
      translate(-100, 100);
      rotate(r);
      rect(0, 0, 20, 20);
      popMatrix();
         
      pushMatrix();         
      translate(100, -100);
      rotate(r);
      rect(0, 0, 20, 20);
      popMatrix();
       
      pushMatrix();         
      translate(100, 100);
      rotate(r);
      rect(0, 0, 20, 20);
      popMatrix();
  
  }
  
  popMatrix();
  r = r + 0.02;
}

void keyPressed(){
  if (key == 's')
    lastKey = 's';
    //figure.mode = 4;

  if (key == 't')
    lastKey = 't';
    
  if (key == 'r')
    lastKey = 'r';
    //figure.mode = 3;
  
  if (key == 'e')
    lastKey = 'e';
    //figure.mode = 1;
     
}

void mouseCoords(){
    if(mousePressed){
      coords[0] = mouseX;
      coords[1] = mouseY;
    }
  }