import ddf.minim.*;

int GameScreen = 0;
PImage bg;
PImage ra;
PImage tri;
PImage sound_icon;
PImage mute_icon;
PImage start_icon;
PImage credits_icon;
PImage exit_icon;
PImage easy_icon;
PImage normal_icon;
PImage hard_icon;
PImage undo_icon;
PImage play_icon;
PVector circulo;

boolean sound = true;
boolean isWalking = false;

Minim gerenciador;
AudioPlayer menu;
AudioPlayer fase1_song;
AudioPlayer fase2_song;
AudioPlayer fase3_song;
AudioPlayer gameover_song;
Enemies pendulo;
Enemies pendulo1;
Enemies pendulo2;
Enemies pendulo3;
Enemies triangulo;
Enemies triangulo1;
Button sound_bt;
Button start_bt;
Button credits_bt;
Button exit_bt;
Button easy_bt;
Button normal_bt;
Button hard_bt;
Button undo_bt;
Button play_bt;

PVector finalPoint;
final PVector defaultPos = new PVector(120, 130);
Player p = new Player(int(defaultPos.x), int(defaultPos.y), 70, 70);;

void setup() {
  bg = loadImage("bg.png");
  ra = loadImage("Ra.png");
  tri = loadImage("tri.png");
  image(bg, 0, 0);
  sound_icon = loadImage("volume.png");
  mute_icon = loadImage("mute.png");
  start_icon = loadImage("start.png");
  credits_icon = loadImage("CREDITS.png");
  exit_icon = loadImage("exit.png");
  easy_icon = loadImage("easy.png");
  normal_icon = loadImage("normal.png");
  hard_icon = loadImage("hard.png");
  undo_icon = loadImage("undobt.png");
  play_icon = loadImage("playbt.png");
  play_bt = new Button(play_icon, 727, 680);
  undo_bt = new Button(undo_icon, 627, 680);
  sound_bt = new Button(sound_icon, 1296, 43);
  start_bt = new Button(start_icon, 683, 400);
  credits_bt = new Button(credits_icon, 683, 650);
  exit_bt = new Button(exit_icon, 70, 43);
  easy_bt = new Button(easy_icon, 383, 450);
  normal_bt = new Button(normal_icon, 683, 450);
  hard_bt = new Button(hard_icon, 983, 450);
  size(1366, 768);
  gerenciador = new Minim(this);
  menu = gerenciador.loadFile("menu.mp3");
  fase1_song = gerenciador.loadFile("fase1.mp3");
  fase2_song = gerenciador.loadFile("fase2.mp3");
  fase3_song = gerenciador.loadFile("fase3.mp3");
  gameover_song = gerenciador.loadFile("gameover.mp3");
  pendulo = new Enemies(683, 86, 683, 383, 50, 100, 0, 100, 20, 110);
  pendulo.render();
  pendulo1 = new Enemies(683, 259,683,383,50,150, 0, 100, 20, 110);
  pendulo1.render();
  pendulo2 = new Enemies(883, 259,883,383,50,150, 0, 100, 20, 110);
  pendulo1.render();
  pendulo3 = new Enemies(283, 259,283,383,50,150, 0, 100, 20, 110);
  pendulo1.render();
}

void draw() {
  if (GameScreen == 0) {
    initScreen();
  } else if (GameScreen == 1) {
    difficultyScreen();
  } else if (GameScreen == 2) {
    creditsScreen();
  } else if (GameScreen == 3) {
    fase1Screen();
  } else if (GameScreen == 4) {
    fase2Screen();
  } else if (GameScreen == 5) {
    fase3Screen();
  }
}

/********* MENU INICIAL *********/

void initScreen() {
  image(bg, 0, 0);
  sound_bt.update();
  exit_bt.update();
  start_bt.show();
  start_bt.update();
  credits_bt.show();
  credits_bt.update();
  menu.play();

  if (sound_bt.isClicked() == true) {
    if (sound == true) {
      sound_bt.setImg(mute_icon);
      sound_bt.update();
      menu.mute();
      sound = false;
      sound_bt.setClicked(false);
    } else {
      sound_bt.setImg(sound_icon);
      sound_bt.update();
      menu.unmute();
      sound = true;
      sound_bt.setClicked(false);
    }
  }
   if(sound_bt.img == mute_icon) {
   menu.mute(); 
 }

  if (start_bt.isClicked() == true) {
    if (GameScreen==0) {
      startGame();
    }
  }

  if (credits_bt.isClicked() == true) {
    if (GameScreen==0) {
      credits();
    }
  }
}

/********* MENU DIFICULDADE *********/

void difficultyScreen() {
  start_bt.update();
  start_bt.hide();
  background(255);
  sound_bt.update();
  exit_bt.update();
  easy_bt.update();
  easy_bt.Display =true;
  normal_bt.update();
  normal_bt.Display =true;
  hard_bt.update();
  hard_bt.Display =true;
  menu.play();

  if (sound_bt.isClicked() == true) {
    if (sound == true) {
      sound_bt.setImg(mute_icon);
      sound_bt.update();
      menu.mute();
      sound = false;
      sound_bt.setClicked(false);
    } else {
      sound_bt.setImg(sound_icon);
      sound_bt.update();
      menu.unmute();
      sound = true;
      sound_bt.setClicked(false);
    }
  }

  if (exit_bt.isClicked() == true) {
    if (GameScreen==1) {
      retMenu();
    }
  }

  if (easy_bt.isClicked() == true) {
    if (GameScreen==1) {
      fase1();
      clearPath();
      menu.pause();
      p.setPos(new PVector(60.0, 435.0));
    }
  }

  if (normal_bt.isClicked() == true) {
    if (GameScreen==1) {
      fase2();
      clearPath();
      menu.pause();
      p.setPos(new PVector(60.0, 435.0));
    }
  }

  if (hard_bt.isClicked() == true) {
    if (GameScreen==1) {
      fase3();
      clearPath();
      menu.pause();
      p.setPos(new PVector(60.0, 435.0));
    }
  }
}

/********* FASE 1 *********/

void fase1Screen() {
  add_ctrl = true;
  easy_bt.update();
  easy_bt.hide();
  //image(bg, 0, 0);
  background(255);
  sound_bt.update();
  exit_bt.update();
  add_ctrl = true;
  fill(150);
  triangulo = new Enemies(260, 580, 330, 450, 390, 580);
  triangulo.render();
  fill(150);
  triangulo1 = new Enemies(700, 260, 770, 400, 840, 260);
  triangulo1.render();
  fill(0);
  quad(0, 105, 0, 260, 1366, 260, 1366, 105);
  quad(0, 580, 0, 768, 1366, 768, 1366, 580);
  fill(0,150,0);
  circulo = new PVector(1200, 440);
  circle(circulo.x,circulo.y, 60);
  Check();
  
  
   gameUI();
  fase1_song.play();
  if (isWalking == true) {
    p.followPath();
    add_ctrl = false;
  }
  if (sound_bt.isClicked() == true) {
    if (sound == true) {
      sound_bt.setImg(mute_icon);
      sound_bt.update();
      fase1_song.mute();
      sound = false;
      sound_bt.setClicked(false);
    } else {
      sound_bt.setImg(sound_icon);
      sound_bt.update();
      fase1_song.unmute();
      sound = true;
      sound_bt.setClicked(false);
    }
  }

  if (exit_bt.isClicked() == true) {
    if (GameScreen==3) {
      retMenu();
      clearPath();
      fase1_song.pause();
      menu.play();
    }
  }
}


/********* FASE 2 *********/

void fase2Screen() {
  add_ctrl = true;
  normal_bt.update();
  normal_bt.hide();
  //image(bg, 0, 0);
  background(0, 255, 0);
  sound_bt.update();
  add_ctrl = true;
  gameUI();
  exit_bt.update();
  fase2_song.play();
  if (isWalking == true) {
    p.followPath();
    add_ctrl = false;
  }
  
   fill(0);
  triangulo = new Enemies(260, 580, 330, 450, 390, 580);
  triangulo.render();
  pendulo1.update();
  
  triangulo = new Enemies(960, 580, 1030, 450, 1090, 580);
  triangulo.render();
  
  
  quad(0, 105, 0, 260, 1366, 260, 1366, 105);
  quad(0, 580, 0, 768, 1366, 768, 1366, 580);
  
   fill(0,0,255);
  circulo = new PVector(1300, 440);
  circle(circulo.x,circulo.y, 60);
  Check();
  
  
   gameUI();
  
  if (sound_bt.isClicked() == true) {
    if (sound == true) {
      sound_bt.setImg(mute_icon);
      sound_bt.update();
      fase2_song.mute();
      sound = false;
      sound_bt.setClicked(false);
    } else {
      sound_bt.setImg(sound_icon);
      sound_bt.update();
      fase2_song.unmute();
      sound = true;
      sound_bt.setClicked(false);
    }
  }
   if(sound_bt.img == mute_icon) {
   fase2_song.mute(); 
 }

  if (exit_bt.isClicked() == true) {
    if (GameScreen==4) {
      retMenu();
      fase2_song.pause();
      menu.play();
    }
  }
}

/********* FASE 3 *********/

void fase3Screen() {
  add_ctrl = true;
  hard_bt.update();
  hard_bt.hide();
  //image(bg, 0, 0);
  background(150, 150, 0);
  sound_bt.update();
  exit_bt.update();
  add_ctrl = true;
  gameUI();
  fase3_song.play();
  if (isWalking == true) {
    p.followPath();
    add_ctrl = false;
  }
  
    
   fill(0);
  
  triangulo = new Enemies(460, 580, 530, 450, 590, 580);
  triangulo.render();
    pendulo2.update();
  pendulo3.update();
  
  triangulo = new Enemies(760, 580, 1030, 500, 1090, 580);
  triangulo.render();
  
  
  quad(0, 105, 0, 260, 1366, 260, 1366, 105);
  quad(0, 580, 0, 768, 1366, 768, 1366, 580);
  
   fill(0,0,255);
  circulo = new PVector(1300, 440);
  circle(circulo.x,circulo.y, 60);
  Check();
  
  gameUI();
  
  
  if (sound_bt.isClicked() == true) {
    if (sound == true) {
      sound_bt.setImg(mute_icon);
      sound_bt.update();
      fase3_song.mute();
      sound = false;
      sound_bt.setClicked(false);
    } else {
      sound_bt.setImg(sound_icon);
      sound_bt.update();
      fase3_song.unmute();
      sound = true;
      sound_bt.setClicked(false);
    }
  }
   if(sound_bt.img == mute_icon) {
   fase3_song.mute(); 
 }

  if (exit_bt.isClicked() == true) {
    if (GameScreen==5) {
      retMenu();
      fase3_song.pause();
      menu.play();
    }
  }
}

/********* MENU CREDITOS *********/

void creditsScreen() {
  credits_bt.update();
  credits_bt.hide();
  image(ra, 0, 0);
  sound_bt.update();
  exit_bt.update();
  menu.play();

  if (sound_bt.isClicked() == true) {
    if (sound == true) {
      sound_bt.setImg(mute_icon);
      sound_bt.update();
      menu.mute();
      sound = false;
      sound_bt.setClicked(false);
    } else {
      sound_bt.setImg(sound_icon);
      sound_bt.update();
      menu.unmute();
      sound = true;
      sound_bt.setClicked(false);
    }
  }

  if (exit_bt.isPressed() == true) {
    if (GameScreen==2) {
      retMenu();
    }
  }
}



/********* CHAMA O MENU *********/

void startGame() {
  GameScreen=1;
}

void retMenu() {
  clearPath();
  GameScreen=0;
}

void credits() {
  clearPath();
  GameScreen=2;
}

void fase1() {
  GameScreen=3;
  clearPath();
}

void fase2() {
  GameScreen=4;
  clearPath();
}

void fase3() {
  GameScreen=5;
  clearPath();
}

/********* CRIA UI *********/

void gameUI() {
  play_bt.update();
  undo_bt.update();
  drawPoints();
  drawLines();
  p.update();
}



void mouseClicked() {
  if (undo_bt.isClicked() == true) {
    removePoints();
  }
  if (isWalking == false) {
    if (play_bt.isClicked() == true) {
      isWalking = true;
      add_ctrl = false;
    }
  }
}
