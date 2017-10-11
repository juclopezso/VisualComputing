class RenderDynamicMesh {
  // radius refers to the mesh 'bounding sphere' redius.
  // see: https://en.wikipedia.org/wiki/Bounding_sphere
  float radius = 175;
  PShape shape;
  // mesh representation
  ArrayList<PVector> vertices;

  // rendering mode
  boolean retained;

  // visual modes
  // 0. Faces and edges
  // 1. Wireframe (only edges)
  // 2. Only faces
  // 3. Only points
  int mode;

  // visual hints
  boolean boundingSphere;

  RenderDynamicMesh() {
    build();
    //use processing style instead of pshape's, see https://processing.org/reference/PShape.html
    shape.disableStyle();
  }

  // compute both mesh vertices and pshape
  // TODO: implement me
  
  class Face{
    ArrayList<PVector> faces = new ArrayList<PVector>();

    Face(int i, PVector a){
      faces.add(i, a);
    }
  }
  
  ArrayList<Face> listFaces = new ArrayList<Face>();
  //RENDER DYNAMIC MESH
  void build() {
  vertices = new ArrayList<PVector>();

    //F1    
    vertices.add(new PVector(-100,100,-100));
    vertices.add(new PVector(100,-100,-100));
    vertices.add(new PVector(-100,-100,-100));
    vertices.add(new PVector(-100,100,-100));
    vertices.add(new PVector(100,100,-100));
    vertices.add(new PVector(100,-100,-100));
    //F2
    vertices.add(new PVector(100,100,-100));
    vertices.add(new PVector(100,-100,100));
    vertices.add(new PVector(100,-100,-100));
    vertices.add(new PVector(100,100,-100));
    vertices.add(new PVector(100,100,100));
    vertices.add(new PVector(100,-100,100));
    //F3
    vertices.add(new PVector(100,100,100));
    vertices.add(new PVector(-100,100,100));
    vertices.add(new PVector(-100,-100,100));
    vertices.add(new PVector(100,100,100));
    vertices.add(new PVector(-100,-100,100));
    vertices.add(new PVector(100,-100,100));
    //F4
    vertices.add(new PVector(-100,100,100));
    vertices.add(new PVector(-100,100,-100));
    vertices.add(new PVector(-100,-100,-100));
    vertices.add(new PVector(-100,100,100));
    vertices.add(new PVector(-100,-100,-100));
    vertices.add(new PVector(-100,-100,100));
    //F5
    vertices.add(new PVector(-100,100,-100));
    vertices.add(new PVector(-100,100,100));
    vertices.add(new PVector(100,100,-100));
    vertices.add(new PVector(-100,100,100));
    vertices.add(new PVector(100,100,100));
    vertices.add(new PVector(100,100,-100));
    //F6
    vertices.add(new PVector(-100,-100,100));
    vertices.add(new PVector(100,-100,100));
    vertices.add(new PVector(100,-100,-100));
    vertices.add(new PVector(-100,-100,100));
    vertices.add(new PVector(100,-100,-100));
    vertices.add(new PVector(-100,-100,-100));  
    
    int index=0;
    for(int j=0; j<vertices.size(); j++){
      listFaces.add(new Face(index, vertices.get(j)));
      if(index>0 && j%6==0) index++;
    }
    
    shape = createShape();
    shape.beginShape(TRIANGLE);
    
    for(Face f : listFaces){
      for(PVector v : f.faces){
        shape.vertex(v.x, v.y, v.z);
      }
    }
    
    shape.endShape();
    
    //don't forget to compute radius too
  }

  // transfer geometry every frame
  // TODO: current implementation targets a quad.
  // Adapt me, as necessary
  void drawImmediate() {
    beginShape(TRIANGLE);
    for(Face f : listFaces){
      for(PVector v : f.faces){
        vertex(v.x, v.y, v.z);
      }
    }
    endShape();
  }

  void draw() {
    pushStyle();

    // mesh visual attributes
    // manipuate me as you wish
    int strokeWeight = 3;
    color lineColor = color(255, retained ? 0 : 255, 0);
    color faceColor = color(0, retained ? 0 : 250, 190, 180);

    strokeWeight(strokeWeight);
    stroke(lineColor);
    fill(faceColor);
    // visual modes
    switch(mode) {
    case 1:
      noFill();
      break;
    case 2:
      noStroke();
      break;
    case 3:
      // TODO: implement me
      break;
    }

    // rendering modes
    if (retained)
      shape(shape);
    else
      drawImmediate();
    popStyle();

    // visual hint
    if (boundingSphere) {
      pushStyle();
      noStroke();
      fill(0, 255, 255, 125);
      sphere(radius);
      popStyle();
    }
  }
}