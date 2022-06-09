class Player {

  //attrib
  PVector Pos = new PVector();
  int size_x;
  int size_y;
  boolean ismoving=false;
  float ang = PI;
  List<PVector> playerPath = new ArrayList();

  //constructor

  Player(int x, int y, int size_x, int size_y) {
    Pos.x = x;
    Pos.y = y;
    path.add(new PVector(x,y));
    this.size_x = size_x;
    this.size_y = size_y;
  }



  //methods
  void render() {

    pushMatrix();
    translate(Pos.x, Pos.y);
    rotate(radians(ang++));
    rectMode(CENTER);
    rect(0, 0, size_x, size_y);
    popMatrix();
  }

  void update() {
    ang += 0.01;
    pushMatrix();
    translate(Pos.x, Pos.y);
    rotate(radians(ang++));
    rectMode(CENTER);
    rect(0, 0, size_x, size_y);
    popMatrix();
  }


public void followPath(){
    this.playerPath = path;
     List<PVector> temp = getLineCoords();
    if(playerPath.size() >= 2){
      PVector c2 = temp.get(1);
      for(int i = 0; i < playerPath.size(); i++){
        Pos.lerp(c2,0.005);
       
        }
     
      }
      
    }
    
    //Pos.x = lerp();
    //Pos.y = lerp();
//  }
}
