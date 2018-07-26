// Rehaan Bhimani
// 5/08/2018
// Copyright 2018 UW IGEM
// This class represents the
// Pacman character of Pacman game


public class Pacman{

  private int xCoord;
  private int yCoord;
  private int direction;//1 = N, -1 = S, 2 = E, -2 = W
  private PImage currentImage;//resize to 20X20
  private PImage imageN = loadImage("pacmanN.png");
  private PImage imageS = loadImage("pacmanS.png");
  private PImage imageE = loadImage("pacmanE.png");
  private PImage imageW = loadImage("pacmanW.png");
  
  /* construct a new Pacman instance
    @param x is starting x coordinate on map
    @param y is starting y coordinate on map */
  public Pacman(int x,int y){
    imageN.resize(20,20);
    imageS.resize(20,20);
    imageE.resize(20,20);
    imageW.resize(20,20);
    direction = 1;
    xCoord = x;
    yCoord = y;
    currentImage = imageN;
  }
  
  /* tests if the movement of Pacman is valid in reference
     to the map walls, and if it is, updates Pacman location
     @param map is PacMap instance to reference */
  public void updateXY(PacMap map){
    int testX = xCoord;
    int testY = yCoord;
    
    if(direction == 1){
      testY--;
    }else if(direction == -1){
      testY++;
    }else if(direction == 2){
      testX++;
    }else if(direction == -2){
      testX--;
    }
    
    if(!map.checkWall()){
      xCoord = testX;
      yCoord = testY;
    }
  }
  
  /* changes the direction of Pacman using cardinal directions
     @param keyDir is character of key pressed ('w','s','a','d') */
  public void updateDirection(char keyDir){
    if(keyDir == 'w'){
      direction = 1;
      image = imageN;
    }else if(keyDir == 's'){
      direction = -1;
      image = imageS;
    }else if(keyDir == 'a'){
      direction = 2;
      image = imageW;
    }else if(keyDir == 'd'){
      direction = -2;
      image = imageE;
    }  
  }
  
  /* return image of Pacman */
  public PImage getImage(){
    return currentImage; 
  }
  
  /* draws image of Pacman */
  public void display(){
    image(currentImage,xCoord,yCoord); 
  }
}
