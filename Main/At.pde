public class At {
  private Integer at_id;
  private User at_from;
  private User at_to;
  private Date at_date;
  private Integer at_times;
  public At() {
  }
  public At(User at_from, User at_to, Date at_date, Integer at_times) {
    this.at_from = at_from;
    this.at_to = at_to;
    this.at_date = at_date;
    this.at_times = at_times;
  }
  public Integer getAt_id() {
    return at_id;
  }
  public void setAt_id(Integer at_id) {
    this.at_id = at_id;
  }
  public User getAt_from() {
    return at_from;
  }
  public void setAt_from(User at_from) {
    this.at_from = at_from;
  }
  public User getAt_to() {
    return at_to;
  }
  public void setAt_to(User at_to) {
    this.at_to = at_to;
  }
  public Date getAt_date() {
    return at_date;
  }
  public void setAt_date(Date at_date) {
    this.at_date = at_date;
  }
  public Integer getAt_times() {
    return at_times;
  }
  public void setAt_times(Integer at_times) {
    this.at_times = at_times;
  }
  public String toString() {
    return "At [at_from:" + at_from.getUser_name() + ", at_to:" + at_to.getUser_name() + ", at_date:" + at_date + ", at_times:" + at_times + "]";
  }
}