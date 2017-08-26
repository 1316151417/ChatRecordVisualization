import java.util.Iterator;
class ParticleSystem{  
  ArrayList<Particle> particles;            //由粒子链表组成的粒子系统  
  PVector origin;                                 //系统的初始位置  
  float aliveTime;  
  ParticleSystem(PVector location_){  
    origin = location_.get();  
    particles = new ArrayList<Particle>();  
    aliveTime = 255;  
  }  
  void update(){  
    origin = new PVector(mouseX, mouseY);  
  }  
  void update(float x,float y){  
    origin = new PVector(x, y);  
  }
  void addParticle(){                             //添加粒子  
    float Rate = random(1);  
    if(Rate < 0.5)  
      particles.add(new Particle(origin));  
    else  
      particles.add(new Confetti(origin));  
  }  
  void run(){  
    Iterator<Particle> it = particles.iterator();  
    while(it.hasNext()){  
      Particle p = it.next();  
      p.run();  
      if(p.isDead()){  
        it.remove();  
      }  
    }  
    aliveTime -= 1;  
  }  
  boolean isDead(){  
    if(aliveTime <= 0){  
      return true;  
    }else{  
      return false;  
    }  
  }  
  void applyForce(PVector force){           //粒子受到力的作用  
    for(Particle p: particles){  
      p.applyForce(force);  
    }   
  }  
  void applyRepeller(Repeller re){          //粒子受到恒定物体的斥力  
    for(Particle p: particles){  
      PVector force = re.repel(p);  
      p.applyForce(force);  
    }  
  }  
} 