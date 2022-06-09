static float k = 0.008;

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
    path.add(new PVector(x, y));
    this.size_x = size_x;
    this.size_y = size_y;
  }

private void setPos(PVector pos){
  this.Pos = pos;
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


  public void followPath() {
    
    List<PVector> temp = getLineCoords();
    if(!temp.isEmpty()){
      temp.get(0);
    }
    if (!path.isEmpty()) {
      PVector prox = path.get(0); 
      if (!isOnRadius(prox)) {
        Pos.lerp(prox, k+0.1);
      }
      else {
        path.remove(0);
      }
    }
  }
  
  private boolean isOnRadius(PVector point) {
    final double epsilon = 0.5;
    double delta_x = Math.abs(p.Pos.x - point.x);
    double delta_y = Math.abs(p.Pos.y - point.y);
    return delta_x <= epsilon && delta_y <= epsilon; //<>//
  }
}

void clearPath(){
  int i = path.size()-1;
  while(path.size()>1){
    path.remove(i);
    i--;
  }
 p.setPos(defaultPos);
 isWalking = false;
}

private Boolean isOnPlayerRadious(){
   final double epsilon = 0.4;
   double delta_x = Math.abs(p.Pos.x - p.size_x);
   double delta_y = Math.abs(p.Pos.y - p.size_y);
   return delta_x <= epsilon && delta_y <= epsilon;
}
