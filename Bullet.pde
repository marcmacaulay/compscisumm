class Bullet {
  Ch character;
  int x;
  int xvel;
  int y;
  int yvel;
  int dir;
  
  Bullet(Ch chara, int xvel) {
    this.character = chara;
    this.xvel = xvel;
    
    this.x = character.x;
    this.y = character.y;
    this.dir= (character.bulletDir == 0) ? 2 : character.bulletDir;
  }
  
  void drawBullet()
  {
    fill(#FF0000);
    rect(x,y,10,10);
  }
  
  void updateVel() {
    x += xvel * (dir / 2);
    y += yvel;
    
  }
  
}