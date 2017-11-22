PShader filtro;  
PImage img;
    
float[] kernel;

int filt=0;
    
void setup() {
  size(1000, 650, P2D);
  kernel = new float[] {0.0,0.0,0.0,
                        0.0,1.0,0.0,
                        0.0,0.0,0.0
                      };
  img = loadImage("foto1.jpg");      
  filtro = loadShader("shaderFilter.glsl");
}

void draw() {

  shader(filtro);
  filtro.set("kernel", kernel);
  image(img, 0, 0);

  switch(filt){
    case(1):
      fill(255, 0, 0);
      text("Laplacian Filter", 20, 20);
      kernel = new float[] {0.0, 1.0, 0.0,
                            1.0, -4.0, 1.0,
                            0.0, 1.0, 0.0
                            };
      break;
    case(2):
      fill(255, 0, 0);
      text("Emboss Filter", 20, 20);
      kernel = new float[] {-1, -1,  0,
                            -1,  0,  1,
                             0,  1,  1
                            };
      break;
    case(3):
      fill(255, 0, 0);
      text("Sharpness Filter", 20, 20);
      kernel = new float[] {-1.0, -1.0, -1.0,
                            -1.0, 9.0, -1.0,
                            -1.0, -1.0, -1.0
                            };
      break;   
      
    case(4):
      fill(255, 0, 0);
      text("Blur Filter", 20, 20);
      kernel = new float[] { 0.0, 0.2,  0.0,
                             0.2, 0.2,  0.2,
                             0.0, 0.2,  0.0
                             };
      break;
    case(5):
      fill(255, 0, 0);
      text("Edge Detection", 20, 20);
      kernel = new float[] { -1, -1, -1,
                              -1,  8, -1,
                              -1, -1, -1
                             };
      break;
    case(6):
      fill(255, 0, 0);
      text("Edge Excesively Detection", 20, 20);
      kernel = new float[] { 1,  1,  1,
                             1, -7,  1,
                             1,  1,  1
                             };
      break;  
    case(7):
      fill(255, 0, 0);
      text("Edge Excesively Detection", 20, 20);
      kernel = new float[] {  1, 1, 1,
                              1, 1, 1,
                              1, 1, 1
                             };
      break;  
      
  }
}

void keyPressed(){
  if(key==' ')
  filt++;
  if(filt>=7) filt=0;
  System.out.println(filt);
}