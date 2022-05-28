

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

  void setColor(int r, int g, int b) {
    Color = color(r, g, b);
  }

  void setColorPressed(int r, int g, int b) {
    ColorPressed = color(r, g, b);
  }
  color getColor() {
    return Color;
  }

  color getColorPressed() {
    return ColorPressed;
  }


  //methods
  void update() {
    if (mousePressed == true && mouseButton == LEFT && Pressed == false) {
      Pressed = true;

      if (mouseX >= Pos.x+(Width/2) && mouseX <= Pos.x+(3*Width/2) && mouseY >= Pos.y+(Height/2) && mouseY <= Pos.y+(3*Height/2))
      {
        Clicked = true;
        ColorPressed = color(0, 200, 200);
        println("Clicou!");
        render(ColorPressed);
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
      rect(Pos.x+(Width/2), Pos.y+(Height/2), Width, Height);
      fill(0);
      textAlign(CENTER, CENTER);
      text(Text, Pos.x+Width, Pos.y+Height);
    }
  }

  void render(color c) {

    if (Display == true) {
      fill(c);
      rect(Pos.x+(Width/2), Pos.y+(Height/2), Width, Height);
      fill(0);
      textAlign(CENTER, CENTER);
      text(Text, Pos.x+Width, Pos.y+Height);
    }
  }

  boolean isClicked() {
    return Clicked;
  }

  void hide() {
    Display = false;
    render();
  }

  void show() {
    Display = true;
    render();
  }
}
