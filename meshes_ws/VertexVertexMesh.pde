class VertexVertexMesh {
  // radius refers to the mesh 'bounding sphere' redius.
  // see: https://en.wikipedia.org/wiki/Bounding_sphere
  float radius = 175;
  PShape shape, shape2;
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

  VertexVertexMesh() {
    build();
    //use processing style instead of pshape's, see https://processing.org/reference/PShape.html
    shape.disableStyle();
  }

  // compute both mesh vertices and pshape
  // TODO: implement me
  
  class Connection{
    ArrayList<Integer> conVertices = new ArrayList();
    Connection(int a, int b){
      conVertices.add(a);
      conVertices.add(b);
    }
    Connection(int a, int b, int c){
      conVertices.add(a);
      conVertices.add(b);
      conVertices.add(c);
    }
    Connection(int a, int b, int c, int d){
      conVertices.add(a);
      conVertices.add(b);
      conVertices.add(c);
      conVertices.add(d);
    }
    Connection(int a, int b, int c, int d, int e){
      conVertices.add(a);
      conVertices.add(b);
      conVertices.add(c);
      conVertices.add(d);
      conVertices.add(e);
    }
  }
  
  ArrayList<Connection> listConnections = new ArrayList();
  ArrayList<Connection> listConnections2 = new ArrayList();
  //VERTEX VERTEX MESH
  void build() {
    vertices = new ArrayList<PVector>();
    //v0
    vertices.add(new PVector(-100,-100,-100));
    //v1
    vertices.add(new PVector(100,-100,-100));
    //v2
    vertices.add(new PVector(100,-100,100));
    //v3
    vertices.add(new PVector(-100,-100,100));
    //v4
    vertices.add(new PVector(-100,100,-100));
    //v5
    vertices.add(new PVector(100,100,-100));
    //v6
    vertices.add(new PVector(100,100,100));
    //v7
    vertices.add(new PVector(-100,100,100));
  
     
    listConnections.add(new Connection(3, 1, 4));
    listConnections.add(new Connection(0, 2, 5, 4, 3));
    listConnections.add(new Connection(1, 6, 5, 3));
    listConnections.add(new Connection(0, 1, 2, 6, 7));
    listConnections.add(new Connection(0, 1, 5, 7));
    listConnections.add(new Connection(1, 2, 6, 4, 7));
    listConnections.add(new Connection(2, 3, 5, 7));
    listConnections.add(new Connection(6, 4, 3, 0, 5));    
    
    //listConnections2.add(new Connection(3, 1, 4));
    //listConnections2.add(new Connection(0, 3, 4, 5, 2));
    //listConnections2.add(new Connection(5, 6, 3));
    //listConnections2.add(new Connection(6, 7, 0));
    //listConnections2.add(new Connection(0, 7, 5));
    //listConnections2.add(new Connection(6, 7));
    //listConnections2.add(new Connection(2, 5));
    //listConnections2.add(new Connection(4, 5)); 
    
    shape = createShape();
    for(Connection c : listConnections){
      for(int j=0; j<vertices.size(); j++){
        for(int i=0; i<c.conVertices.size()-1; i++){
          shape.beginShape(TRIANGLES);
          shape.vertex(vertices.get(j).x, vertices.get(j).y ,vertices.get(j).z);
          shape.vertex(vertices.get(c.conVertices.get(i)).x, vertices.get(c.conVertices.get(i)).y ,vertices.get(c.conVertices.get(i)).z);
          shape.vertex(vertices.get(c.conVertices.get(i+1)).x, vertices.get(c.conVertices.get(i+1)).y ,vertices.get(c.conVertices.get(i+1)).z);
          System.out.println(c.conVertices.get(i) +" " + c.conVertices.get(i) + " " +c.conVertices.get(i+1));
        }
        shape.endShape();
      }
      //System.out.println();
    }
    
    shape2 = createShape();
    for(Connection c : listConnections){
      for(int j=0; j<vertices.size(); j++){
        for(int i=0; i<c.conVertices.size()-1; i++){
          shape2.beginShape(TRIANGLES);
          shape2.vertex(vertices.get(j).x, vertices.get(j).y ,vertices.get(j).z);
          shape2.vertex(vertices.get(c.conVertices.get(i)).x, vertices.get(c.conVertices.get(i)).y ,vertices.get(c.conVertices.get(i)).z);
          shape2.vertex(vertices.get(c.conVertices.get(i+1)).x, vertices.get(c.conVertices.get(i+1)).y ,vertices.get(c.conVertices.get(i+1)).z);
          System.out.println(c.conVertices.get(i) +" " + c.conVertices.get(i) + " " +c.conVertices.get(i+1));
        }
        shape2.endShape();
      }
      //System.out.println();
    }
    

    //don't forget to compute radius too
  }

  // transfer geometry every frame
  // TODO: current implementation targets a quad.
  // Adapt me, as necessary
void drawImmediate() {
    if(mode==3) beginShape(POINTS);
    else beginShape(TRIANGLE);
 
    for(Connection c : listConnections){
      for(int j=0; j<vertices.size(); j++){
        for(int i=0; i<c.conVertices.size()-1; i++){
          vertex(vertices.get(j).x, vertices.get(j).y ,vertices.get(j).z);
          vertex(vertices.get(c.conVertices.get(i)).x, vertices.get(c.conVertices.get(i)).y ,vertices.get(c.conVertices.get(i)).z);
          vertex(vertices.get(c.conVertices.get(i+1)).x, vertices.get(c.conVertices.get(i+1)).y ,vertices.get(c.conVertices.get(i+1)).z);
          System.out.println(c.conVertices.get(i) +" " + c.conVertices.get(i) + " " +c.conVertices.get(i+1));
        }        
      }
      //System.out.println();
    }
    
    endShape();
  }

  void draw() {
    pushStyle();

    // mesh visual attributes
    // manipuate me as you wish
    int strokeWeight = 3;
    color lineColor = color(255, retained ? 0 : 255, 0);
    color faceColor = color(0, retained ? 0 : 205, 50, 150);

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
    }

    // rendering modes
    if (retained)
      if(mode==3) shape(shape2);
      else shape(shape);
    else
      drawImmediate();
    popStyle();

    // visual hint
    if (boundingSphere) {
      pushStyle();
      noStroke();
      fill(0, 155, 205, 125);
      sphere(radius);
      popStyle();
    }
  }
}