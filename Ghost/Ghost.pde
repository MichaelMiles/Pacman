/**
@Param: takes in the pacMap to check if there are walls
@effect: If there are no walls, the ghost will continue to move in the same direction.
If there is a wall in front of the ghost, the ghost will change directions.
@return: The ghost's new direction.
*/

public class Ghost{
  private int direction = random(4);
  private PImage red;
  private PImage orange;
  private PImage blue;
  private PImage pink;
  
  void setup(){
    size(20,20);
    red = loadImage("redGhost.png");
    orange = loadImage("orangeGhost.png");
    blue = loadImage("blueGhost.jpeg");
    pink = loadImage("pinkGhost.png");
  }
  
  public Action getMove(PacMap map){
    boolean update = map.checkWall(0,0);
    if (update == TRUE){
      direction = random(5);
      return direction;
    } else {
      return direction;
    }
  }
  
  public PImage image(){
    return red;
  }
}
