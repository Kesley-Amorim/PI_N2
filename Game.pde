PImage bg;

Button b = new Button(100, 100, 50, 50, "a", 255, 0, 0);

Button b2 = new Button(200, 200, 50, 50, "b", 255, 0, 0, false);

Button marker_r = new Button(1250, 50, 50, 50, "M", 255, 0, 200);

Player p = new Player(40, 40, 70, 70);

void setup() {
  size(1366, 768);
  bg = loadImage("bg.png");
  background(bg);
  b.render();
  marker_r.render();
  //p.render();
}


void draw() {
  background(bg);

  drawPoints();
    drawLines();
 //removePoints();
  b.update();
  marker_r.update();
  p.update();
//println(getLineCoords());
  if (b.isClicked() == true) {
    b.hide();
  }

  if (mousePressed == true && mouseButton == RIGHT) {
    b.show();
  }
  b.update();
  marker_r.update();
}

void mouseClicked(){
   if ( mouseButton == RIGHT) {
     removePoints();
  }
}
