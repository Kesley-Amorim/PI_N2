import java.util.List;
import java.util.Iterator;
import java.util.ListIterator;
import java.util.Arrays;

static List<PVector> path = new ArrayList();



void mousePressed() {
  if (mousePressed == true) {
    if (mouseButton == LEFT) {
      PVector v = new PVector(mouseX, mouseY);
      path.add(v);
    }
    if (mouseButton == RIGHT) {
      path.forEach(System.out::print);
    }
  }
}

void drawPoints() {
  ListIterator<PVector> path_it = path.listIterator();

  while (path_it.hasNext()) {
    PVector temp = path_it.next();
    circle(temp.x, temp.y, 10);
  }
}

void drawLines(){
  for(int i = 0; i < path.size(); i++){
    if(i>0){
      PVector p1 = path.get(i-1);
      PVector p2 = path.get(i);
     strokeWeight(5);
     line(p1.x,p1.y,p2.x,p2.y);
    }
  }
  strokeWeight(1);
}


void removePoints() {
    if (path.size() > 0) {
      path.remove(getLastPoint());
  }
}

private PVector getLastPoint() {
  return path.size() >= 1 ? (path.get(path.size()-1)) : null;
}

public List<PVector> getLineCoords() {
  if (path.size() >=2) {
    List<PVector> temp = new ArrayList();
    temp.add(path.get(path.size() -2));
    temp.add(path.get(path.size()-1));
    return (temp);
  }
  return null;
}
