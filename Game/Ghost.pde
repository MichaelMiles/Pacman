

public class Ghost{
  
  private static final int OFFSET = 100; // the offset of the whole map to the left and up boarder of the screen
  private static final int SIZE = 20; // the default size(width and length) of every element in the map in pixels
  
  private static final int step = 1; // everytime the ghost can only move 1 index in the maze
  private int xCoord; // the current x coordinate of this ghost in the maze
  private int yCoord;  // the currenr y coordinare of this ghost in the maze
  private int direct; // the diretion of movement 0: N 1: S 2: E 3: W
  
  private PImage monster; // the representation of this ghost
  
  // constructor for ghost
  // @param x the starting x coordinate
  // @param y the starting y coordinate
  public Ghost(int x, int y) {
    this.xCoord = x;
    this.yCoord = y;
    
    // use random() to randomly choose one representation
    // for displaying the ghost
    int choice = floor(random(4));
    if (choice == 0) {
      monster = loadImage("redGhost.png"); // the red demon
    } else if (choice == 1) {
      monster = loadImage("orangeGhost.png"); // the yellow monster
    } else if (choice == 2) {
      monster = loadImage("blueGhost.jpeg"); // the blue creep
    } else {
      monster = loadImage("pinkGhost.png"); // the pink evil
    }
    // resize the image
    monster.resize(SIZE, SIZE);
  }
  
  // update the X-Y coordinates of the
  // ghost in the map (movement)
  // @param map the PacMap we used to
  //        test if the movement is valid or not
  // @modify this.x this.y this.direction
  // @effect update the x, y , direction of
  //         the ghost. updated value is chosen randomly
  public void updateXY(PacMap map) {
     if (!moveForward(map)) {
       resetDirection(map);
       moveForward(map);
     }
  }
  
  
  // move forward in current direction
  // @return true if we successfully move forward
  //          false otherwise
  private boolean moveForward(PacMap map) {
    int testX; // for storing possible future x coordinate
    int testY; // for storing possible future y coordinate
    testX = this.xCoord;
    testY = this.yCoord;
      
    if (direct == 0) {
      testY -= step;
    } else if (direct== 1) {
      testY += step;
    } else if (direct == 2) {
      testX -= step;
    } else {
      testX += step;
    }
    if (map.checkWall(testX, testY)) {
      // Oops, we cannot move forward
      return false;
    } else {
      // update x, y coordinates
      this.xCoord = testX;
      this.yCoord = testY;
      return true;
    }
  }
  
  private void resetDirection(PacMap map) {
    int testX; // for storing possible future x coordinate
    int testY; // for storing possible future y coordinate
    int direction; // for storing values of direcrion 0: N 1: S 2: E 3: W
    
    // randomly move to another place in the maze by one step
    do {
      testX = this.xCoord;
      testY = this.yCoord;
      // randomly choose whether ghost go N-S way or E-S way
      direction = floor(random(4));
      if (direction == 0) {
        testY -= step;
      } else if (direction == 1) {
        testY += step;
      } else if (direction == 2) {
        testX -= step;
      } else {
        testX += step;
      } 
    } while (map.checkWall(testX, testY));
    // reset direction
    this.direct = direction;
  }
  
  // display the ghost in the maze
  public void display() {
    image(monster, OFFSET  + xCoord * SIZE, OFFSET + yCoord * SIZE); 
  }
}
