


class Site {
  private float x;
  private float y;
  private boolean isHighlighted;
  private color c;




  Site(float x, float y) {
    this.x = x;
    this.y = y;
    this.c = color(random(255), random(255), random(255));
  }

  Site(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }

  Site(Site s2) {
    this(s2.x, s2.y, s2.c);
  }



  Site() {
    this.x = random(width);
    this.y = random(height);
    this.c = color(random(255), random(255), random(255));
  }



  float getX() {
    return this.x;
  }

  float getY() {
    return this.y;
  }

  color getColor() {
    if (this.isHighlighted) {
      return color(77, 206, 240);
    }
    return this.c;
  }

  float distFrom(float x, float y) {
    return dist(x, y, this.x, this.y);
  }

  boolean isHighlighted() {
    return this.isHighlighted;
  }

  void setHighlight(boolean b) {
    this.isHighlighted = b;
  }

  void setX(float x) {
    this.x = x;
  }

  void setY(float y) {
    this.y = y;
  }

  void setColor(color c) {
    this.c = c;
  }
  
  
    
  

  String toString() {
    String highlight;
    if (this.isHighlighted) {
      highlight = "highlighted";
    } else {
      highlight = "not highlighted";
    }
    return "(" + this.x + ", " + this.y + ")" + ", r =" + red(this.c) + ", g ="
      + green(this.c) + ", b =" + blue(this.c) + ", " + highlight;
  }
}

// Method to get the nearest Site
Site getNearestSite(float x, float y) {
  Site nearestSite = listSite.get(0);
  float closestDist = Float.MAX_VALUE;
  for (int i = 0; i < listSite.size(); i++) {
    if (dist(listSite.get(i).x, listSite.get(i).y, x, y) < closestDist) {
      nearestSite = listSite.get(i);
      closestDist = dist(listSite.get(i).x, listSite.get(i).y, x, y);
    }
  }
  return nearestSite;
}


void mouseMoved() {
  Site nearestSite = getNearestSite(mouseX, mouseY);
  for (Site s : listSite) {
    s.isHighlighted = false;
  }
  nearestSite.isHighlighted = true;
}

void mouseClicked() {
  if (mouseButton == RIGHT) {
    listSite.add(new Site(mouseX, mouseY));
    
  } else if (mouseButton == LEFT && listSite.size() > 1) {
      
      int indexOfNearestSite = -1;
      float closestDist = Float.MAX_VALUE;
      for (int i = 0; i < listSite.size(); i++) {
        if (dist(listSite.get(i).x, listSite.get(i).y, mouseX, mouseY) < closestDist) {
          indexOfNearestSite = i;
          closestDist = dist(listSite.get(i).x, listSite.get(i).y, mouseX, mouseY);
        }
    }
    listSite.remove(indexOfNearestSite);
    
  }
}
