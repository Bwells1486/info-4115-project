class PWindow extends PApplet {
  PWindow() {
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
  }

  void settings() {
    size(750, 750);
  }

  void setup() {
    background(150);
  }

  void draw() {
    background(200, 200, 200);
    fill(255);
  }

  void mousePressed() {
    println("mousePressed in secondary window");
  }
}
