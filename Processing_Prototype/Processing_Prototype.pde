import controlP5.*;
import java.util.*;

ControlP5 cp5;
// NEED TO TAKE VALS AND PUT THEM ON THE ELLIPSE AS A COLOR
String textValue = "";
boolean circleOver = false;
boolean editLight = false;
boolean selectedLight = false;
int roomSelected;
int lightSize = 0;

int circleX, circleY; // Position of circle button
color previewColour = 255; // Color for preview
color initialColour = 255; // Color for originally selected

Textfield redInput;
Textfield greenInput;
Textfield blueInput;

Light light1, light2, light3, light4, light5, light6, light7, light8, light9, light10, light11, light12; // Add Lights
List < Light > lightList = new ArrayList < Light > ();

Room room1, room2, room3;
List < Room > roomList = new ArrayList < Room > ();

Light currLight;

void setup() {
    size(700, 800);

    cp5 = new ControlP5(this);

    roomSelected = 1; // Initial room selected
    circleX = 20;
    circleY = 20;

    // Creating room 1 lights
    lightList.add(light1 = new Light(1));
    lightList.add(light2 = new Light(1));
    lightList.add(light3 = new Light(1));
    lightList.add(light4 = new Light(1));
    
    // Creating room 2 lights
    lightList.add(light5 = new Light(2));
    lightList.add(light6 = new Light(2));
    lightList.add(light7 = new Light(2));
    lightList.add(light8 = new Light(2));
    
    // Creating room 3 lights
    lightList.add(light9 = new Light(3));
    lightList.add(light10 = new Light(3));
    lightList.add(light11 = new Light(3));
    lightList.add(light12 = new Light(3));

    // Create rooms
    room1 = new Room(1, 1);
    room2 = new Room(2, 2);
    room3 = new Room(3, 3);
    roomList.add(room1);
    roomList.add(room2);
    roomList.add(room3);
    
    setupChanger();
}

public void setupChanger() {
    PFont font = createFont("arial", 20);
    
    DropdownList droplist = cp5.addDropdownList("Room List").setPosition(240, 290);
    droplist.setBarHeight(25);
    droplist.setItemHeight(15);
    droplist.setWidth(80);
    droplist.addItem("Room 1", 1);
    droplist.addItem("Room 2", 2);
    droplist.addItem("Room 3", 3);
    
    cp5.addSlider("lightSize")
     .setPosition(20,310)
     .setSize(200,40)
     .setRange(0,150)
     .setValue(lightSize)
     .setNumberOfTickMarks(15);
     
    cp5.getController("lightSize").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("lightSize").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);

    redInput = cp5.addTextfield("Red")
        .setPosition(20, 100)
        .setSize(200, 40)
        .setFont(font)
        .setFocus(true)
        .setColor(color(255, 0, 0))
        .setAutoClear(false)
        .setText("");

    greenInput = cp5.addTextfield("Green")
        .setPosition(20, 170)
        .setSize(200, 40)
        .setFont(font)
        .setFocus(true)
        .setColor(color(0, 255, 0))      
        .setAutoClear(false)
        .setText("");

    blueInput = cp5.addTextfield("Blue")
        .setPosition(20, 240)
        .setSize(200, 40)
        .setFont(font)
        .setFocus(true)
        .setColor(color(0, 0, 255))
        .setAutoClear(false)
        .setText("");

    cp5.addBang("clear")
        .setPosition(240, 170)
        .setSize(80, 40)
        .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);

    cp5.addBang("save")
        .setPosition(240, 230)
        .setSize(80, 40)
        .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);

    textFont(font);
}

void draw() {

    background(0);
    fill(previewColour);
    text(textValue, 360, 180);
    ellipse(500, 184, 220, 220);
    fill(initialColour);
    ellipse(630, 90, 75, 75);

    // For deciding which room is selected
    if (roomSelected == 1) {
      room1.display();
    } else if (roomSelected == 2) {
      room2.display();
    } if (roomSelected == 3) {
      room3.display();
    }
    
    if (currLight == null) {
      cp5.getController("lightSize").setValue(0);
    }    

    // Ensuring that only rgb values can be inputted
    validateTextField(redInput);
    validateTextField(greenInput);
    validateTextField(blueInput);
    
}

void update() {
    if (currLight == null)
        getSelectedLight();
    else
        updatePreview();
}

void getSelectedLight() {
    for (Light light: lightList) {
        // Makes sure light in current room are only selectable
        if ((light.mouseClicked()) && (light.roomNo == roomSelected)) { 
            currLight = light;
            currLight.selected = true;
            selectedLight = true;
            break;
        }
    }
}

void drawLights(int roomNum) {
    for (Light light: lightList)
      // Makes sure to only draw lights within the room selected.
      if (light.roomNo == roomNum) {
        light.display();
      }
}

void mouseClicked() {
    if (currLight != null && selectedLight) {
        initializePreview(currLight);
        selectedLight = false;
    }

}

public void save() {

    // Change light size
    currLight.changeSize(lightSize);

    //redraws lights, after checking room number
    currLight.changeColour(red(previewColour), green(previewColour), blue(previewColour));
    if (roomSelected == 1) {
      drawLights(room1.roomNo);
    } if (roomSelected == 2) {
      drawLights(room2.roomNo);
    } if (roomSelected == 3) {
      drawLights(room3.roomNo);
    } 

    clear();
}

public void clear() {

    editLight = false;
    currLight.selected = false;
    currLight = null;

    redInput.setText("");
    greenInput.setText("");
    blueInput.setText("");

    previewColour = color(255);
    initialColour = color(255);
    
    lightSize = 0;
    cp5.getController("lightSize").setValue(lightSize);    
}

void initializePreview(Light light) {

    int red = light.redLight;
    int green = light.greenLight;
    int blue = light.blueLight;

    redInput.setText(String.valueOf(red));
    redInput.setColor(color(red, 0, 0));
    
    greenInput.setText(String.valueOf(green));
    greenInput.setColor(color(0, green, 0));
    
    blueInput.setText(String.valueOf(blue));
    blueInput.setColor(color(0, 0, blue));

    previewColour = color(red, green, blue);
    initialColour = color(red, green, blue);
    
    cp5.getController("lightSize").setValue(light.diameter);
}

public void updatePreview() {

    float redColour = verifyColour(redInput.getText());
    float greenColour = verifyColour(greenInput.getText());
    float blueColour = verifyColour(blueInput.getText());

    boolean validColour = withinColourRange(redColour) && withinColourRange(greenColour) && withinColourRange(blueColour);

    if (validColour) {
        previewColour = color(redColour, greenColour, blueColour);
        redInput.setColor(color(redColour, 0, 0));
        greenInput.setColor(color(0, greenColour, 0));
        blueInput.setColor(color(0, 0, blueColour));
    }
}

public void validateTextField(Textfield textField) {

    if (keyPressed && textField.isFocus()) {
        float n;
        try {
            n = Float.parseFloat(textField.getText().replace(',', '.')); // may throw exception
            if (!withinColourRange(n)) {
                throw new NumberFormatException(); // throw to catch below
            }
        } catch (Exception e2) {
            String t;
            if (textField.getText().length() > 1) {
                t = textField.getText().substring(0, textField.getText().length() - 1);
            } else {
                t = "";
            }
            textField.setText(t);
        }
    }
}

private boolean withinColourRange(float n) {
    return n >= 0 && n <= 255;
}

private float verifyColour(String text) {
    if (text.equals("")) {
        return 0;
    } else {
        return Float.parseFloat(text);
    }
}
    
void controlEvent(ControlEvent theEvent) {
  if (theEvent.isGroup()) {
    println("event from group : "+theEvent.getGroup().getValue()+" from "+theEvent.getGroup());
  } 
  else if (theEvent.isController()) {
    if (theEvent.getController().getName() == "Room List" ) {
      println("event from controller : "+theEvent.getController().getValue()+" from "+theEvent.getController());
      if (theEvent.getController().getValue()==0) {
        roomSelected = 1;
      } else if (theEvent.getController().getValue()==1) {
        roomSelected = 2;
      } else if (theEvent.getController().getValue()==2) {
        roomSelected = 3;
      }
    }
  }
}    
    
