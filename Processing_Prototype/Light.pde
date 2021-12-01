class Light {
    int redLight, greenLight, blueLight, diameter;
    float opacity = 129.5;
    int room;
    float xpos;
    float ypos;
    boolean selected;

    Light(int rLight, int gLight, int bLight, int startRoom, float xPos, float yPos, int dCircle) {
        redLight = rLight;
        greenLight = gLight;
        blueLight = bLight;

        room = startRoom;
        xpos = xPos;
        ypos = yPos;
        diameter = dCircle;
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
