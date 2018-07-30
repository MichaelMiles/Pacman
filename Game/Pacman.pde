// Michael Fang(Chenyang Fang)
// 5/08/2018
// Copyright 2018 UW IGEM
// This class represents the
// Pacman character of Pacman game


public class Pacman{
   
  private static final int OFFSET = 100; // the offset of the whole map to the left and up boarder of the screen
  private static final int SIZE = 20; // the default size(width and length) of every element in the map in pixels
  
  
  // we use index to represent the direction and the images
  // -1 = N(index 0), 1 = E(index 1), 1 = S(index 2), -1 = W(index 3)
  private final int[] direction = {-1, 1, 1, -1};
  private final PImage[] img = {loadImage("pacmanN.png"), loadImage("pacmanE.png"),
                  loadImage("pacmanS.png"), loadImage("pacmanW.png")};
  
  // coordinates of the pacman in the map, represented by array
  // index 0: yCoord  index 1: xCoord
  private int[] coord = new int[2];
  private int di; // the index to represent the direction
  // use index to represent the x or y coordinate 
  // note that we can map from the index of the direction to
  // the index of the coordinates using mod operator
  // ex. 0 % 2 = 2 % 2 = 0 -> y coordinate
  private int axis;
  private PImage currentImage; // resize to 20X20
  
  // construct a new Pacman instance
  // initialize fields
  // @param int x starting x coordinate on map
  // @param itn y starting y coordinate on map
  // @param int di the direction the 
  // inside the maze in pixels
  public Pacman(int x,int y, int di){
    // resize the images
    for (PImage image : img) {
      image.resize(SIZE, SIZE);
    }
    // uodate di coordinates etc.
    this.di = di;
    this.axis = di % 2;
    coord[0] = y;
    coord[1]  = x;    
    currentImage = img[di];
  }
  
  // tests if the movement of Pacman is valid in reference
  // to the map walls, and if it is, updates Pacman location
  // @param map is PacMap instance to reference
  public void updateXY(PacMap map){
    if (!checkWall(map, this.di)) {
      this.coord[this.axis] += this.direction[di];
    }
  }
  
  // check if the pacman moves towards the given direction one step will
  // hit the wall or not
  // @param PacMap map the map that the current pacman is in
  // @param int direction the direction that the pacman is heading to
  // @return true if the pacman will hit the wall, false otherwise
  public boolean checkWall(PacMap map, int di) {
    // update the tempXY to check if the step will hit the wall
    int[] tempXY = {this.coord[0], this.coord[1]}; // make a copy of the cuurent location in the map
    tempXY[di % 2] += this.direction[di];
   
    // use the map's checkWall to implement this function
    return map.checkWall(tempXY[1], tempXY[0]);
  }
  
  // changes the direction of Pacman using cardinal directions
  // @param keyDir is character of key pressed ('w','s','a','d') 
  // @require keyDir must be an element of the set ('w', 's', 'a', 'd')
  public void updateDirection(char keyDir){
    if(keyDir == 'w'){
      this.di = 0;
    }else if(keyDir == 's'){
      this.di = 2;
    }else if(keyDir == 'a'){
      this.di = 3;
    }else {
      this.di = 1;
    }  
    // update the axis and currentImage
    this.axis = di % 2;
    this.currentImage = img[di];
  }
  
  // @return the current image representing the pacman
  public PImage getImage(){
    return currentImage; 
  }
  
  // draws image of Pacman
  public void display(){
    image(currentImage, OFFSET  + coord[1] * SIZE, OFFSET + coord[0] * SIZE); 
  }
}
