//インスタンス化
ArrayList<Point> cluster = new ArrayList<Point>();
ArrayList<Point> seeds = new ArrayList<Point>();

void setup() {
  size(300, 800);
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
  smooth();
  
  int maxCnt = 2; //スタートの数 (-1される)
  int initCnt = 2000; //初期ランダム生成数
  float baseGap = width / maxCnt;  
  
  //初期値、ベース
  for(int i = width / maxCnt; i < width; i += baseGap) {
    cluster.add(new Point( i, height - 10, 300 ) );
  }
  //初期値、タネ
  for(int i = 0; i < initCnt; i ++) {
    seeds.add(new Point( random(width), random(height/2), random(0,50)) );
  }
}

void draw() {
  background(360);
  
  int iteration = 600; //スピードアップ
  
  //ベース、表示
  for(int i = 0; i < cluster.size(); i++) {
    cluster.get(i).show();
  }
  //タネ、表示
  for(int i = 0; i < seeds.size(); i++) {
    seeds.get(i).show();
  }
  //タネ、速く動く
  for(int j = 0; j < iteration; j ++) {
    for(int i = 0; i < seeds.size(); i++) {
      seeds.get(i).walk();
    }
  }
  
  //当たり判定
  for(int i = 0; i < seeds.size(); i++) {
    Point seed = seeds.get(i);
    //シードがクラスターに当たった場合
    if(seed.isCollision (cluster, seed) ) {
      cluster.add(seed); //クラスターに加えて
      seeds.remove(i); //取り除く
    }
  }
}
