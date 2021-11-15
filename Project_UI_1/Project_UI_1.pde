PWindow win;
PImage phone;

public void settings() {
  size(367, 750);
  phone = loadImage("android_template.png");
}

void setup() { 
  win = new PWindow();
}

void draw() {
  background(250, 250, 250);
  image(phone, 0, 0);
  fill(200);
  rect(12, 77, 340, 600);
  
}

void mousePressed() {
  println("mousePressed in primary window");
}
