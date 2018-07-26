// Michael Fang
// 4/30/2018
// Copyright 2018 UW IGEM
// This program shall create a pacman game for
// the user and start the game

PacMap maze;
// shall set everything the program needs
// to run a pacman game
void setup() {
  size(1000, 1000);
  background(0);
  maze = new PacMap();
}



// draw everything needed for the user
void draw() {
  // display the whole map as well as any
  // elements the map includes
  maze.display();
  // delay the display
  delay(100);
}


// listen to user's input
void keyPressed() {
  if (key == 'w' || key == 'W') {
      maze.updateDirection('w');
  } else if (key == 's' || key == 'S') {
      maze.updateDirection('s');
  } else if (key == 'a' || key == 'A') {
      maze.updateDirection('a');
  } else if (key == 'd' || key == 'D') {
      maze.updateDirection('d');
  }
     
}



// restart the game
void restart() {

}

// display win messsage for user
void displayWinMes() {


}

// display lost message for user
void displayLostMes() {

}
