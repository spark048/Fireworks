////////////////////////////
/////21.11.2016
/////Written by Soon Park
/////soonpart@gmail.com
////////////////////////////

// reference: https://www.youtube.com/watch?v=CKeyIbT3vXI

ArrayList<Firework> fireworks;

void setup()
{
  size(1200, 600);
  background(2, 0, 10);
  fireworks = new ArrayList<Firework>();
}

void draw()
{
  fill(2, 0, 10, 20);  // motion blur
  noStroke();
  rect(0, 0, width, height);

  if (random(100) < 30)  // generating rate
  {
    fireworks.add(new Firework());
  }

  // ?not quite sure this part
  for (int i = fireworks.size()-1; i>=0; i--)
  {
    Firework f = fireworks.get(i);
    f.run();
    if (f.done())
    {
      fireworks.remove(i);
    }
  }
}