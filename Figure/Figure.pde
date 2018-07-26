package pacman;

import java.util.Timer;

public interface Character {
   private int xCoord;
   private int yCoord;
   private int direction;
   private double speed;
   private PImage image;
   private boolean eater;
   private String tag;
   private Timer timer;
   
   /** This constructor creates an instance of a Character object
     and uses "this." function to initialize the fields w the arguments
     @param all fields except timer
     @return Charcter object
     @pre all arguments must be included
     @post a character object (for ghosts or pacman) is created */
   public Character(int xCoord, int yCoord, int direction,
   double speed, PImage image, String tag,
   boolean eater){
   }
   
   /**  get x coordinate of character
   @return x coordinate of character */
   public int getxCoord(){
   }
   
   /**  get y coordinate of character
     @return y coordinate of character */
   public int getYCoord(){
   }
   
   /**  get movement direction of character
     @return direction of character
     as integer from 1 to 4 representing map directions*/
   public int getDirection(){
   }
   
   /**  get movement speed of character
     @return movement speed of character */
   public double getSpeed(){
   }
   
   /**  get image of character
     @return display image of character */
   public Pimage getImage(){
   }
   
   /**  get tag of character
     @return "Ghost" or "Pacman" of character */
   public String getTag(){
   }
   
   /**  get invicibility status of character
     @return 1 if able to eat (Ghost default)
     @return 0 if able to be eaten (Pacman default) */
   public boolean getEater(){
   }
   
   /**  get timer for invincibility status
     @return time left for altered invincibility status */
   public Timer getTimer(){
   }
   
   /**  set x coordinate of character
     @param x coordinate of character */
   public void setxCoord(int x){
   }
   
   /**  set y coordinate of character
     @param y coordinate of character */
   public void setYCoord(int y){
   }
   
   /**  set movement direction of character
     @param direction of character
     as integer from 1 to 4 representing map directions*/
   public void setDirection(int dir){
   }
   
   /**  set movement speed of character
     @param movement speed of character */
   public void setSpeed(int speed){
   }
   
   /**  set image of character
     @param display image of character */
   public void setImage(PImage image){
   }
   
   /**  set tag of character
     @param "Ghost" or "Pacman" of character */
   public void setTag(String tag){
   }
   
   /**  set invicibility status of character
     @param 1 if able to eat (Ghost default)
     0 if able to be eaten (Pacman default) */
   public void setEater(boolean eater){
   }
   
   /**  set timer for invincibility status
     @param time left for altered invincibility status */
   public void setTimer(Timer timer){
   }
}
