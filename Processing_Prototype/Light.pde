class Light {
  int redLight, greenLight, blueLight, diameter;
  color c;
  String room;
  float xpos;
  float ypos;
  
  Light(int rLight, int gLight, int bLight, String startRoom, float xPos, float yPos, int dCircle) {
    redLight = rLight;
    greenLight = gLight;
    blueLight = bLight;
    diameter = dCircle;
    
    c = color(redLight, greenLight, blueLight);
    
    room = startRoom;
    xpos = xPos;
    ypos = yPos;
  }
  
  void display() {
    stroke(0);
    fill(c, 129.5);
    noStroke();
    ellipseMode(CENTER);
    circle(xpos, ypos, diameter);
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
  
  void mouseClicked() {
    
  }
  
}
