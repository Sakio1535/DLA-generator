class Point {
  
  float x, y, hue;
  float r = 5; //半径
  boolean result1 = false; //クラスターとの当たり判定
  boolean result2 = false; //壁との当たり判定
  
  Point(float _x, float _y, float _hue) {
    x = _x;
    y = _y;
    hue = _hue;
  }
  
  void show() {
    fill(hue, 20);
    ellipse(x, y, r, r);
  }
  void walk() {
    PVector vel = PVector.random2D();
    x += vel.x;
    y += vel.y;
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
  }
  
  //当たり判定、引数にはクラスター群とシード
  boolean isCollision(ArrayList<Point> _cluster, Point seed) {
    for(Point cluster : _cluster) {
      float d = dist(seed.x, seed.y, cluster.x, cluster.y);
      if(d < r*1.5) {
         result1 = true;
      }
    } 
    return result1;
  }
}
