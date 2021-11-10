Particle[] c = new Particle[1000];
boolean start = false;

void setup(){
  size (600, 600);
  noStroke();
  for(int i = 0; i < 50; i++)
    c[i] = new OddballParticle();
  for(int i = 50; i < c.length; i++){
    c[i] = new Particle();
  }
}
void draw(){
  background(0);
  for (int i = 0; i < c.length; i++){
    c[i].show();
    c[i].drift();
  }
}

class Particle{
  double myX, myY, mySpeed, myAngle;
  int myColor;
  Particle(){
    myX = width/2;
    myY = height/2;
    myAngle = (double)Math.random()*2*Math.PI;
    mySpeed = (double)Math.random()*10;
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    
  }
  void drift() {
    myX = myX + Math.cos(myAngle)*mySpeed;
      if (myX>950)
        myX = -150;
    myY = myY + Math.sin(myAngle)*mySpeed;
      if(myX > 950)
        myX = -150;
  }
  void show() {
    fill((int)(Math.random()*10)+130, (int)(Math.random()*50)+100, (int)(Math.random()*200)+160, (int)(Math.random()*40)+80);
    ellipse((float)myX, (float)myY, 10, 10);
  }
}

class OddballParticle extends Particle{
  OddballParticle(){
    myX = (int)(Math.random()*100)+300;
    myY = (int)(Math.random()*30)+50;
    myColor = (int)(Math.random()*20)+80;
    mySpeed = 1;
  }
}
