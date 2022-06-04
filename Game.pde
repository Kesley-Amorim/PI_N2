PImage bg;

PImage img;

PImage img2;

boolean sound = true;

Button som;

Button b = new Button(100, 100, 50, 50, "a", 255, 0, 0);

Button b2 = new Button(200, 200, 50, 50, "b", 255, 0, 0, false);

Button marker_r = new Button(1250, 50, 50, 50, "M", 255, 0, 200);

Player p = new Player(40, 40, 70, 70);

void setup() {
  bg = loadImage("bg.png");
  image(bg, 0, 0);
  img = loadImage("volume.png");
  img2 = loadImage("mute.png");
  som = new Button(img, 1175, 43);
  size(1366, 768);
}


void draw() {
  image(bg, 0, 0);
  som.update();

  if (som.isClicked() == true) {
    if (sound == true) {
      som.setImg(img2);
      som.update();
      sound = false;
    }else{
      som.setImg(img);
      som.update();
      sound = true;
    }
  }

  /*
  b.update();
   marker_r.update();
   p.update();
   if (b.isClicked() == true) {
   b.hide();
   }
   
   if (mousePressed == true && mouseButton == RIGHT) {
   b.show();
   }
   b.update();
   marker_r.update();
   */
}
