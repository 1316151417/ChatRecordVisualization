class MatchDateUtil{
  private String matchString = "^(((20[0-3][0-9]-(0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|(20[0-3][0-9]-(0[2469]|11)-(0[1-9]|[12][0-9]|30))) (20|21|22|23|[0-1][0-9]):[0-5][0-9]:[0-5][0-9])$";
  public String getDateString(String string){
    if(string.length() > 19){
      return string.substring(0,19);
    }else{
      return null;
    }
  }
  public String getStandardDateString(String dateString){
    String standardDateString;
    dateString = dateString.trim();
    if(dateString.length() == 18){
      standardDateString = dateString.substring(0,11) + 0 + dateString.substring(11,18);
    }else{
      standardDateString = dateString;
    }
    return standardDateString;
  }
  public boolean matchStandardDateString(String StandardDateString){
    return (match(StandardDateString,matchString)!=null)?true:false;
  }
}