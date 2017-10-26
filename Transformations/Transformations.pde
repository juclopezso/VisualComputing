Figure figure;
char lastKey = ' ';

float x,y,z;

void setup() {
  size(900,600,P3D);
  x = width/2;
  y = height/2;
  z = 0;
}
float rx=0.01;
float ry=0.02;

void draw() {
  background(0);
  lights();
  
  pushMatrix();
  translate(width/2, height/2, 0);
  //rotateX(frameCount*rx);
  rotateY(frameCount*rx);
  fill(250, 200, 100);
  sphere(80);
  
    pushMatrix();
    translate(200, 0);
    rotateY(frameCount*ry);
    fill(150, 200, 100);
    sphere(35);
    popMatrix();
    
    rotateY(frameCount*ry*2);
    pushMatrix();
    translate(260, 0);
    rotateY(frameCount*ry);
    fill(250, 200, 10);
    sphere(25);
    popMatrix();
  
  
  popMatrix();
  
  
}

/*void setup(){
  size(600, 500);//, P3D);
  figure = new Figure();  
}
void draw() {
  background(210);   
  figure.draw();
}*/

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
    
  if(lastKey == 't'){
    figure.mode = 2;
    if (keyCode == UP){
        figure.dy = figure.dy - 3;
        figure.tdy = figure.tdy - 3;}
    if (keyCode == DOWN){
        figure.dy = figure.dy + 3;
        figure.tdy = figure.tdy + 3;}
    if (keyCode == LEFT){
        figure.dx = figure.dx - 3;
        figure.tdx = figure.tdx - 3;}
    if (keyCode == RIGHT){
        figure.dx = figure.dx + 3;
        figure.tdx = figure.tdx + 3;}
  }
  
  if(lastKey == 's'){
    figure.mode = 4;
    if (keyCode == UP)
        figure.sy = figure.sy - 0.06;
    if (keyCode == DOWN)
        figure.sy = figure.sy + 0.06;
    if (keyCode == LEFT)
        figure.sy = figure.sy - 0.06;
    if (keyCode == RIGHT)
        figure.sy = figure.sy + 0.06;
  }
  
  if(lastKey == 'e'){
    figure.mode = 1;
    if (keyCode == UP)
        figure.h2 = figure.h2 - 0.01;
    if (keyCode == DOWN)
        figure.h2 = figure.h2 + 0.01;
    if (keyCode == LEFT)
        figure.h1 = figure.h1 - 0.01;
    if (keyCode == RIGHT)
        figure.h1 = figure.h1 + 0.01;
  }
  
  if(lastKey == 'r'){
    figure.mode = 3;
    if (keyCode == UP)
        figure.r2 = figure.r2 - 0.03;
    if (keyCode == DOWN)
        figure.r2 = figure.r2 + 0.03;
    if (keyCode == LEFT)
        figure.r1 = figure.r1 - 0.03;
    if (keyCode == RIGHT)
        figure.r1 = figure.r1  + 0.03;
  }
  
}