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

boolean sound = true;

Minim gerenciador;
AudioPlayer menu;
AudioPlayer fase1_song;
AudioPlayer fase2_song;
AudioPlayer fase3_song;
AudioPlayer gameover_song;
Enemies pendulo;
Button sound_bt;
Button start_bt;
Button credits_bt;
Button exit_bt;
Button easy_bt;
Button normal_bt;
Button hard_bt;

Button b = new Button(100, 100, 50, 50, "a", 255, 0, 0);
Button b2 = new Button(200, 200, 50, 50, "b", 255, 0, 0, false);
Button marker_r = new Button(1250, 50, 50, 50, "M", 255, 0, 200);
Player p = new Player(40, 40, 70, 70);

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
  pendulo = new Enemies(683,86,683,383,50,100, 0, 100, 20, 110);
  pendulo.render();
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
  start_bt.update();
  start_bt.Display =true;
  credits_bt.update();
  credits_bt.Display =true;
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
  
  if(start_bt.isClicked() == true) {
       if (GameScreen==0) {
            startGame();
   }
  }
  
  if(credits_bt.isClicked() == true) {
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
  image(tri, 332, 320);
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
 
 if(exit_bt.isClicked() == true) {
       if (GameScreen==1) {
            retMenu();  
  }
 } 
 
  if(easy_bt.isClicked() == true) {
       if (GameScreen==1) {
            fase1(); 
            menu.pause();
  }
 } 
 
 if(normal_bt.isClicked() == true) {
       if (GameScreen==1) {
            fase2();  
            menu.pause();
  }
 } 
 
 if(hard_bt.isClicked() == true) {
       if (GameScreen==1) {
            fase3();  
            menu.pause();
  }
 } 
}

 /********* FASE 1 *********/

void fase1Screen(){
  easy_bt.update();
  easy_bt.hide();
  //image(bg, 0, 0);
  background(255);
  sound_bt.update();
  exit_bt.update();
  pendulo.update();
  fase1_song.play();
  
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
 
 if(exit_bt.isClicked() == true) {
       if (GameScreen==3) {
            retMenu();
            fase1_song.pause();
            menu.play();
  }
 }  
}

 /********* FASE 2 *********/

void fase2Screen(){
  normal_bt.update();
  normal_bt.hide();
  //image(bg, 0, 0);
  background(0,255,0);
  sound_bt.update();
  exit_bt.update();
  pendulo.update();
  fase2_song.play();
  
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
 
 if(exit_bt.isClicked() == true) {
       if (GameScreen==4) {
            retMenu();
            fase2_song.pause();
            menu.play();
  }
 }  
}

 /********* FASE 3 *********/

void fase3Screen(){
  hard_bt.update();
  hard_bt.hide();
  //image(bg, 0, 0);
  background(255,0,0);
  sound_bt.update();
  exit_bt.update();
  pendulo.update();
  fase3_song.play();
  
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
 
 if(exit_bt.isClicked() == true) {
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
 
 if(exit_bt.isClicked() == true) {
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
  GameScreen=0;
}

void credits() {
  GameScreen=2;
}

void fase1(){
  GameScreen=3;
}

void fase2(){
  GameScreen=4;
}

void fase3(){
  GameScreen=5;
}
