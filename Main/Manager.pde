class MyManager{
  public void exportJson(String importUrl,String exportUrl){
    String[] txts = loadStrings(importUrl);
    MatchDateUtil mdu = new MatchDateUtil();
    DateFormatUtil dfu = new DateFormatUtil();
  
    String thisState = "find";
    Date thisDate = null;
    Date nextDate = null;
    String dateString = null;
    String standardDateString = null;
  
    User thisUser = null;
    Speak thisSpeak = null;
  
    MyMap<UserBasicInfo,User> usersMap = new MyMap<UserBasicInfo,User>();
    List<At> users_ats = new ArrayList<At>();
    List<Speak> user_speaks = null;
    List<At> user_ats = null;
    
    List<UserBasicInfo> admins = new ArrayList<UserBasicInfo>();
    UserBasicInfo admin1 = new UserBasicInfo("系统消息","10000");
    UserBasicInfo admin2 = new UserBasicInfo("系统消息","1000000");
    admins.add(admin1);
    admins.add(admin2);
    for(int i=0,txtsLength=txts.length;i<txtsLength;i++){
      switch(thisState){
        case "find" : {
          dateString = mdu.getDateString(txts[i]);
          if(dateString == null){
            continue;
          }
          standardDateString = mdu.getStandardDateString(dateString);
          if(mdu.matchStandardDateString(standardDateString)){
            nextDate = dfu.getDate(standardDateString);
            if(thisDate == null || dfu.moreThan(nextDate,thisDate)){
              String user_name = getUser_name(txts[i]);
              String user_qqOrEmail = getUser_qqOrEmail(txts[i]);
              user_speaks = new ArrayList<Speak>();
              user_ats = new ArrayList<At>();
              thisUser = new User(user_name,user_qqOrEmail,user_speaks,user_ats);
              thisSpeak = new Speak();
              
              thisDate = nextDate;
              thisState = "save";
            }
          }
        };
        break;
        case "save" : {
          dateString = mdu.getDateString(txts[i]);
          if(dateString == null){
            dateString = "";
          }
          standardDateString = mdu.getStandardDateString(dateString);
          if(mdu.matchStandardDateString(standardDateString)){
            nextDate = dfu.getDate(standardDateString);
            if(thisDate == null || dfu.moreThan(nextDate,thisDate)){
              thisSpeak.setSpeak_user(thisUser);
              thisSpeak.setSpeak_date(thisDate);
              thisUser.getUser_speaks().add(thisSpeak);
              UserBasicInfo thisUserBasicInfo = new UserBasicInfo(thisUser.getUser_name(),thisUser.getUser_qqOrEmail());
              if(usersMap.containsKey(thisUserBasicInfo,usersMap)){
                usersMap.get(thisUserBasicInfo).getUser_speaks().add(thisSpeak);
              }else{
                boolean p = true;
                for(UserBasicInfo ubi : admins){
                  if(thisUserBasicInfo.equals(ubi)){
                    p = false;
                    break;
                  }
                }
                if(p){
                  usersMap.put(thisUserBasicInfo,thisUser);
                }
              }
              String user_name = getUser_name(txts[i]);
              String user_qqOrEmail = getUser_qqOrEmail(txts[i]);
              user_speaks = new ArrayList<Speak>();
              user_ats = new ArrayList<At>();
              thisUser = new User(user_name,user_qqOrEmail,user_speaks,user_ats);
              thisSpeak = new Speak();
            
              thisDate = nextDate;
            }
          }else{
            thisSpeak.setSpeak_content(thisSpeak.getSpeak_content() + txts[i]);
            List<At> new_ats = getUser_ats(thisUser,thisDate,txts[i]);
            if(new_ats != null){
              if(users_ats == null){
                users_ats = new_ats;
              }else{
                for(At at : new_ats){
                  boolean p = false;
                  for(int ati=0,userAtsSize=users_ats.size();ati<userAtsSize;ati++){
                    if((users_ats.get(ati).getAt_from().equals(at.getAt_from())) && (users_ats.get(ati).getAt_to().equals(at.getAt_to()))){
                      users_ats.get(ati).setAt_times(users_ats.get(ati).getAt_times()+at.getAt_times());
                      p = true;
                      break;
                    }
                  }
                  if(!p){
                    users_ats.add(at);
                  }
                }
              }
            }
          }
        };
        break;
      }
    }
    for(int i=0,usersAtsSize=users_ats.size();i<usersAtsSize;i++){
      boolean p = false;
      if(users_ats.get(i).getAt_from().equals(users_ats.get(i).getAt_to())){
        p = false;
      }else{
        for(User user : usersMap.values()){
          if(users_ats.get(i).getAt_to().getUser_name().equals(user.getUser_name())){
            p = true;
            break;
          }
        }
      }
      if(!p){
        users_ats.remove(i);
        usersAtsSize--;
        i--;
      }
    }
    for(User user : usersMap.values()){
      for(int i=0,usersAtsSize=users_ats.size();i<usersAtsSize;i++){
        if(user.equals(users_ats.get(i).getAt_from())){
          if(user.equals(users_ats.get(i).getAt_to())){
            users_ats.get(i).getAt_to().setUser_name(user.getUser_name());
            users_ats.get(i).getAt_to().setUser_qqOrEmail(user.getUser_qqOrEmail());
          }
          user.getUser_ats().add(users_ats.get(i));
          users_ats.remove(i);
          usersAtsSize--;
          i--;
        }
      }
    }
    JSONArray users = new JSONArray();
    int count = 0;
    for(User mapUser : usersMap.values()){
      JSONObject user = new JSONObject();
      user.setString("user_name",mapUser.getUser_name());
      user.setString("user_qqOrEmail",mapUser.getUser_qqOrEmail());
      JSONArray speaks = new JSONArray();
      List<Speak> mapUserSpeaks = mapUser.getUser_speaks();
      for(int i=0,mapUserSpeaksSize=mapUserSpeaks.size();i<mapUserSpeaksSize;i++){
        JSONObject speak = new JSONObject();
        speak.setString("speak_user",mapUserSpeaks.get(i).getSpeak_user().getUser_name());
        speak.setString("speak_date",dfu.format(mapUserSpeaks.get(i).getSpeak_date()));
        speak.setString("speak_content",mapUserSpeaks.get(i).getSpeak_content());
        speaks.setJSONObject(i,speak);
      }
      user.setJSONArray("user_speaks",speaks);
      JSONArray ats = new JSONArray();
      List<At> mapUserAts = mapUser.getUser_ats();
      for(int i=0,mapUserAtsSize=mapUserAts.size();i<mapUserAtsSize;i++){
        JSONObject at = new JSONObject();
        at.setString("at_from",mapUserAts.get(i).getAt_from().getUser_name());
        at.setString("at_to",mapUserAts.get(i).getAt_to().getUser_name());
        at.setString("at_date",dfu.format(mapUserAts.get(i).getAt_date()));
        at.setInt("at_times",mapUserAts.get(i).getAt_times());
        ats.setJSONObject(i,at);
      }
      user.setJSONArray("user_ats",ats);
      users.setJSONObject(count,user);
      count++;
    }
    saveJSONArray(users,exportUrl);
  }
  private String getUser_name(String txt){
    int txtLength = txt.length();
    String message = txt.substring(19,txtLength);
    message = message.trim();
    String user_name = null;
    if(message.contains("(")){
      user_name = message.substring(0, message.indexOf('('));
    }else if(message.contains("<")){
      user_name = message.substring(0, message.indexOf("<"));
    }
    return user_name;
    }
    private String getUser_qqOrEmail(String txt){
    int txtLength = txt.length();
    String message = txt.substring(19,txtLength);
    message = message.trim();
    int messageLength = message.length();
    String user_qqOrEmail = null;
    if(message.contains("(")){
      user_qqOrEmail = message.substring(message.indexOf('(')+1,messageLength-1);
    }else if(message.contains("<")){
      user_qqOrEmail = message.substring(message.indexOf("<")+1,messageLength-1);
    }
    return user_qqOrEmail;
  }
  private List<At> getUser_ats(User from,Date date,String txt){
    if(!txt.contains("@")){
      return null;
    }
    List<At> user_ats = new ArrayList<At>();
    At at = null;
    String[] splits = txt.split("@");
    for(int i=1,splitsLength=splits.length;i<splitsLength;i++){
      User to = new User();
      int index = splits[i].indexOf(' ');
      if(index == -1){
        index = splits[i].length();
      }
      to.setUser_name(splits[i].substring(0,index));
      at = new At();
      at.setAt_from(from);
      at.setAt_to(to);
      at.setAt_date(date);
      at.setAt_times(1);
      boolean p = false;
      for(int j=0,userAtsSize=user_ats.size();j<userAtsSize;j++){
        if(user_ats.get(j).equals(at)){
          user_ats.get(j).setAt_times(user_ats.get(j).getAt_times()+at.getAt_times());
          p = true;
          break;
        }
      }
      if(!p){
        user_ats.add(at);
      }
    }
    return user_ats;
  }
}