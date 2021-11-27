class Light {
  int redLight, greenLight, blueLight;
  color c;
  String room;
  float xpos;
  float ypos;
  
  Light(int rLight, int gLight, int bLight, String startRoom, float xPos, float yPos) {
    redLight = rLight;
    greenLight = gLight;
    blueLight = bLight;
    c = color(redLight, greenLight, blueLight);
    room = startRoom;
    xpos = xPos;
    ypos = yPos;
  }
  
  void display() {
    stroke(0);
    fill(c);
    ellipseMode(CENTER);
    circle(xpos, ypos, 220);
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
  
}
