class Figure {

  int mode=0;
  int heigth=500, widthh=600;
  PShape square;
  int[] coords = {mouseX, mouseY};
  int tamX = 100;
  int tamY = 100;
  int icoordX = 240;
  int icoordY = 180;
  
  int dx=0, dy=0, tdx=0, tdy=0;
  
  float sx=1, sy=1;
  float h1=0, h2=0;
  float r1=0, r2=0;
  
  Figure(){
    build();
      //use processing style instead of pshape's, see https://processing.org/reference/PShape.html
      square.disableStyle();
    }
    
  void build(){
    square = createShape(RECT, 0, 0, tamX, tamY);
  }
  
  void scaling(){
    //square = createShape(RECT, 0, 0, initX*sx, initY*sx);
    square.scale(sy);
    //shape(square, icoordX+dx, icoordY+dy);
  }
  
  void translation(){
    square.translate(dx, dy);
    //shape(square, icoordX+dx, icoordY+dy);
  }
  
  void shearing(){
    shearX(h1);
    shearY(h2);
    //shape(square, icoordX+dx, icoordY+dy);
  }
  
  void rotation(){
    pushMatrix();
    translate(icoordX, icoordY);
    rotate(r1);
    //rotateX(r1);
    //rotateY(r2);
    //shape(square, icoordX+dx, icoordY+dy);
    popMatrix();
  }

  void draw() {
    pushMatrix();
    translate(icoordX+tdx, icoordY+tdy);
    shearX(h1); shearY(h2);
    rotate(r1);
    
    shape(square, dx, dy);
    //rotateX(r1); rotateY(r2);
    fill(90, 120, 220);
    mouseCoords();
    //text("Mouse x: " + coords[0] + " Mouse y: " + coords[1] , 100, 20);
    //text("X: " + icoordX + " Y : " + icoordY , 100, 30);
    
    switch(mode) { 
    case 0://INICIAL
      shape(square, 0, 0);
    break;
    
    case 1://ESQUILADO
      shearing();
    break;
    
    case 2://TRANSLATE
      translation();
      dx=0; dy=0;
    break;
    
    case 3://ROTATE
      rotation();
    break;
    
    case 4://SCALE
     scaling();
     sx=1; sy=1;
    break;
    
    case 5:
     
    break;
     
    }
    popMatrix();
  }
  
  void mouseCoords(){
    if(mousePressed){
      coords[0] = mouseX;
      coords[1] = mouseY;
    }
  }

}