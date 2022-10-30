ArrayList<Site> listSite = new ArrayList<Site>();
void setup() {
  size(800, 600);
 
  for (int i = 0; i < 25; i++) {
    listSite.add(new Site());
  }
  
  for (int i = 0; i < width + 1; i++) {
    for (int j = 0; j <height + 1; j++) {
      Site nearestSite = getNearestSite(i, j);
      set(i, j, nearestSite.getColor());
    }
    
  }
  
  
  updatePixels();
  for(Site s : listSite) {
    strokeWeight(8);
    
    point((int)s.getX(), (int)s.getY());
    fill(0, 0, 0);
  }
  
  
  
  Site s1 = new Site (300.23, 2.345) ; // site at specified location, with random color
  Site s2 = new Site (1.23, 4.56, color (255, 0, 0)); // site with specified location and color
  Site s3 = new Site(s2); // copy constructor: creates a copy of s2
  Site s4 = new Site(); // creates a site with a random location, and random color
  float x = s1.getX();
  float y = s2.getY();
  println(x, y);
  
  color c = s1.getColor();
  println("color", red(c), green(c), blue(c));

  float dist = s1.distFrom(300.0, 200.0) ;
  println("dist of s1 from 300,200", dist);

  println("s3 highlighted?", s3.isHighlighted());
  s3.setHighlight(true);

  println("s3 highlighted?", s3.isHighlighted());
  s3.setHighlight(false);

  println("s3 highlighted?", s3.isHighlighted());

  // toString() should return a string formatted as shown
  println(s1.toString());
  s1.setX(1.0);
  s1.setY(2.0);
  s1.setColor (color(3, 4, 5)) ;

  println(s1);
  println(s2);
  println(s3);
  println(s4);
    
    
}

void draw() {
  mouseMoved();
  mousePressed();
  
  for (int i = 0; i < width + 1; i++) {
    for (int j = 0; j < height + 1; j++) {
      Site nearestSite = getNearestSite(i, j);
      set(i, j, nearestSite.getColor());
    }
    
  }
  
  
  for(Site s : listSite) {
    strokeWeight(40);
    set((int)s.getX(), (int)s.getY(), color(0, 0, 0));
  }
  updatePixels();
  for(Site s : listSite) {
    strokeWeight(8);
    
    point((int)s.getX(), (int)s.getY());
    fill(0, 0, 0);
  }
  
  
  
  
}
