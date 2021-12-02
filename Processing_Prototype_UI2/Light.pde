class Light {
    int redLight, greenLight, blueLight, diameter;
    float opacity = 129.5;
    int roomNo;
    float xpos;
    float ypos;
    boolean selected;

    Light(int rLight, int gLight, int bLight, int startRoom, float xPos, float yPos, int dCircle) {
        redLight = rLight;
        greenLight = gLight;
        blueLight = bLight;
        roomNo = startRoom;
        xpos = xPos;
        ypos = yPos;
        diameter = dCircle;
        selected = false;
    }
    
    Light (int roomNum) {
      redLight = int(random(1, 255));
      greenLight = int(random(1, 255));
      blueLight = int(random(1, 255));
      roomNo = roomNum;
      xpos = int(random(10, 600));
      ypos = int(random(10, 210));
      diameter = int(random(50, 150));
      selected = false;
    }

    void display() {
        stroke(0);
        fill(redLight, greenLight, blueLight, opacity);
        noStroke();
        ellipseMode(CENTER);
        circle(xpos, ypos, diameter);
        if(selected) {
          stroke(255,255,0);
          noFill();
          circle(xpos, ypos, diameter);
        }
    }

    public void changeColour(float red, float green, float blue) {
        redLight = (int) red;
        greenLight = (int) green;
        blueLight = (int) blue;
    }
    
    public void changeSize(int circleSize) {
        diameter = circleSize;
    }

    public boolean mouseClicked() {
        return mousePressed && overCircle();
    }

    boolean overCircle() {
        float disX = xpos - mouseX;
        float disY = ypos - mouseY;
        if (sqrt(sq(disX) + sq(disY)) < diameter / 2) {
            return true;
        } else {
            return false;
        }
    }

}
