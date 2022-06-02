import java.util.List;

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
