  Button b = new Button(100,100,50,50,"a",255,0,0);
    
  Button b2 = new Button(200,200,50,50,"b",255,0,0,false);
  
void setup() {
  size(600,600);
  background(255);
  b.render();
}
 //<>//
 //<>//
  
void draw(){
b.render();
 b.update(); //<>//

  if(b.isClicked() == true){
    b.hide();
  }
  
 //<>//
 //<>//
//  b.update(); //<>//


//  b2.update(); //<>//
 //<>//
//b2.show(); //<>//
//b2.update(); //<>//
}
