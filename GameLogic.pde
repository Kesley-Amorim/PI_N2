import java.util.List;
import java.util.Iterator;
import java.util.ListIterator;

final static List<PVector> marker = new ArrayList();



void mousePressed() {
  if (mousePressed == true) {
    if (mouseButton == LEFT) {
      PVector v = new PVector(mouseX, mouseY);
      marker.add(v);
    }
    if (mouseButton == RIGHT) {
     marker.forEach(System.out::print);
    }
  }
}

//Bresenham drawline algorithmn
void bresenham(int x1, int y1, int x2, int y2, PImage img) {
  int x, y;
  float m, e, dx, dy;
  x = x1;
  y = y1;
  dx = x2-x1;
  dy = y2-y1;
  m = dy/dx;
  e = m - 0.5;
  println(m, e);
  for (int i = 1; i<=dx; i++) {
    println(x, y);
    PlotarPixelxy(img, x, y);
    while (e > 0) {
      y += 1;
      e -= 1;
    }
    x+=1;
    e+=m;
  }
}


//Generic function to draw pixels in the screen
void PlotarPixelxy(PImage image, int x, int y) {
  int pos = x*image.width + y;
  image.pixels[pos] = color(255, 0, 0);
}

void drawPoints() {
  ListIterator<PVector> marker_it = marker.listIterator();

  while (marker_it.hasNext()) {
    PVector temp = marker_it.next();
    circle(temp.x, temp.y, 10);
  }
}

void removePoints() {
  ListIterator<PVector> marker_it = marker.listIterator();
  if (marker != null) {
    

    while (marker_it.hasNext()) {
      PVector temp = marker_it.next();
      if (mousePressed == true && mouseButton == RIGHT) {
          marker_it.remove();
      }
    }
  }
}
