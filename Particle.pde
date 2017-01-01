////////////////////////////
/////21.11.2016
/////Written by Soon Psark
/////soonpart@gmail.com
////////////////////////////

// reference: https://www.youtube.com/watch?v=CKeyIbT3vXI

class Particle
{
  PVector location, velocity, acceleration;
  float lifespan;  // length before partial disappares after explosion
  boolean seed = false;
  float red, green, blue, white;  // to set random color
  
  Particle(float x, float y, float r, float g, float b, float w)  // before explosion
  {
    location = new PVector(x, y);
    velocity = new PVector(0, random(-8, -4));
    acceleration = new PVector(0, 0.07);  // gravity
    seed = true;  // berore or after explosion
    lifespan = 255.0;
    red = r;
    green = g;
    blue = b;
    white = w;
  }
  
  Particle(PVector l, float r, float g, float b, float w)  // after explosion
  {
    location = l.copy();  // where the rising particle is at explosion
    velocity = PVector.random2D();  // set random vector to splash
    velocity.mult(random(2, 8));  // variety of speed of splash
    acceleration = new PVector(0, 0.07);  // gravity
    lifespan = 255.0;
    red = r;
    green = g;
    blue = b;
  }
  
  void run()
  {
    update();
    display();
  }
  
  boolean explode()
  {
    if(seed && velocity.y>0)  // when rising particle gets top
    {
      lifespan = 0;  // disappare rising particle
      return true;
    }
    return false;
  }
  
  void update()
  {
    velocity.add(acceleration);
    location.add(velocity);
    if(!seed)  // after explosion
    {
      lifespan -= 3;  // fade out after explosion
      velocity.mult(0.95);  // how much splash area
    }
  }
  
  void display()
  {
    if(seed)  // before explosion
    {
      fill(white, lifespan);  // white before explosion
      ellipse(location.x, location.y, random(2,6), 8);  // vertical ellipse to show vertical speed, random to get smoky effect
    }
    else{
      fill(red, green, blue, lifespan);  // random color after explosion
      ellipse(location.x, location.y, random(1,4), random(1,4));  // random to get smoky effect
    }
  }
  
  boolean isDead()  // true when particle gets invisible
  {
    if(lifespan < 0.0)
    {
      return true;
    }
    else{
    return false;
    }
  }
}