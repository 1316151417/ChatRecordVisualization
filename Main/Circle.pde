public class Circle {
  private float circle_x;
  private float circle_y;
  private float circle_radiu;
  private Color circle_color;
  private JSONObject circle_user;
  private List<BezierCurve> circle_bezierCurves = null;
  public Circle() {
  }
  public Circle(float circle_x, float circle_y, float circle_radiu, Color circle_color, JSONObject circle_user) {
    super();
    this.circle_x = circle_x;
    this.circle_y = circle_y;
    this.circle_radiu = circle_radiu;
    this.circle_color = circle_color;
    this.circle_user = circle_user;
  }
  public float getCircle_x() {
    return circle_x;
  }
  public void setCircle_x(float circle_x) {
    this.circle_x = circle_x;
    if(circle_bezierCurves != null){
      for(BezierCurve bezierCurve : circle_bezierCurves){
        bezierCurve.setBezierCurve_x1(circle_x);
      }
    }
  }
  public float getCircle_y() {
    return circle_y;
  }
  public void setCircle_y(float circle_y) {
    this.circle_y = circle_y;
    if(circle_bezierCurves != null){
      for(BezierCurve bezierCurve : circle_bezierCurves){
        bezierCurve.setBezierCurve_y1(circle_y);
      }
    }
  }
  public float getCircle_radiu() {
    return circle_radiu;
  }
  public void setCircle_radiu(float circle_radiu) {
    this.circle_radiu = circle_radiu;
  }
  public Color getCircle_color(){
    return circle_color;
  }
  public void serCircle_color(Color circle_color){
    this.circle_color = circle_color;
  }
  public JSONObject getCircle_user(){
    return circle_user;
  }
  public void setCircle_user(JSONObject circle_user){
    this.circle_user = circle_user;
  }
  public List<BezierCurve> getCircle_bezierCurves(){
    return circle_bezierCurves;
  }
  public void setCircle_bezierCurves(List<BezierCurve> circle_bezierCurves){
    this.circle_bezierCurves = circle_bezierCurves;
  }
  public void show(){
    noStroke();
    fill(circle_color.getColor_h(),circle_color.getColor_r(),circle_color.getColor_g());
    ellipse(circle_x,circle_y,circle_radiu*2,circle_radiu*2);
    fill(0);
    stroke(1);
  }
}