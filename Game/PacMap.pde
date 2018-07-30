// Michael Fang(Chenyang Fang)
// 4/30/2018
// Copyright 2018 UW IGEM
// This class represents an entire board
// of pacman game

public class PacMap{ 
  private static final int WALL = 0; // a WALL in two-dimensional array maze
  private static final int BEAN = 1; // a bean in two-dimensional array maze
  private static final int OFFSET = 100; // the offset of the whole map to the left and up boarder of the screen
  private static final int SIZE = 20; // the default size(width and length) of every element in the map in pixels
  private static final int ROW = 12; // number of rows of our two dimensional array map
  private static final int COL = 45; // number of columns of our two dimensional array map
  
  // use index to represent different directions
  private static final int N = 0;
  private static final int E = 1;
  private static final int S = 2;
  private static final int W = 3;
  
  private int score; // keeping track of user's score  
  private Pacman pacman;
  private Ghost ghost1;
  
  // two-dimensional array to represent the maze for pacman game
  // note that the y + 1 represents the second dimension + 1 (y-axis is reverse)
  private int[][] map = {
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0},
    {0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0},
    {0,1,0,0,0,1,0,0,0,0,0,1,1,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0},
    {0,1,1,0,1,1,0,1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,0,1,0,1,0,1,0},
    {0,1,1,0,1,1,0,1,1,1,1,1,1,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,1,1,1,0,1,0,1,0,1,0},
    {0,1,1,0,1,1,0,1,1,0,0,0,1,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,0,1,0,0,0,0,0,1,0,1,0,1,0,1,0},
    {0,1,1,0,1,1,0,1,1,1,0,1,1,1,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,1,1,1,1,1,0,1,0,1,0,1,0},
    {0,1,0,0,0,1,0,0,0,0,0,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,0,1,0,1,0,1,0},
    {0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,1,0,1,0,1,0},
    {0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0},
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
  };
  
  // initialize the map along with
  // ghosts and pacman
  public PacMap() {
      this.pacman = new Pacman(1, 1, S);
      this.ghost1 = new Ghost(41, 2);
  }
  
  // return the score of the current game
  // earned by player
  // @return score
  public int getScore() {
    return score;
  }
  
  
  // update the direction of the pacman inside the map
  // @param keyDir the key that user pressed. 'w' means pacman
  //            should move upward. 's' means pacman should
  //            move downward. 'a' and 'd' each means pacman
  //            should move left and right
  public void updateDirection(char keyDir) {
      this.pacman.updateDirection(keyDir, this);
  }
  
  
  // check if the coordinate responding to the
  // given x, y value represent a Wall brick in our game
  // @param x the x coordinate of the map
  // @param y the y coordinatre of the map 
  // @return true if the coordinate represents a 
  //             wall brick, false otherwise 
  public boolean checkWall(int x, int y) {
     // check if x, y is out of bound
     if (x >= COL || y >= ROW) {
       return false;
     }
     return map[y][x] == WALL;
  }
  
  
  // display the maze as well as any elements included
  // like pacman and beans and walls etc.
  public void display() {
     // displaying the maze
     for (int i = 0; i < map.length; i++) {
       for (int j = 0; j < map[i].length; j++) {
         if (map[i][j] == WALL) {
           fill(255);
           rect(OFFSET + j * SIZE, OFFSET + i * SIZE, SIZE, SIZE);
         } else {
           fill(0);
           rect(OFFSET + j * SIZE, OFFSET + i * SIZE, SIZE, SIZE);
         }
       }
     }
     // update and display the pacman
     this.pacman.updateXY(this);
     this.pacman.display();
     // update and display the ghost
     this.ghost1.updateXY(this);
     this.ghost1.display();
  }
  

  public void reset() {
  
  }
}
