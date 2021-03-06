class Enemies {

  PVector Origin = new PVector();
  PVector Bob = new PVector();
  float Angle;
  int Len;
  int SizeCircle;
  float AngleV = 1;
  float AngleA;
  float Gravity = 0.0005;
  float Force;
  

  Enemies(int xo, int yo, int xb, int yb, int sb, int len, float vel,int r, int g, int b) {

    Origin.x = xo;
    Origin.y = yo;
    Bob.x = xb;
    Bob.y = yb;
    SizeCircle = sb;
    AngleV = vel;
    
    Angle = (PI/4);
    Len = len;

    stroke(r, g, b);//core da linha em escala de cinza
    strokeWeight(6);//grossura das linhas
    fill(r, g, b);//preenchimento
  }
  
  Enemies(int x1, int y1, int x2, int y2, int x3, int y3){    
    triangle(x1, y1, x2, y2, x3, y3);
  }

  void update() {
    render();
    
    if (Force > 2){
    Force = 1;
    }
    
    /*
    if (AngleA > 200 || AngleA < 340){
    AngleA = 1;
    } */
    
        
    if (AngleV > 20){
    AngleV = 1;
    }
    
    Force = Gravity * sin(Angle);
    AngleA = -1 * Force;
    
    Angle += AngleV;
    AngleV += AngleA;
    
    Bob.x = Len * sin(Angle) + Origin.x;
    Bob.y = Len * cos(Angle)+ Origin.y;
    
  }
  
  public PVector getPos() {
    return Bob;
  }
 
    
  void render(){
    line(Origin.x, Origin.y, Bob.x, Bob.y);//(xi,yi,xf,yf)
    circle(Bob.x, Bob.y, SizeCircle);//(x,y,size)
  }
  
  
}

  
  
