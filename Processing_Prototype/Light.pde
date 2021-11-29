class Light {
  int redLight, greenLight, blueLight, diameter;
  color c;
  String room;
  float xpos;
  float ypos;
  
  int fuck = 0;
  
  Light(int rLight, int gLight, int bLight, String startRoom, float xPos, float yPos, int dCircle) {
    redLight = rLight;
    greenLight = gLight;
    blueLight = bLight;
    
    c = color(redLight, greenLight, blueLight);
    
    room = startRoom;
    xpos = xPos;
    ypos = yPos;
    diameter = dCircle;
  }
  
  void display() {
    stroke(0);
    fill(c, 129.5);
    noStroke();
    ellipseMode(CENTER);
    circle(xpos, ypos, diameter);
  }
  
  public void changeColour(float red, float green, float blue) {
    redLight = (int) red;
    greenLight = (int) green;
    blueLight = (int) blue;
  }
  
  void changeDisplay(int rLight, int gLight, int bLight) {
    redLight = rLight;
    greenLight = gLight;
    blueLight = bLight;
    c = color(redLight, greenLight, blueLight);
    fill(c);
    ellipseMode(CENTER);
    circle(xpos, ypos, 220);
  }
  
  public boolean mouseClicked() {
    
    if (mousePressed && overCircle())
          println("Light clicked", ++fuck);

    
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
