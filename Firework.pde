////////////////////////////
/////21.11.2016
/////Written by Soon Park
/////soonpart@gmail.com
////////////////////////////

// reference: https://www.youtube.com/watch?v=CKeyIbT3vXI

class Firework
{
  ArrayList<Particle> particles;  // each small particle
  Particle firework;
  float r, g, b, w;  // to return random color value to Particle class 
  
  Firework()
  {
    r = random(180,255);
    g = random(180,255);
    b = random(180,255);
    w = random(100, 200);
    firework = new Particle(random(width), height, r, g, b, w);  // form bottom of screen and random horisontal
    particles = new ArrayList<Particle>();
  }
  
  boolean done()  // when firework disapears
  {
    if(firework == null && particles.size()==0)
    {
      return true;
    }
    else{
      return false;
    }
  }
  
  void run()
  {
    fill(r, g, b);
    if(firework != null)
    {
      firework.update();
      firework.display();
      
      if(firework.explode()){
        for(int i = 0; i<200; i++)  // draw splashed particles
        {
          particles.add(new Particle(firework.location, r, g, b, w));
        }        
        firework = null;  // firework disapeares
      }
    }
    
    // ?not quite sure this part
    for(int i = particles.size()-1; i>=0; i--)
    {
      Particle p = particles.get(i);
      p.run();
      if(p.isDead())
      {
        particles.remove(i);
      }
    }
  }
}