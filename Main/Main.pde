import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.LinkedHashMap;
import ddf.minim.*;
int width1 = 800;
int width2 = 400;
PImage background;
JSONArray users;
int usersSize;
DateFormatUtil dfu;
JSONObject thisUser;
List<Circle> circles;
float baseRadiu = 5;
float base;
float baseException = 0;
JSONArray user_ats;
float bezierPoint_totalStep = 1000;
float bezierPoint_nowStep = 0;
float bezierPoint_speed;
AudioPlayer player;
Minim minim;
ParticleSystem ps;
void init(){
  background = loadImage("..\\resource\\background.jpg");
  String loadUrl = "D:\\data.json";
  File file = new File(loadUrl);
  if(!file.exists()){
    MyManager mm = new MyManager();
    String importUrl = "..\\resource\\chat.txt";
    String exportUrl = "D:\\data.json";
    mm.exportJson(importUrl,exportUrl);
  }
  users = loadJSONArray(loadUrl);
  dfu = new DateFormatUtil();
  circles = new ArrayList<Circle>();
  
  thisUser = new JSONObject();
  thisUser.setString("user_name","");
  
  thisUser.setString("user_qqOrEmail","");
  
  JSONArray user_speaks = new JSONArray(); 
  JSONObject speak = new JSONObject();
  speak.setString("speak_date","");
  speak.setString("speak_content","");
  user_speaks.setJSONObject(0,speak);
  thisUser.setJSONArray("user_speaks",user_speaks);
  
  JSONArray user_ats = new JSONArray();
  JSONObject at = new JSONObject();
  at.setString("at_to","");
  at.setInt("at_times",0);
  user_ats.setJSONObject(0,at);
  thisUser.setJSONArray("user_ats",user_ats);
  
  usersSize=users.size();
  base = log1point2(150/usersSize+1) - baseException;
  try{
    for(int i=0;i<usersSize;i++){
      Circle newCircle = getNewCircle(i);
      circles.add(newCircle);
    }
  }catch(Exception e){
    baseException++;
    init();
  }
  smooth();
  String musicUrl = "..\\resource\\tttyl.mp3";
  minim = new Minim(this);
  player = minim.loadFile(musicUrl,2048);
  player.play();
  ps = new ParticleSystem(new PVector(mouseX, mouseY));
}
void setup(){
  size(1200,600);
  frameRate(120);
  init();
  println(users.size());
  int ccc = 0;
  int zzc = 0;
  for(int i=0;i<users.size();i++){
    JSONObject jo = users.getJSONObject(i);
    ccc += jo.getJSONArray("user_speaks").size();
    zzc += jo.getJSONArray("user_ats").size();
  }
  println(ccc);
  println(zzc);
}
void draw(){
  background(255);
  image(background,0,0,1300,600);
  showLine();
  showUserInfo();
  showCirclesInfo();
  showParticle();
  mouseAct();
  if(!player.isPlaying()){
    player.loop();
  }
}
void showParticle(){
  ps.run();
}
void showUserInfo(){
  fill(0);
  PFont font = createFont("宋体",25,true);
  textFont(font);
  String title = "用户信息";
  textAlign(CENTER);
  int x = 810;
  text(title,x,10,390,50);
  textAlign(LEFT);
  textSize(15);
  int y = 80;
  String userName  = "用户名:";
  text(userName,x,y);
  text(thisUser.getString("user_name"),x+100,y);
  y += 20;
  String qqOrEmail = "QQ(Email)：";
  text(qqOrEmail,x,y);
  text(thisUser.getString("user_qqOrEmail"),x+100,y);
  y += 20;
  String speaks = "发言记录：";
  text(speaks,x,y);
  y += 20;
  for(int i=0,userSpeaksSize=thisUser.getJSONArray("user_speaks").size();i<userSpeaksSize;i++){
    if(i==9){break;}
    text(thisUser.getJSONArray("user_speaks").getJSONObject(i).getString("speak_date") + "",x,y);
    y += 20;
    text(thisUser.getJSONArray("user_speaks").getJSONObject(i).getString("speak_content"),x,y);
    y += 20;
  }
  String ats = "@过的人：";
  text(ats,x,y);
  y += 20;
  for(int i=0,userAtsSize=thisUser.getJSONArray("user_ats").size();i<userAtsSize;i++){
    if(i==9){break;}
    text("@ " + thisUser.getJSONArray("user_ats").getJSONObject(i).getString("at_to"),x,y);
    text(thisUser.getJSONArray("user_ats").getJSONObject(i).getInt("at_times") +  "次",x+100,y);
    y += 20;
  }
}
void showCirclesInfo(){
  for(Circle circle : circles){
    if(thisUser.equals(circle.getCircle_user()) && circle.getCircle_bezierCurves() != null && !mousePressed){
      for(BezierCurve bezierCurve : circle.getCircle_bezierCurves()){
        bezierCurve.show();
      }
    }
  }
  for(Circle circle : circles){
    circle.show();
  }
  for(Circle circle : circles){
    circle.show();
    if(thisUser.equals(circle.getCircle_user()) && circle.getCircle_bezierCurves() != null && !mousePressed){
      for(BezierCurve bezierCurve : circle.getCircle_bezierCurves()){
        if(bezierCurve.getBezierCurve_bezierPoint() != null){
          bezierCurve.getBezierCurve_bezierPoint().show();
        }
      }
    }
  }
}
void showLine(){
  for(int i=0;i<player.bufferSize()-1;i++){
    stroke(i%250,i%150,i%50);
    strokeWeight(0.5 + abs(player.left.get(i)*10));
    line(800+player.left.get(i)*5,i,800+player.left.get(i+1)*5,i+1);
    strokeWeight(1);
  }
}
void mouseAct(){
  if(mousePressed){
    ps.update(mouseX,mouseY);
    ps.addParticle();
  }
  for(Circle circle1 : circles){
    if(dist(mouseX,mouseY,circle1.getCircle_x(),circle1.getCircle_y()) <= circle1.getCircle_radiu() || dist(pmouseX,pmouseY,circle1.getCircle_x(),circle1.getCircle_y()) <= circle1.getCircle_radiu()){
      if(dist(pmouseX,pmouseY,circle1.getCircle_x(),circle1.getCircle_y()) > circle1.getCircle_radiu() && !mousePressed){
        thisUser = circle1.getCircle_user();
        if(circle1.getCircle_bezierCurves()==null){
          circle1.setCircle_bezierCurves(new ArrayList<BezierCurve>());
          user_ats = thisUser.getJSONArray("user_ats");
          for(int i=0,userAtsSize=user_ats.size();i<userAtsSize;i++){
            for(Circle circle2 : circles){
              if(user_ats.getJSONObject(i).getString("at_to").equals(circle2.getCircle_user().getString("user_name"))){
                BezierCurve bezierCurve = new BezierCurve(circle1.getCircle_x(),circle1.getCircle_y(),circle2.getCircle_x(),circle2.getCircle_y(),circle1.getCircle_color());
                bezierPoint_speed = 3 + user_ats.getJSONObject(i).getInt("at_times")*2;
                BezierPoint bezierCurve_bezierPoint = new BezierPoint(circle1.getCircle_x(),circle1.getCircle_y(),bezierCurve.getRandomX(),bezierCurve.getRandomY(),bezierCurve.getRandomX(),bezierCurve.getRandomY(),circle2.getCircle_x(),circle2.getCircle_y(),bezierPoint_totalStep,bezierPoint_nowStep,bezierPoint_speed);
                bezierCurve.setBezierCurve_bezierPoint(bezierCurve_bezierPoint);
                circle1.getCircle_bezierCurves().add(bezierCurve);
              }
            }
          }
        }
      }
      if(circle1.getCircle_user().getString("user_name").equals(thisUser.getString("user_name")) && mousePressed){
        for(Circle circle2 : circles){
          if(circle2.getCircle_bezierCurves() != null){
            for(BezierCurve bezierCurve : circle2.getCircle_bezierCurves()){
              if(bezierCurve.getBezierCurve_x4() == circle1.getCircle_x() && bezierCurve.getBezierCurve_y4() == circle1.getCircle_y()){
                bezierCurve.setBezierCurve_x4(mouseX);
                bezierCurve.setBezierCurve_y4(mouseY);
              }
            }
          }
        }
        circle1.setCircle_x(mouseX);
        circle1.setCircle_y(mouseY);
      }
    }
  }
}
Circle getNewCircle(int index){
  float circle_x = random(0,width1);
  float circle_y = random(0,width1);
  JSONObject circle_user = users.getJSONObject(index);
  int size = circle_user.getJSONArray("user_speaks").size();
  float circle_radiu = baseRadiu + log2((size+1))*base;
  Color circle_color = new Color(random(0,255-size),random(0,255-size),random(0,255-size));
  Circle newCircle = new Circle(circle_x,circle_y,circle_radiu,circle_color,circle_user);
  if(isStander(newCircle)){
    return newCircle;
  }else{
    return getNewCircle(index);
  }
}
boolean isStander(Circle newCircle){
  if(newCircle.getCircle_x() - newCircle.getCircle_radiu() < 0){
    return false;
  }
  if(newCircle.getCircle_x() + newCircle.getCircle_radiu() > width1){
    return false;
  }
  if(newCircle.getCircle_y() - newCircle.getCircle_radiu() < 0){
    return false;
  }
  if(newCircle.getCircle_y() + newCircle.getCircle_radiu() > height){
    return false;
  }
  for(Circle circle : circles){
    if(dist(circle.getCircle_x(),circle.getCircle_y(),newCircle.getCircle_x(),newCircle.getCircle_y()) <= (circle.getCircle_radiu()+newCircle.getCircle_radiu())){
      return false;
    }
  }
  return true;
}
float log1point2 (float x) {
  return (log(x) / log(1.2));
}
float log2 (float x) {
  return (log(x) / log(2));
}