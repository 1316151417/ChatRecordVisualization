class DateFormatUtil{
  private String formatString = "yyyy-MM-dd HH:mm:ss";
  private DateFormat df = new SimpleDateFormat(formatString);
  public Date getDate(String dateString){
    Date date = null;
    try{
      date = df.parse(dateString);
    }catch(Exception e){
    }
    return date;
  }
  public boolean moreThan(Date date1,Date date2){
    if(date1.getTime() > date2.getTime()){
      return true;
    }else{
      return false;
    }
  }
  public boolean lessThan(Date date1,Date date2){
    if(date1.getTime() < date2.getTime()){
      return true;
    }else{
      return false;
    }
  }
  public String format(Date date){
    return df.format(date);
  }
}