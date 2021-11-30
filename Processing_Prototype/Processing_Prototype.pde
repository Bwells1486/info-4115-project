import controlP5.*;
import java.util.*;

ControlP5 cp5;
// NEED TO TAKE VALS AND PUT THEM ON THE ELLIPSE AS A COLOR
String textValue = "";
boolean circleOver = false;
boolean editLight = false;
boolean selectedLight = false;

int circleX, circleY; // Position of circle button

color previewColour = 255;

Textfield redInput;
Textfield greenInput;
Textfield blueInput;

Light light1, light2, light3, light4; // Add Lights
List < Light > lightList = new ArrayList < Light > ();

Light currLight;


void setup() {
    size(700, 800);

    cp5 = new ControlP5(this);

    circleX = 20;
    circleY = 20;

    light1 = new Light(int(random(1, 255)), int(random(1, 255)), int(random(1, 255)), "kitchen", int(random(10, 600)), int(random(10, 210)), int(random(50, 150))); // Light Constructor
    light2 = new Light(int(random(1, 255)), int(random(1, 255)), int(random(1, 255)), "kitchen", int(random(10, 600)), int(random(10, 210)), int(random(50, 150))); // Light Constructor
    light3 = new Light(int(random(1, 255)), int(random(1, 255)), int(random(1, 255)), "kitchen", int(random(10, 600)), int(random(10, 210)), int(random(50, 150))); // Light Constructor
    light4 = new Light(int(random(1, 255)), int(random(1, 255)), int(random(1, 255)), "kitchen", int(random(10, 600)), int(random(10, 210)), int(random(50, 150))); // Light Constructor

    lightList.add(light1);
    lightList.add(light2);
    lightList.add(light3);
    lightList.add(light4);

    setupChanger();
}

public void setupChanger() {
    PFont font = createFont("arial", 20);


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

    drawRoom();

    validateTextField(redInput);
    validateTextField(greenInput);
    validateTextField(blueInput);

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

    update();

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
    drawLights();


    popMatrix();

}

void update() {

    if (currLight == null)
        getSelectedLight();
    else
        updatePreview();

}

void getSelectedLight() {
    for (Light light: lightList) {
        if (light.mouseClicked()) {

            currLight = light;
            selectedLight = true;

            break;
        }

    }
}

void drawLights() {
    for (Light light: lightList)
        light.display();
}

void mouseClicked() {
    if (currLight != null && selectedLight) {
        initializePreview(currLight);
        selectedLight = false;
    }

}

public void save() {

    currLight.changeColour(red(previewColour), green(previewColour), blue(previewColour));
    drawLights();

    clear();
}

public void clear() {

    editLight = false;
    currLight = null;

    redInput.setText("");
    greenInput.setText("");
    blueInput.setText("");

    previewColour = color(255);
}

void initializePreview(Light light) {

    int red = light.redLight;
    int green = light.greenLight;
    int blue = light.blueLight;

    redInput.setText(String.valueOf(red));
    redInput.setColor(color(red, 0, 0));
    
    greenInput.setText(String.valueOf(green));
    blueInput.setColor(color(0, blue, 0));
    
    blueInput.setText(String.valueOf(blue));
    greenInput.setColor(color(0, 0, green));

    previewColour = color(red, green, blue);

}

public void updatePreview() {

    float redColour = verifyColour(redInput.getText());
    float greenColour = verifyColour(greenInput.getText());
    float blueColour = verifyColour(blueInput.getText());

    boolean validColour = withinColourRange(redColour) && withinColourRange(greenColour) && withinColourRange(blueColour);

    if (validColour) {
        previewColour = color(redColour, greenColour, blueColour);
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
