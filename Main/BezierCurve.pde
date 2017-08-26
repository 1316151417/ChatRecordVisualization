public class BezierCurve {
  private float bezierCurve_x1;
  private float bezierCurve_y1;
  private float bezierCurve_x2;
  private float bezierCurve_y2;
  private float bezierCurve_x3;
  private float bezierCurve_y3;
  private float bezierCurve_x4;
  private float bezierCurve_y4;
  private Color bezierCurve_color;
  private BezierPoint bezierCurve_bezierPoint;
  float randomX;
  float randomY;
  public BezierCurve() {
  }
  public BezierCurve(float bezierCurve_x1, float bezierCurve_y1,float bezierCurve_x4, float bezierCurve_y4,
      Color bezierCurve_color) {
    randomX = (bezierCurve_x1 + bezierCurve_x4)/2 + random(-50,50);
    randomY = (bezierCurve_y1 + bezierCurve_y4)/2 + random(-50,50);
    this.bezierCurve_x1 = bezierCurve_x1;
    this.bezierCurve_y1 = bezierCurve_y1;
    this.bezierCurve_x2 = randomX;
    this.bezierCurve_y2 = randomY;
    this.bezierCurve_x3 = randomX;
    this.bezierCurve_y3 = randomY;
    this.bezierCurve_x4 = bezierCurve_x4;
    this.bezierCurve_y4 = bezierCurve_y4;
    this.bezierCurve_color = bezierCurve_color;
  }
  public float getBezierCurve_x1() {
    return bezierCurve_x1;
  }
  public void setBezierCurve_x1(float bezierCurve_x1) {
    this.bezierCurve_x1 = bezierCurve_x1;
    if(bezierCurve_bezierPoint != null){
      bezierCurve_bezierPoint.setBezierPoint_x1(bezierCurve_x1);
      float randomX = (bezierCurve_bezierPoint.getBezierPoint_x1() + bezierCurve_bezierPoint.getBezierPoint_x4())/2 + random(-50,50);
      float randomY = (bezierCurve_bezierPoint.getBezierPoint_y1() + bezierCurve_bezierPoint.getBezierPoint_y4())/2 + random(-50,50);
      setBezierCurve_x2(randomX);
      setBezierCurve_y2(randomY);
      setBezierCurve_x3(randomX);
      setBezierCurve_y3(randomY);
      bezierCurve_bezierPoint.setBezierPoint_x2(randomX);
      bezierCurve_bezierPoint.setBezierPoint_y2(randomY);
      bezierCurve_bezierPoint.setBezierPoint_x3(randomX);
      bezierCurve_bezierPoint.setBezierPoint_y3(randomY);
    }
  }
  public float getBezierCurve_y1() {
    return bezierCurve_y1;
  }
  public void setBezierCurve_y1(float bezierCurve_y1) {
    this.bezierCurve_y1 = bezierCurve_y1;
    if(bezierCurve_bezierPoint != null){
      bezierCurve_bezierPoint.setBezierPoint_y1(bezierCurve_y1);
      float randomX = (bezierCurve_bezierPoint.getBezierPoint_x1() + bezierCurve_bezierPoint.getBezierPoint_x4())/2 + random(-50,50);
      float randomY = (bezierCurve_bezierPoint.getBezierPoint_y1() + bezierCurve_bezierPoint.getBezierPoint_y4())/2 + random(-50,50);
      setBezierCurve_x2(randomX);
      setBezierCurve_y2(randomY);
      setBezierCurve_x3(randomX);
      setBezierCurve_y3(randomY);
      bezierCurve_bezierPoint.setBezierPoint_x2(randomX);
      bezierCurve_bezierPoint.setBezierPoint_y2(randomY);
      bezierCurve_bezierPoint.setBezierPoint_x3(randomX);
      bezierCurve_bezierPoint.setBezierPoint_y3(randomY);
    }
  }
  public float getBezierCurve_x2() {
    return bezierCurve_x2;
  }
  public void setBezierCurve_x2(float bezierCurve_x2) {
    this.bezierCurve_x2 = bezierCurve_x2;
  }
  public float getBezierCurve_y2() {
    return bezierCurve_y2;
  }
  public void setBezierCurve_y2(float bezierCurve_y2) {
    this.bezierCurve_y2 = bezierCurve_y2;
  }
  public float getBezierCurve_x3() {
    return bezierCurve_x3;
  }
  public void setBezierCurve_x3(float bezierCurve_x3) {
    this.bezierCurve_x3 = bezierCurve_x3;
  }
  public float getBezierCurve_y3() {
    return bezierCurve_y3;
  }
  public void setBezierCurve_y3(float bezierCurve_y3) {
    this.bezierCurve_y3 = bezierCurve_y3;
  }
  public float getBezierCurve_x4() {
    return bezierCurve_x4;
  }
  public void setBezierCurve_x4(float bezierCurve_x4) {
    this.bezierCurve_x4 = bezierCurve_x4;
    if(bezierCurve_bezierPoint != null){
      bezierCurve_bezierPoint.setBezierPoint_x4(bezierCurve_x4);
      float randomX = (bezierCurve_bezierPoint.getBezierPoint_x1() + bezierCurve_bezierPoint.getBezierPoint_x4())/2 + random(-50,50);
      float randomY = (bezierCurve_bezierPoint.getBezierPoint_y1() + bezierCurve_bezierPoint.getBezierPoint_y4())/2 + random(-50,50);
      setBezierCurve_x2(randomX);
      setBezierCurve_y2(randomY);
      setBezierCurve_x3(randomX);
      setBezierCurve_y3(randomY);
      bezierCurve_bezierPoint.setBezierPoint_x2(randomX);
      bezierCurve_bezierPoint.setBezierPoint_y2(randomY);
      bezierCurve_bezierPoint.setBezierPoint_x3(randomX);
      bezierCurve_bezierPoint.setBezierPoint_y3(randomY);
    }
  }
  public float getBezierCurve_y4() {
    return bezierCurve_y4;
  }
  public void setBezierCurve_y4(float bezierCurve_y4) {
    this.bezierCurve_y4 = bezierCurve_y4;
    if(bezierCurve_bezierPoint != null){
      bezierCurve_bezierPoint.setBezierPoint_y4(bezierCurve_y4);
      float randomX = (bezierCurve_bezierPoint.getBezierPoint_x1() + bezierCurve_bezierPoint.getBezierPoint_x4())/2 + random(-50,50);
      float randomY = (bezierCurve_bezierPoint.getBezierPoint_y1() + bezierCurve_bezierPoint.getBezierPoint_y4())/2 + random(-50,50);
      setBezierCurve_x2(randomX);
      setBezierCurve_y2(randomY);
      setBezierCurve_x3(randomX);
      setBezierCurve_y3(randomY);
      bezierCurve_bezierPoint.setBezierPoint_x2(randomX);
      bezierCurve_bezierPoint.setBezierPoint_y2(randomY);
      bezierCurve_bezierPoint.setBezierPoint_x3(randomX);
      bezierCurve_bezierPoint.setBezierPoint_y3(randomY);
    }
  }
  public Color getBezierCurve_color() {
    return bezierCurve_color;
  }
  public void setBezierCurve_color(Color bezierCurve_color) {
    this.bezierCurve_color = bezierCurve_color;
  }
  public BezierPoint getBezierCurve_bezierPoint(){
    return bezierCurve_bezierPoint;
  }
  public void setBezierCurve_bezierPoint(BezierPoint bezierCurve_bezierPoint){
    this.bezierCurve_bezierPoint = bezierCurve_bezierPoint;
  }
  public float getRandomX(){
    return randomX;
  }
  public float getRandomY(){
    return randomY;
  }
  public void show(){
    noFill();
    stroke(bezierCurve_color.getColor_h(),bezierCurve_color.getColor_r(),bezierCurve_color.getColor_g());
    bezier(bezierCurve_x1,bezierCurve_y1,bezierCurve_x2,bezierCurve_y2,bezierCurve_x3,bezierCurve_y3,bezierCurve_x4,bezierCurve_y4);
    fill(0);
    stroke(0);
  }
}