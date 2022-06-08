class Enemies {

  PVector Origin = new PVector(0, 0);
  PVector Bob = new PVector(0, 0);
  float Angle;
  int Len;
  int SizeCircle;
  float AngleV = 1;
  float AngleA;
  float Gravity = 0.001;
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

  void update() {
    render();
    
    Force = Gravity * sin(Angle);
    AngleA = -1 * Force;
    
    Angle += AngleV;
    AngleV += AngleA;
    
    Bob.x = Len * sin(Angle) + Origin.x;
    Bob.y = Len * cos(Angle)+ Origin.y;
    
  }
  
  void render(){
    line(Origin.x, Origin.y, Bob.x, Bob.y);//(xi,yi,xf,yf)
    circle(Bob.x, Bob.y, SizeCircle);//(x,y,size)
  }

  
}
