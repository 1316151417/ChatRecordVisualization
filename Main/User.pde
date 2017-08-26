public class User {
  private Integer user_id;
  private String user_name;
  private String user_qqOrEmail;
  private List<Speak> user_speaks = new ArrayList<Speak>();
  private List<At> user_ats = new ArrayList<At>();
  public User() {
  }
  public User(String user_name, String user_qqOrEmail,
      List<Speak> user_speaks, List<At> user_ats) {
    this.user_name = user_name;
    this.user_qqOrEmail = user_qqOrEmail;
    this.user_speaks = user_speaks;
    this.user_ats = user_ats;
  }
  public Integer getUser_id() {
    return user_id;
  }
  public void setUser_id(Integer user_id) {
    this.user_id = user_id;
  }
  public String getUser_name() {
    return user_name;
  }
  public void setUser_name(String user_name) {
    this.user_name = user_name;
  }
  public String getUser_qqOrEmail() {
    return user_qqOrEmail;
  }
  public void setUser_qqOrEmail(String user_qqOrEmail) {
    this.user_qqOrEmail = user_qqOrEmail;
  }
  public List<Speak> getUser_speaks() {
    return user_speaks;
  }
  public void setUser_speaks(List<Speak> user_speaks) {
    this.user_speaks = user_speaks;
  }
  public List<At> getUser_ats() {
    return user_ats;
  }
  public void setUser_ats(List<At> user_ats) {
    this.user_ats = user_ats;
  }
  public boolean equals(User user){
    if(user.getUser_name() != null){
      if(user.getUser_name().equals(user_name)){
        return true;
      }
    }
    if(user.getUser_qqOrEmail() != null){
      if(user.getUser_qqOrEmail().equals(user_qqOrEmail)){
        return true;
      }
    }
    return false;
  }
  public String toString() {
    return "User [user_name=" + user_name
        + ", user_qqOrEmail=" + user_qqOrEmail + ", user_speaks="
        + user_speaks + ", user_ats=" + user_ats + "]";
  }
}