class Room {
  int roomNo;
  int roomLayout;
  
  Room(int roomNum, int roomLO) {
    roomNo = roomNum;
    roomLayout = roomLO;
  }
  
  void display() {
    // Room Walls
    int margin = 30;
    int roomX = margin + 6;
    int roomY = 76;

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

    // Different furniture based on room number
    if (roomNo == 1) {
      rect(15, 15, 60, 175);
      rect(180, (220 / 2) - 20, 175, 40);
      rect(width - (margin * 3) - 60, 30, 30, 140);
    } else if (roomNo == 2) {
      rect(25, 25, 55, 115);
      rect(400, 50, 150, 40);
      rect(170, 120, 130, 70);
    } else if (roomNo == 3) {
      rect(500, 55, 55, 115);
      rect(200, 50, 150, 80);
      rect(20, 90, 60, 60);
    }

    // Draw lights
    drawLights(roomNo);

    popMatrix();

  }
  
  
  
  
  
  
  
  
  
}
