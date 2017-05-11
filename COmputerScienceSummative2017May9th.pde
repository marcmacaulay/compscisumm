/*
ISSUE BOARD

- Exceeding 25 bullets crashes program
- Bullets keep going past the edge of the screen












*/

PImage Bernard;
Ch q;  // Main Character
Platform [] one = {new Platform(300, 600, 400), new Platform(200, 500, 113), new Platform(500,500,500), new Platform(600,800,800)};
Level levelOne = new Level(225, 100, 580, 450, one, #35DBFA);
Level[] levelList = {levelOne};
int screen = -1;
int scrollFactor = 0;
int resetValue = 0;
int count = 0;

Bullet[] b = new Bullet[25];

boolean mouseIn (int x, int y, int lx, int ly)
{
  return (mouseX >= x && mouseX <= x + lx && mouseY >= y && mouseY <= y + ly) ? true : false;
}

void setup ()
{
  Bernard = loadImage("Bernard1.png");
  size(1100, 700);
  println("Game res = " + width + " x " + height);
  q = new Ch(50, Bernard);
}

void keyReleased()
{
  if (key == 'a' || key == 'A' || key == 'd' || key == 'D')
    q.lastDir = 0;
  
  if (key == CODED && (keyCode == LEFT || keyCode == RIGHT))
      q.lastDir = 0;
  if (key == 'x' || key == 'X')
    {
      int  i = 0;
      while (b[i] != null) {
        i++;
      }
      
      b[i] = new Bullet(q,5);
      b[i].drawBullet();
    }
}

void mouseReleased ()
{
  if (screen == -1)
    if (mouseIn(0, 0, width, height))
    {
      screen++;
      levelList[screen].start();
    }
}

void draw ()
{
  
  background(#35DBFA); // Display all platforms (should use
  if (screen == -1)
  {
    
  }
  if (screen >= 0)
  {
    levelList[screen].display();
    q.move(levelList[screen].platformList[count]);
    if (count < levelList[screen].platformList.length - 2)
      count++;
    else
      count = 0;
  }
  
  for (int i = 0; i < 25; i++) {
    if (b[i] != null) {
     b[i].drawBullet();
     b[i].updateVel();
     
     if (b[i].x > width) {
      b[i] = null;
    }
    }
    
    
  }
}