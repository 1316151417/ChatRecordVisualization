class UserBasicInfo{
  private String user_name;
  private String user_qqOrEmail;
  public UserBasicInfo() {
  }
  public UserBasicInfo(String user_name, String user_qqOrEmail) {
    this.user_name = user_name;
    this.user_qqOrEmail = user_qqOrEmail;
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
  public String toString() {
    return "UserBasicInfo [user_name=" + user_name
        + ", user_qqOrEmail=" + user_qqOrEmail + "]";
  }
  public boolean equals(UserBasicInfo userBasicInfo){
    if(this.user_name.equals(userBasicInfo.getUser_name()) || this.user_qqOrEmail.equals(userBasicInfo.getUser_qqOrEmail())){
      return true;
    }
    return false;
  }
}