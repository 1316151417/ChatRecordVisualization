class Particle{  
  PVector location;               //粒子的位置  
  PVector velocity;               //粒子的速度  
  PVector acceleration;           //粒子的加速度  
  float mass;                     //粒子的质量  
  float lifespan;                 //粒子的生命周期  
    
  float R = random(255);          //粒子的颜色  
  float G = random(255);  
  float B = random(255);  
  //粒子的初始化方式，给定位置的初始化，和随机位置的初始化  
  Particle(){  
    location = new PVector(random(width), random(height));  
    velocity = new PVector(random(-1, 1), random(-2, 0));  
    acceleration = new PVector(0, 0);  
    mass = 1;  
    lifespan = 255;  
  }  
  Particle(PVector l){  
    location = l.get();  
    acceleration = new PVector(0, 0);  
    velocity = new PVector(random(-1, 1),random(-2, 0));  
    mass = 1;  
    lifespan = 255;  
  }  
  void applyForce(PVector force){  
    acceleration.add(PVector.div(force, mass));  
  }  
  void update(){  
    velocity.add(acceleration);  
    location.add(velocity);  
    acceleration.mult(0);  
    lifespan -= 1.0;  
  }  
  void display(){  
    stroke(R,G,B,lifespan);
    fill(R,G,B,lifespan);  
    ellipse(location.x, location.y, 3, 3);  
  }  
  boolean isDead(){  
    if(lifespan < 0.0){  
      return true;  
    }else{  
      return false;  
    }  
  }  
  void run(){  
    update();  
    display();  
  }  
}  