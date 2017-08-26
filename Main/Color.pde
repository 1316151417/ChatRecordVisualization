public class Color {
  private float color_h;
  private float color_r;
  private float color_g;
  public Color() {
  }
  public Color(float color_h, float color_r, float color_g) {
    this.color_h = color_h;
    this.color_r = color_r;
    this.color_g = color_g;
  }
  public float getColor_h() {
    return color_h;
  }
  public void setColor_h(float color_h) {
    this.color_h = color_h;
  }
  public float getColor_r() {
    return color_r;
  }
  public void setColor_r(float color_r) {
    this.color_r = color_r;
  }
  public float getColor_g() {
    return color_g;
  }
  public void setColor_g(float color_g) {
    this.color_g = color_g;
  }
}