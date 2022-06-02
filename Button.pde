class Button {
  //attrib
  PVector Pos = new PVector(0, 0);
  float Width = 0;
  float Height = 0;
  color Color;
  color ColorPressed;
  String Text;
  Boolean Pressed = false;
  Boolean Clicked = false;
  Boolean Display = true;
  
  //constructor
  Button(int x, int y, int w, int h, String t, int r, int g, int b, Boolean bool) {

    Pos.x = x;
    Pos.y = y;
    Width = w;
    Height = h;
    Color = color(r, g, b);
    ColorPressed = color(r, g, b);
    Text = t;
    Display = bool;
  }

  Button(int x, int y, int w, int h, String t, int r, int g, int b) {

    Pos.x = x;
    Pos.y = y;
    Width = w;
    Height = h;
    Color = color(r, g, b);
    Text = t;
    Display = true;
  }

  //Getters and Setters

  public void setColor(int r, int g, int b) {
    Color = color(r, g, b);
  }

  public void setColorPressed(int r, int g, int b) {
    ColorPressed = color(r, g, b);
  }
 public color getColor() {
    return Color;
  }

 public color getColorPressed() {
    return ColorPressed;
  }


  //methods
  void update() {
    render();
    if (mousePressed == true && mouseButton == LEFT && Pressed == false) {
      Pressed = true;
      if (mouseX >= Pos.x+(Width/2) && mouseX <= Pos.x+(3*Width/2) && mouseY >= Pos.y+(Height/2)
        && mouseY <= Pos.y+(3*Height/2) && Display == true)
      {
        setColorPressed(0, 200, 200);
        render(ColorPressed);
        Clicked = true;
        println("Clicou!");
      } else {
        Clicked = false;
        println("Aqui!");
      }
    }

    if (mousePressed != true) {
      Pressed = false;
      render(Color);
    }
  }

  void render() {

    if (Display == true) {
      fill(Color);
      rectMode(CORNER);
      rect(Pos.x+(Width/2), Pos.y+(Height/2), Width, Height);
      fill(0);
      textAlign(CENTER, CENTER);
      text(Text, Pos.x+Width, Pos.y+Height);
    }
  }

  void render(color c) {

    if (Display == true) {
      fill(c);
      rectMode(CORNER);
      rect(Pos.x+(Width/2), Pos.y+(Height/2), Width, Height);
      fill(0);
      textAlign(CENTER, CENTER);
      text(Text, Pos.x+Width, Pos.y+Height);
    }
  }

  boolean isClicked() {
    return Clicked;
  }

  boolean isPressed() {
    return Pressed;
  }

  void hide() {
    Display = false;
    Clicked = false;
    background(bg);
    update();
  }

  void show() {
    Display = true;
  }
}
