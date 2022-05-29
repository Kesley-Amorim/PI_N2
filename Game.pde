  final static int bg = 255;
  
  Button b = new Button(100,100,50,50,"a",255,0,0);
    
  Button b2 = new Button(200,200,50,50,"b",255,0,0,false);
  
void setup() {
  size(600,600);
  background(bg);
  b.render();
}
 //<>//
 //<>//
  
void draw(){
//b.render();
 b.update(); //<>//

if(b.isClicked() == true){
    b.hide();
}
  if(mousePressed == true && mouseButton == RIGHT){
   b.show();
  } //<>// //<>// //<>// //<>// //<>// //<>// //<>//
}
