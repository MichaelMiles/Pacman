// Rehaan Bhimani
// 5/08/2018
// Copyright 2018 UW IGEM
// This class represents the
// Pacman character of Pacman game


public class Pacman{
   
  private static final int OFFSET = 100; // the offset of the whole map to the left and up boarder of the screen
  private static final int SIZE = 20; // the default size(width and length) of every element in the map in pixels
  
  private int xCoord;
  private int yCoord;
  private int direction; // 1 = N, -1 = S, 2 = E, -2 = W
  private PImage currentImage; // resize to 20X20
  private PImage imageN;
  private PImage imageS;
  private PImage imageE;
  private PImage imageW;
  
  /* construct a new Pacman instance
    @param x is starting x coordinate on map
    @param y is starting y coordinate on map
    @param size the default length and width of pacman
            inside the maze in pixels */
  public Pacman(int x,int y){
    // set up images used for representing the pacman
    imageN = loadImage("pacmanN.png");
    imageS = loadImage("pacmanS.png");
    imageE = loadImage("pacmanE.png");
    imageW = loadImage("pacmanW.png");
    // resize the images
    imageN.resize(SIZE, SIZE);
    imageS.resize(SIZE, SIZE);
    imageE.resize(SIZE, SIZE);
    imageW.resize(SIZE, SIZE);
    currentImage = imageS;
    direction = -1;
    xCoord = x;
    yCoord = y;
  }
  
  
  /* tests if the movement of Pacman is valid in reference
     to the map walls, and if it is, updates Pacman location
     @param map is PacMap instance to reference */
  public void updateXY(PacMap map){
    int testX = xCoord;
    int testY = yCoord;
    
    if(direction == 1){
      testY -= 1;
    }else if(direction == -1){
      testY += 1;
    }else if(direction == 2){
      testX -= 1;
    }else if(direction == -2){
      testX += 1;
    }
    
    if(!map.checkWall(testX, testY)){
      xCoord = testX;
      yCoord = testY;
    } 
  }
  
  /* changes the direction of Pacman using cardinal directions
     @param keyDir is character of key pressed ('w','s','a','d') */
  public void updateDirection(char keyDir){
    if(keyDir == 'w'){
      direction = 1;
      currentImage = imageN;
    }else if(keyDir == 's'){
      direction = -1;
      currentImage = imageS;
    }else if(keyDir == 'a'){
      direction = 2;
      currentImage = imageW;
    }else {
      direction = -2;
      currentImage = imageE;
    }  
  }
  
  /* return image of Pacman */
  public PImage getImage(){
    return currentImage; 
  }
  
  /* draws image of Pacman */
  public void display(){
    image(currentImage, OFFSET  + xCoord * SIZE, OFFSET + yCoord * SIZE); 
  }
}
