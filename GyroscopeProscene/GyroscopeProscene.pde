import remixlab.proscene.*;
import remixlab.bias.*;
import remixlab.bias.event.*;

import ketai.sensors.*;
import ketai.ui.*;   

KetaiSensor sensor;
KetaiGesture gesture;

float rotationX, rotationY, rotationZ;
float roll=0, pitch=0, yaw=0;

Scene scene;
static int GYRO_ID;
InteractiveFrame iFrame1, iFrame2;
HIDAgent hidAgent;

PShape sh;

public class HIDAgent extends Agent {
  // array of sensitivities that will multiply the sliders input
  // found pretty much as trial an error
  float [] sens = {3, 3, 3};
  
  public HIDAgent(Scene scn) {
    super(scn.inputHandler());
    // GYRO_ID will be assigned an unique id with 6 DOF's. The id may be
    // used to bind (frame) actions to the gesture, pretty much in
    // the same way as it's done with the LEFT and RIGHT mouse gestures.
    GYRO_ID = MotionShortcut.registerID(3, "GYRO_SENSOR");
    addGrabber(scene.eyeFrame());
    setDefaultGrabber(scene.eyeFrame());
  }
  
  // we need to override the agent sensitivities method for the agent
  // to apply them to the input data gathered from the sliders
  @Override
  public float[] sensitivities(MotionEvent event) {
    if (event instanceof DOF3Event)
      return sens;
    else
      return super.sensitivities(event);
  }
  
  // polling is done by overriding the feed agent method
  // note that we pass the id of the gesture
  @Override
  public DOF3Event feed() {
    return new DOF3Event(-pitch, roll, yaw, BogusEvent.NO_MODIFIER_MASK,GYRO_ID);
  }
}

void setup() {
  size(displayWidth, displayHeight, P3D);
  orientation(PORTRAIT);
   
  scene = new Scene(this);
  //scene.setGridVisualHint(false);
  //scene.setAxesVisualHint(false);  

  
  gesture = new KetaiGesture(this);
  sensor = new KetaiSensor(this);
  sensor.start();

  hidAgent = new HIDAgent(scene);
  
  // the iFrame is added to all scene agents (that's why we previously instantiated the hidAgent)
  // Thanks to the Processing Foundation for providing the rocket shape
  iFrame1 = new InteractiveFrame(scene);
  
  // we bound some frame 6 actions to the gesture on both frames
  scene.eyeFrame().setMotionBinding(GYRO_ID, "translateRotateXYZ");
  iFrame1.setMotionBinding(GYRO_ID, "translateRotateXYZ");
  // and the custom behavior to the right mouse button
  //iFrame.setMotionBinding(RIGHT, "customBehavior");

  sh = loadShape("rocket.obj"); 
  sh.scale(0.4);
  sh.translate(0, -50);

  smooth();
}

//void customBehavior(InteractiveFrame frame, MotionEvent event) {
//  frame.screenRotate(event);
//}

void draw() {    
  
  pitch += rotationX;
  roll += rotationY;
  yaw += rotationZ;
  
  background(0);    
  //box(40, 40, 40);
  shape(sh);
  scene.drawFrames();
  
}

void onGyroscopeEvent(float x, float y, float z){
  rotationX = radians(x);  
  rotationY = radians(y);
  rotationZ = radians(z); 
}

void mousePressed(){
  pitch = roll = yaw = 0;
}