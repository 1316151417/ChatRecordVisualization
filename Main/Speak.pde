public class Speak {
  private Integer speak_id;
  private User speak_user;
  private Date speak_date;
  private String speak_content;
  public Speak() {
    speak_content = "";
  }
  public Speak(User speak_user, Date speak_date,
      String speak_content) {
    this.speak_user = speak_user;
    this.speak_date = speak_date;
    this.speak_content = speak_content;
  }
  public Integer getSpeak_id() {
    return speak_id;
  }
  public void setSpeak_id(Integer speak_id) {
    this.speak_id = speak_id;
  }
  public User getSpeak_user() {
    return speak_user;
  }
  public void setSpeak_user(User speak_user) {
    this.speak_user = speak_user;
  }
  public Date getSpeak_date() {
    return speak_date;
  }
  public void setSpeak_date(Date speak_date) {
    this.speak_date = speak_date;
  }
  public String getSpeak_content() {
    return speak_content;
  }
  public void setSpeak_content(String speak_content) {
    this.speak_content = speak_content;
  }
  public String toString() {
    return "Speak [speak_content:" + speak_content + ", speak_date:" + speak_date + "]";
  }
}