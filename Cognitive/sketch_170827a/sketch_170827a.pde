int illusions = 7;
int current = 1;
//toggle illusion activation
boolean active = true;

void setup() {
  size(800, 800);
}

void draw() {
  background(255);
  pushStyle();
  switch(current) {
  case 1:
    scintillating();
    break;
    // implement from here. Don't forget to add break for each case
  case 2:
    colorGradient();
    break;
  case 3:
    cafeWall();
    break;
  case 4:
    Tcircles();
    break;
  case 5:
    blueGreen();
    break;
  case 6:
    squaresSteps();
    break;  
  case 7:
    Ktriangle();
  }
  popStyle();
}

// switch illusion using the spacebar
void keyPressed() {
  if (key == ' ')
    current = current < illusions ? current+1 : 1;
  if (key == 'a')
    active = !active;
}

// Complete info for each illusion
 
/*
 Scintillating Grid
 Author: E. Lingelbach, 1994
 Code adapted from Rupert Russell implementation
 Tags: Physiological illusion, Hermann grid illusion
*/
void scintillating() {
  background(0);          // black background

  //style
  strokeWeight(3);        // medium weight lines 
  smooth();               // antialias lines
  stroke(100, 100, 100);  // dark grey colour for lines

  int step = 25;          // grid spacing

  //vertical lines
  for (int x = step; x < width; x = x + step) {
    line(x, 0, x, height);
  }

  //horizontal lines
  for (int y = step; y < height; y = y + step) {
    line(0, y, width, y);
  }

  // Circles
  if (active) {
    ellipseMode(CENTER);
    stroke(255, 255, 255);  // white circles
    for (int i = step; i < width -5; i = i + step) {
      for (int j = step; j < height -15; j = j + step) {
        strokeWeight(6); 
        point(i, j);
        strokeWeight(3);
      }
    }
  }
}

//All the codes are made from scratch by juclopezso

//Cafe wall illusion
/* The café wall illusion was first reported 
by Richard Gregory, a professor of neuropsychology 
at the University of Bristol, together with Priscilla Heard.*/

void cafeWall(){
  
  strokeWeight(5);    
  stroke(120);
  for(int i=0; i<8; i++){
    for(int j=0; j<8; j++){
      if(i%2==0){ 
        fill(0);
        rect(i*100, j*100, 100, 100);
        }
      else{
        fill(255);
        rect(i*100, j*100, 100, 100);
        }
        j++;
    }
  }
  for(int i=0; i<8; i++){
    for(int j=1; j<8; j++){
      if(i%2==0){ 
        fill(0);
        rect(i*100+20, j*100, 100, 100);
        }
      else{
        fill(255);
        rect(i*100+20, j*100, 100, 100);
        }
        j++;
    }
  }
}

//Color Gradient
void colorGradient(){
  int gradient = 800/255;
  int f = 0;
  noStroke(); 
  for(int i=0; i<255; i++){
    fill(i);
    rect(f, 0, f+gradient+1, 800);
    f+=gradient+1;
  }
  fill(120);
  rect(200, 320, 400, 70);
  if(!active){
    fill(255);
    rect(0, 0, 800, 800);
    
    fill(120);
    rect(200, 320, 400, 70);
  }
}

//Titchener Circles
/* Also known as the Ebbinghaus Illusion, there is still a debate in psychological
circles as to the exact mechanism and implication of this effect. Essentially,
the orange circle on the left appears to be smaller than the one on the right 
although in reality they are the same size. */

void Tcircles(){
  background(220);
  noStroke();
  if(active){
  fill(150, 135, 20);
    //Left circles
    ellipse(250, 340, 80, 80);
    fill(50, 60, 100);
    ellipse(250, 480, 135, 135);
    ellipse(250, 200, 135, 135);
    ellipse(390, 340, 135, 135);
    ellipse(110, 340, 135, 135);
  
    //Rigth circles
    fill(150, 135, 20);
    ellipse(580, 340, 80, 80);
    fill(50, 60, 100);
    ellipse(630, 300, 30, 30);
    ellipse(530, 300, 30, 30);
  
    ellipse(630, 380, 30, 30);
    ellipse(530, 380, 30, 30);
  
    ellipse(650, 340, 30, 30);
    ellipse(510, 340, 30, 30);
  
    ellipse(580, 405, 30, 30);
    ellipse(580, 275, 30, 30);
  }else{
    fill(150, 135, 20);
    ellipse(250, 340, 80, 80);
    ellipse(580, 340, 80, 80);
  }

}

// Blue vs Green
/*The “blue” and “green” backgrounds are in
fact the same color */

void blueGreen(){
  noStroke();
  background(220);
  if(active){
    //Orange stripes
      for(int i=0; i<400; i+=20){
      fill(240, 129, 4);
      rect(0, 160+i, 400, 10);
    } 
    for(int i=0; i<200; i+=20){
      rect(400, 350+i, 400, 10);
    }
    //Purple stripes
    for(int i=0; i<200; i+=20){
      fill(255, 1, 251);
      rect(0, 150+i, 400, 10);
    }  
    for(int i=0; i<400; i+=20){
      rect(400, 160+i, 400, 10);
    } 
    //Blue (green) stripes
    for(int i=0; i<200; i+=20){
      fill(114, 247, 255);
      rect(0, 350+i, 400, 10);
      rect(400, 150+i, 400, 10);
    }
  }else{
    //Blue (green) stripes
    for(int i=0; i<200; i+=20){
      fill(114, 247, 255);
      rect(0, 350+i, 400, 10);
      rect(400, 150+i, 400, 10);
    }
  }
  
  
}

  
//Squares Steps
int i=0;
void squaresSteps(){
  noStroke();
    if(active){
    for(int i=0; i<800; i+=40){
      fill(0);
      rect(0, i, 800, 20);
    }
  }else{
    for(int i=0; i<800; i+=100){
      fill(255);
      rect(0, i, 800, 50);
    }
  }
  
  if(i==760) i=0;

    fill(0);
    rect(250, i, 80, 80);
    fill(250, 220, 0);
    rect(450, i, 80, 80);
    //Movement
    i+=1;  
}

//Kanizsa Triangle
/* The Kanizsa Triangle was named after the psychologist
Gaetano Kanizsa who first described its effect. 
When you look at the image your brain creates contours 
(outlines) of a triangle although none exist.  */ 

void Ktriangle(){
  background(0);
  //Circles
  ellipse(200, 200, 80, 80);
  ellipse(600, 200, 80, 80);
  ellipse(400, 600, 80, 80);
  
  //Triangle
  fill(0);
  stroke(255);
  strokeWeight(4);
  triangle(200, 500, 600, 500, 400, 100);
  
  //Upside down triangle
  noStroke();
  triangle(200, 200, 600, 200, 400, 600);
  
}
