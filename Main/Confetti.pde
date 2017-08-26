class Confetti extends Particle{  
  float R = random(255);  
  float G = random(255);  
  float B = random(255);  
  Confetti(PVector l){  
    super(l);  
  }  
  void display(){  
    stroke(R, G, B, lifespan);  
    fill(R,G,B,lifespan);  
    //ellipse(location.x, location.y, 8, 8);  
      
    rect(location.x, location.y, 3, 3);  
  }  
} 