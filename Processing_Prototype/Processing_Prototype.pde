import controlP5.*;

ControlP5 cp5;
// NEED TO TAKE VALS AND PUT THEM ON THE ELLIPSE AS A COLOR
String textValue = "";
boolean circleOver = false;
int circleX, circleY;  // Position of circle button
int circleSize = 100;   // Diameter of circle

Light light1; // Add Lights

void setup() {
    size(700, 800);

    cp5 = new ControlP5(this);
    
  circleX = 20;
  circleY = 20;
  
  light1 = new Light(200, 100, 50, "kitchen", 25, 25); // Light Constructor

    setupChanger();
}

public void setupChanger() {
    PFont font = createFont("arial", 20);


    cp5.addTextfield("Red")
        .setPosition(20, 100)
        .setSize(200, 40)
        .setFont(font)
        .setFocus(true)
        .setColor(color(255, 0, 0))
        .setAutoClear(false);

    cp5.addTextfield("Green")
        .setPosition(20, 240)
        .setSize(200, 40)
        .setFont(font)
        .setFocus(true)
        .setColor(color(255, 0, 0))
        .setAutoClear(false);

    cp5.addTextfield("Blue")
        .setPosition(20, 170)
        .setSize(200, 40)
        .setFont(font)
        .setFocus(true)
        .setColor(color(0, 0, 255))
        .setAutoClear(false);

    cp5.addBang("clear")
        .setPosition(240, 170)
        .setSize(80, 40)
        .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);

    textFont(font);
}

void draw() {

    background(0);
    fill(255);
    text(cp5.get(Textfield.class, "Red").getText(), 360, 130);
    text(textValue, 360, 180);

    ellipse(500, 184, 220, 220);

    drawRoom();
    

}

void drawRoom() {
    // Room Walls
    int margin = 30;
    int roomX = margin + 6;
    int roomY = 406;
    
    // Translate (0,0) to the middle of the program
    pushMatrix();
    translate(roomX, roomY);
    
    mouseX -= roomX;
    mouseY -= roomY;
    
    update(mouseX, mouseY);
    
    mouseX += roomX;
    mouseY += roomY;
    
    stroke(0);
    strokeWeight(6);
    fill(255);
    rect(0, 0, 610, 220);

    // Furniture
    noFill();
    strokeWeight(3);
    stroke(0);

    rect(15, 15, 60, 175);

    rect(180, (220 / 2) - 20, 175, 40);

    rect(width - (margin * 3) - 60, 30, 30, 140);
    
    // Draw lights
    
    fill(221, 107, 77);
    noStroke();
    ellipse(circleX, circleY, circleSize, circleSize);


    popMatrix();

}


void mouseClicked() {
  if (circleOver) {
    color c = get(mouseX, mouseY);
    fill(10);
    cp5.get(Textfield.class, "Red").setText(String.valueOf(red(c)));
    cp5.get(Textfield.class, "Green").setText(String.valueOf(green(c)));
    cp5.get(Textfield.class, "Blue").setText(String.valueOf(blue(c)));
  }
  else {
    cp5.get(Textfield.class, "Red").setText("");
    cp5.get(Textfield.class, "Green").setText("");
    cp5.get(Textfield.class, "Blue").setText("");
  }
}

public void clear() {

    // can clear vals 
}

void update(int x, int y) {
  if( overCircle(circleX, circleY, circleSize) ) {
    circleOver = true;
  } else {
    circleOver = false;
  }
}

void controlEvent(ControlEvent theEvent) {
    if (theEvent.isAssignableFrom(Textfield.class)) {
        println("controlEvent: accessing a string from controller '" +
            theEvent.getName() + "': " +
            theEvent.getStringValue()
        );
    }
}


public void input(String theText) {
    // automatically receives results from controller input
    println("a textfield event for controller 'input' : " + theText);
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if(sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}


/*
a list of all methods available for the Textfield Controller
use ControlP5.printPublicMethodsFor(Textfield.class);
to print the following list into the console.

You can find further details about class Textfield in the javadoc.

Format:
ClassName : returnType methodName(parameter type)

controlP5.Textfield : String getText() 
controlP5.Textfield : Textfield clear() 
controlP5.Textfield : Textfield keepFocus(boolean) 
controlP5.Textfield : Textfield setAutoClear(boolean) 
controlP5.Textfield : Textfield setFocus(boolean) 
controlP5.Textfield : Textfield setFont(ControlFont) 
controlP5.Textfield : Textfield setFont(PFont) 
controlP5.Textfield : Textfield setFont(int) 
controlP5.Textfield : Textfield setText(String) 
controlP5.Textfield : Textfield setValue(String) 
controlP5.Textfield : Textfield setValue(float) 
controlP5.Textfield : boolean isAutoClear() 
controlP5.Textfield : int getIndex() 
controlP5.Textfield : void draw(PApplet) 
controlP5.Textfield : void keyEvent(KeyEvent) 
controlP5.Textfield : void setInputFilter(int) 
controlP5.Textfield : void setPasswordMode(boolean) 
controlP5.Controller : CColor getColor() 
controlP5.Controller : ControlBehavior getBehavior() 
controlP5.Controller : ControlWindow getControlWindow() 
controlP5.Controller : ControlWindow getWindow() 
controlP5.Controller : ControllerProperty getProperty(String) 
controlP5.Controller : ControllerProperty getProperty(String, String) 
controlP5.Controller : Label getCaptionLabel() 
controlP5.Controller : Label getValueLabel() 
controlP5.Controller : List getControllerPlugList() 
controlP5.Controller : PImage setImage(PImage) 
controlP5.Controller : PImage setImage(PImage, int) 
controlP5.Controller : PVector getAbsolutePosition() 
controlP5.Controller : PVector getPosition() 
controlP5.Controller : String getAddress() 
controlP5.Controller : String getInfo() 
controlP5.Controller : String getName() 
controlP5.Controller : String getStringValue() 
controlP5.Controller : String toString() 
controlP5.Controller : Tab getTab() 
controlP5.Controller : Textfield addCallback(CallbackListener) 
controlP5.Controller : Textfield addListener(ControlListener) 
controlP5.Controller : Textfield bringToFront() 
controlP5.Controller : Textfield bringToFront(ControllerInterface) 
controlP5.Controller : Textfield hide() 
controlP5.Controller : Textfield linebreak() 
controlP5.Controller : Textfield listen(boolean) 
controlP5.Controller : Textfield lock() 
controlP5.Controller : Textfield plugTo(Object) 
controlP5.Controller : Textfield plugTo(Object, String) 
controlP5.Controller : Textfield plugTo(Object[]) 
controlP5.Controller : Textfield plugTo(Object[], String) 
controlP5.Controller : Textfield registerProperty(String) 
controlP5.Controller : Textfield registerProperty(String, String) 
controlP5.Controller : Textfield registerTooltip(String) 
controlP5.Controller : Textfield removeBehavior() 
controlP5.Controller : Textfield removeCallback() 
controlP5.Controller : Textfield removeCallback(CallbackListener) 
controlP5.Controller : Textfield removeListener(ControlListener) 
controlP5.Controller : Textfield removeProperty(String) 
controlP5.Controller : Textfield removeProperty(String, String) 
controlP5.Controller : Textfield setArrayValue(float[]) 
controlP5.Controller : Textfield setArrayValue(int, float) 
controlP5.Controller : Textfield setBehavior(ControlBehavior) 
controlP5.Controller : Textfield setBroadcast(boolean) 
controlP5.Controller : Textfield setCaptionLabel(String) 
controlP5.Controller : Textfield setColor(CColor) 
controlP5.Controller : Textfield setColorActive(int) 
controlP5.Controller : Textfield setColorBackground(int) 
controlP5.Controller : Textfield setColorCaptionLabel(int) 
controlP5.Controller : Textfield setColorForeground(int) 
controlP5.Controller : Textfield setColorValueLabel(int) 
controlP5.Controller : Textfield setDecimalPrecision(int) 
controlP5.Controller : Textfield setDefaultValue(float) 
controlP5.Controller : Textfield setHeight(int) 
controlP5.Controller : Textfield setId(int) 
controlP5.Controller : Textfield setImages(PImage, PImage, PImage) 
controlP5.Controller : Textfield setImages(PImage, PImage, PImage, PImage) 
controlP5.Controller : Textfield setLabelVisible(boolean) 
controlP5.Controller : Textfield setLock(boolean) 
controlP5.Controller : Textfield setMax(float) 
controlP5.Controller : Textfield setMin(float) 
controlP5.Controller : Textfield setMouseOver(boolean) 
controlP5.Controller : Textfield setMoveable(boolean) 
controlP5.Controller : Textfield setPosition(PVector) 
controlP5.Controller : Textfield setPosition(float, float) 
controlP5.Controller : Textfield setSize(PImage) 
controlP5.Controller : Textfield setSize(int, int) 
controlP5.Controller : Textfield setStringValue(String) 
controlP5.Controller : Textfield setUpdate(boolean) 
controlP5.Controller : Textfield setValueLabel(String) 
controlP5.Controller : Textfield setView(ControllerView) 
controlP5.Controller : Textfield setVisible(boolean) 
controlP5.Controller : Textfield setWidth(int) 
controlP5.Controller : Textfield show() 
controlP5.Controller : Textfield unlock() 
controlP5.Controller : Textfield unplugFrom(Object) 
controlP5.Controller : Textfield unplugFrom(Object[]) 
controlP5.Controller : Textfield unregisterTooltip() 
controlP5.Controller : Textfield update() 
controlP5.Controller : Textfield updateSize() 
controlP5.Controller : boolean isActive() 
controlP5.Controller : boolean isBroadcast() 
controlP5.Controller : boolean isInside() 
controlP5.Controller : boolean isLabelVisible() 
controlP5.Controller : boolean isListening() 
controlP5.Controller : boolean isLock() 
controlP5.Controller : boolean isMouseOver() 
controlP5.Controller : boolean isMousePressed() 
controlP5.Controller : boolean isMoveable() 
controlP5.Controller : boolean isUpdate() 
controlP5.Controller : boolean isVisible() 
controlP5.Controller : float getArrayValue(int) 
controlP5.Controller : float getDefaultValue() 
controlP5.Controller : float getMax() 
controlP5.Controller : float getMin() 
controlP5.Controller : float getValue() 
controlP5.Controller : float[] getArrayValue() 
controlP5.Controller : int getDecimalPrecision() 
controlP5.Controller : int getHeight() 
controlP5.Controller : int getId() 
controlP5.Controller : int getWidth() 
controlP5.Controller : int listenerSize() 
controlP5.Controller : void remove() 
controlP5.Controller : void setView(ControllerView, int) 
java.lang.Object : String toString() 
java.lang.Object : boolean equals(Object) 


*/
