class Button {
  //attrib
  PImage img;
  PVector Pos = new PVector(0, 0);
  float Width = 0;
  float Height = 0;
  color Color;
  color ColorPressed;
  String Text;
  Boolean Pressed = false;
  Boolean Clicked = false;
  Boolean Display = true;
  Boolean Image = false;

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

  Button(PImage img, int x, int y) {

    this.img = img;
    Pos.x = x;
    Pos.y = y;
    Width = img.width;
    Height = img.height;
    Image = true;
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
  
  public void setClicked(boolean a){
    Clicked = a;
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
  
  public void setImg(PImage img){
    this.img = img;
  }


  //methods
  void update() {
    render();
    if (Image == false) {
      if (mousePressed == true && mouseButton == LEFT && Pressed == false) {
        Pressed = true;
        if (mouseX >= Pos.x+(Width/2) && mouseX <= Pos.x+(3*Width/2) && mouseY >= Pos.y+(Height/2)
          && mouseY <= Pos.y+(3*Height/2) && Display == true)
        {
          setColorPressed(0, 200, 200);
          render(ColorPressed);
          Clicked = true;
        } else {
          Clicked = false;
        }  
      }
    } else {
      if (mousePressed == true && mouseButton == LEFT && Pressed == false) {
        Pressed = true;
        if (mouseX >= Pos.x - (Width/2) && mouseX <= Pos.x+Width && mouseY >= Pos.y - (Height/2)
          && mouseY <= Pos.y+Height && Display == true)

        {
          Clicked = true;
          render();
        } else {
          Clicked = false;
        }
      }
    }


    if (mousePressed != true) {
      Pressed = false;
      Clicked = false;
      render();
    }
  }


  void render() {

    if (Display == true) {
      if (Image == false) {
        fill(Color);
        rectMode(CORNER);
        rect(Pos.x+(Width/2), Pos.y+(Height/2), Width, Height);
        fill(0);
        textAlign(CENTER, CENTER);
        text(Text, Pos.x+Width, Pos.y+Height);
      } else {
        imageMode(CENTER);
        image(img, Pos.x, Pos.y);
        imageMode(CORNER);
      }
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
    update();
  }

  void show() {
    Display = true;
  }
}
