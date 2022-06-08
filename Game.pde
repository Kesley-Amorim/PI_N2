PImage bg;

PImage sound_icon;

PImage mute_icon;

PImage start_icon;

PImage credits_icon;

PImage exit_icon;

boolean sound = true;

Enemies pendulo;

Button sound_bt;

Button start_bt;

Button credits_bt;

Button exit_bt;

void setup() {
  bg = loadImage("bg.png");
  image(bg, 0, 0);
  sound_icon = loadImage("volume.png");
  mute_icon = loadImage("mute.png");
  start_icon = loadImage("start.png");
  credits_icon = loadImage("CREDITS.png");
  exit_icon = loadImage("exit.png");
  sound_bt = new Button(sound_icon, 1175, 43);
  start_bt = new Button(start_icon, 683, 400);
  credits_bt = new Button(credits_icon, 683, 650);
  exit_bt = new Button(exit_icon, 70, 43);
  size(1366, 768);
  
  pendulo = new Enemies(683,86,683,383,50,100, 0, 100, 20, 110);
  pendulo.render();
}


void draw() {
  image(bg, 0, 0);
  sound_bt.update();
  exit_bt.update();

  if (sound_bt.isClicked() == true) {
    if (sound == true) {
      sound_bt.setImg(mute_icon);
      sound_bt.update();
      sound = false;
      sound_bt.setClicked(false);
    } else {
      sound_bt.setImg(sound_icon);
      sound_bt.update();
      sound = true;
      sound_bt.setClicked(false);
    }
  }
  
  pendulo.update();

  
    
}
