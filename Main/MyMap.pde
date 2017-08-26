public class MyMap<K,V> extends LinkedHashMap<K,V> implements Map<K,V> {
  public boolean containsKey(UserBasicInfo userBasicInfo,LinkedHashMap<UserBasicInfo,User> map) {
    for(UserBasicInfo key : map.keySet()){
      if(userBasicInfo.equals(key)){
        map.get(key).setUser_name(userBasicInfo.getUser_name());
        map.get(key).setUser_qqOrEmail(userBasicInfo.getUser_qqOrEmail());
        List<Speak> user_speaks = map.get(key).getUser_speaks();
        List<At> user_ats = map.get(key).getUser_ats();
        for(int i=0,userSpeaksSize=user_speaks.size();i<userSpeaksSize;i++){
          user_speaks.get(i).getSpeak_user().setUser_name(userBasicInfo.getUser_name());
          user_speaks.get(i).getSpeak_user().setUser_qqOrEmail(userBasicInfo.getUser_qqOrEmail());
        }
        for(int i=0,userAtsSize=user_ats.size();i<userAtsSize;i++){
          user_ats.get(i).getAt_from().setUser_name(userBasicInfo.getUser_name());
          user_ats.get(i).getAt_from().setUser_qqOrEmail(userBasicInfo.getUser_qqOrEmail());
        }
        map.put(userBasicInfo,map.get(key));
        map.remove(key);
        return true;
      }
    }
    return false;
  }
}