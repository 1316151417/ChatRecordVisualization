public class BezierPoint {
  private float bezierPoint_x1;
  private float bezierPoint_y1;
  private float bezierPoint_x2;
  private float bezierPoint_y2;
  private float bezierPoint_x3;
  private float bezierPoint_y3;
  private float bezierPoint_x4;
  private float bezierPoint_y4;  
  private float bezierPoint_totalStep;
  private float bezierPoint_nowStep;
  private float bezierPoint_speed;
  public BezierPoint() {
  }
  public BezierPoint(float bezierPoint_x1,float bezierPoint_y1,float bezierPoint_x2,float bezierPoint_y2,float bezierPoint_x3,float bezierPoint_y3,float bezierPoint_x4,float bezierPoint_y4,float bezierPoint_totalStep,float bezierPoint_nowStep,float bezierPoint_speed) {
    this.bezierPoint_x1 = bezierPoint_x1;
    this.bezierPoint_y1 = bezierPoint_y1;
    this.bezierPoint_x2 = bezierPoint_x2;
    this.bezierPoint_y2 = bezierPoint_y2;
    this.bezierPoint_x3 = bezierPoint_x3;
    this.bezierPoint_y3 = bezierPoint_y3;
    this.bezierPoint_x4 = bezierPoint_x4;
    this.bezierPoint_y4 = bezierPoint_y4;
    this.bezierPoint_totalStep = bezierPoint_totalStep;
    this.bezierPoint_nowStep = bezierPoint_nowStep;
    this.bezierPoint_speed = bezierPoint_speed;
  }
  public float getBezierPoint_x1() {
    return bezierPoint_x1;
  }
  public void setBezierPoint_x1(float bezierPoint_x1) {
    this.bezierPoint_x1 = bezierPoint_x1;
  }
  public float getBezierPoint_y1() {
    return bezierPoint_y1;
  }
  public void setBezierPoint_y1(float bezierPoint_y1) {
    this.bezierPoint_y1 = bezierPoint_y1;
  }
  public float getBezierPoint_x2() {
    return bezierPoint_x2;
  }
  public void setBezierPoint_x2(float bezierPoint_x2) {
    this.bezierPoint_x2 = bezierPoint_x2;
  }
  public float getBezierPoint_y2() {
    return bezierPoint_y2;
  }
  public void setBezierPoint_y2(float bezierPoint_y2) {
    this.bezierPoint_y2 = bezierPoint_y2;
  }
  public float getBezierPoint_x3() {
    return bezierPoint_x3;
  }
  public void setBezierPoint_x3(float bezierPoint_x3) {
    this.bezierPoint_x3 = bezierPoint_x3;
  }
  public float getBezierPoint_y3() {
    return bezierPoint_y3;
  }
  public void setBezierPoint_y3(float bezierPoint_y3) {
    this.bezierPoint_y3 = bezierPoint_y3;
  }
  public float getBezierPoint_x4() {
    return bezierPoint_x4;
  }
  public void setBezierPoint_x4(float bezierPoint_x4) {
    this.bezierPoint_x4 = bezierPoint_x4;
  }
  public float getBezierPoint_y4() {
    return bezierPoint_y4;
  }
  public void setBezierPoint_y4(float bezierPoint_y4) {
    this.bezierPoint_y4 = bezierPoint_y4;
  }
  public float getBezierPoint_totalStep() {
    return bezierPoint_totalStep;
  }
  public void setBezierPoint_totalStep(float bezierPoint_totalStep) {
    this.bezierPoint_totalStep = bezierPoint_totalStep;
  }
  public float getBezierPoint_nowStep() {
    return bezierPoint_nowStep;
  }
  public void setBezierPoint_nowStep(float bezierPoint_nowStep) {
    this.bezierPoint_nowStep = bezierPoint_nowStep;
  }
  public void show(){
    float x = bezierPoint(bezierPoint_x1,bezierPoint_x2,bezierPoint_x3,bezierPoint_x4,bezierPoint_nowStep/bezierPoint_totalStep);
    float y = bezierPoint(bezierPoint_y1,bezierPoint_y2,bezierPoint_y3,bezierPoint_y4,bezierPoint_nowStep/bezierPoint_totalStep);
    noStroke();
    fill(random(0,255),random(0,255),random(0,255));
    ellipse(x,y,5,5);
    stroke(0);
    fill(0);
    bezierPoint_nowStep += bezierPoint_speed;
    if(bezierPoint_nowStep>=bezierPoint_totalStep){
      bezierPoint_nowStep=0;
    }
  }
}