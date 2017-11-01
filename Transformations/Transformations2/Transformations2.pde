char lastKey = ' ';

int[] coords = {mouseX, mouseY};

void setup() {
  size(1200,600,P3D);
}

void draw() {
  background(0);
  lights();
  mouseCoords();
  text("MOUSE: " + coords[0] + " " + coords[1], 10, 10);
  
  if(lastKey=='m'){
    float cameraY = height/2.0;
    float fov = mouseX/float(width) * PI/2;
    float cameraZ = cameraY / tan(fov / 2.0);
    float aspect = float(width)/float(height);
    if (mousePressed) {
      aspect = aspect * 2.0;
    }
    perspective(fov, aspect, cameraZ/10.0, cameraZ*10.0);
  }
  
  pushMatrix();
  fill(251,200,21);
  if(lastKey=='t'){
    translate(coords[0], coords[1]);
  }else{
    translate(200, height/2, 0);
  }
  
  if(lastKey=='r'){
    rotateY(2);
  }
  
  if(lastKey=='b'){
    shearX(1);
  }
  if(lastKey=='n'){
    shearY(1);
  }
  if(lastKey=='s'){
    scale(1.5);
  }
  
  text("Sol", -20, -136);
  
  rotateY(frameCount*0.01);
  noStroke();
  sphere(120);
  
    rotateY(frameCount*0.00003);
    pushMatrix();
    fill(230);
    translate(110+670, 30);
    text("Pluton", -20, -35);
    rotateY(frameCount*0.1);
    sphere(4);
    popMatrix();
    rotateY(frameCount*0);
    
    rotateY(frameCount*0.00005);
    pushMatrix();
    fill(20, 141, 174);
    translate(110+620, 2);
    text("Neptuno", -20, -35);
    rotateY(frameCount*0.1);
    sphere(23);
    popMatrix();
    rotateY(frameCount*0);
    
    rotateY(frameCount*0.00007);
    pushMatrix();
    fill(67, 189, 217);
    translate(110+540, -33);
    text("Urano", -20, -35);
    rotateY(frameCount*0.1);
    sphere(26);
    popMatrix();
    rotateY(frameCount*0);
    
    rotateY(frameCount*0.00010);
    pushMatrix();
    fill(252, 187, 129);
    translate(110+440, 30);
    text("Saturno", -20, -63);
    rotateY(frameCount*0.01);
    rotateX(frameCount*0.02);
    sphere(50);
    //strokeWeight(5);
    //stroke(255);
    fill(200);
    ellipse(0, 0, 145, 145);
    popMatrix();
    rotateY(frameCount*0);
    
    rotateY(frameCount*0.00015);
    pushMatrix();
    fill(206, 98, 42);
    translate(110+300, -10);
    text("Jupiter", -20, -73);
    rotateY(frameCount*0.1);
    rotateX(frameCount*0.05);
    sphere(65);
    popMatrix();
    rotateY(frameCount*0);
    
    rotateY(frameCount*0.0005);
    pushMatrix();
    fill(243, 98, 36);
    translate(110+200, -20);
    text("Marte", -15, -13);
    rotateY(frameCount*0.1);
    rotateX(frameCount*0.05);
    sphere(12);
    popMatrix();
    rotateY(frameCount*0);
    
    rotateY(frameCount*0.001);
    pushMatrix();
    fill(19, 123, 190);
    translate(110+140, -20);
    text("Tierra", -25, -23);
    rotateY(frameCount*0.1);
    rotateX(frameCount*0.06);
    sphere(18);
    
      pushMatrix();
      fill(230);
      translate(28, 0);
      text("Luna", -25, -23);
      sphere(4);
      popMatrix();
    
    popMatrix();
    rotateY(frameCount*0);
    
    rotateY(frameCount*0.0025);
    pushMatrix();
    fill(247, 144, 48);
    translate(110+100, 30);
    text("Venus", -25, -23);
    rotateY(frameCount*0.01);
    sphere(17);
    popMatrix();
    rotateY(frameCount*0);   
    
    rotateY(frameCount*0.004);
    pushMatrix();
    fill(214, 232, 193);
    translate(110+52, 0);
    text("Mercurio", -10, -13);
    rotateY(frameCount*0.02);
    sphere(6);
    popMatrix();
    rotateY(frameCount*0);  
  
  popMatrix();
  rotateY(frameCount*0);
  
  
}

void keyPressed(){
  if (key == 's')
    lastKey = 's';

  if (key == 't')
    lastKey = 't';
    
  if (key == 'r')
    lastKey = 'r';
  
  if (key == 'b')
    lastKey = 'b';
    
  if (key == 'n')
    lastKey = 'n';

  if(key == 'm')
    lastKey = 'm';
}

void mouseCoords(){
    if(mousePressed){
      coords[0] = mouseX;
      coords[1] = mouseY;
    }
  }