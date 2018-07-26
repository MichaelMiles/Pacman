// Michael Fang
// 4/26/2018
// Copyright 2018 Michael Fang
// This class represents a pair of coordinates corresponding
// to the position in a two-dimensional array
// it provides setters and getters for accessing
// the information in the coordinates pair

public class Location {
    private int x; // corresponds to the #row
    private int y; // corresponds to the #column

    /**
     *  Inv: this.x >= 0 && this.y >= 0
     */

     /**
      * construct a new Location initialized as (0, 0)
      */
    public Location() {
         this.x = 0;
         this.y = 0;
     }

     /**
      * construcrt a new Location initialized to (x, y)
      * @require x >= 0 && y >=0
      */
     public Location(int x, int y) {
         this.x = x;
         this.y = y;
     }


    /**
     * get the x coordinate
     * 
     * @return the x coordinate stored
     *          in this coordinates pair
     */
    public int getX() {
        return this.x;
    }

    /**
     * get the y coordinate
     * 
     * @return the y coordinate stored
     *          in this corrdinates pair
     */
    public int getY() {
        return this.y;
    }

    /**
     * reset the x coordinate
     * inside the coordinate pair
     * to thr given x
     * 
     * @param x the new x we need to assign into this Location
     * @require x >= 0 note that it is user's
     *          responsibility to ensure this Location
     *          to be valid
     * @modify this
     * @effect this.x = x
     */
    public void setX(int x) {
        this.x = x;
    } 

    /**
     * reset the y coordinate
     * inside the coordinate pair
     * to the given y
     * 
     * @param y the new y we need to assign into this Location
     * @require y >= 0 note thaat it is user's
     *          responsibility to ensure this Location
     *          to be valid
     * @modify this
     * @effect this.y = y
     */
    public void setY(int y) {
        this.y = y;
    }

    private void checkRep() {}
}
