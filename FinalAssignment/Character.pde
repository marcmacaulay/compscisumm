class Ch
{
  // Variable Dictionary  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  //
  int x, y, l; // x and y coordinates of the character respectively,   //
  //                plus length of the sides on character's square     //
  color c;  // Colour of character                                     //
  float vx, vy; // x and y velocities of the character                 //
  // -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  //
  
  
  Ch (int x, int y, int l, color c) // Constructor for fully custom Ch
  {                                 // Parameters: Same as described in Variable Dict
    this.l = l;
    this.x = x;
    this.y = y;
    this.c = c;
  }
  
  Ch (int x, int y) // Shortened Ch constructor
  {                 // Parameters: x and y coordinates of square
    this(x, y, 25, #ffffff);
  }
  
  void display ()  // Displays character on the screen
  {                // No parameters, no returned values
    fill(c);
    stroke(c);
    rect(x, y, l, l);
  }
  
  boolean onPlatform(Platform p)  // Checks whether character is on platform p
  {                               // Parameters : p - Platform to check for character
                                  // Returns whether character is on Platform P
    if (x + l / 2 >= p.x && x +  l / 2 <= p.x + p.l)
      if (y + l >= p.y - 2 && y + l <= p.y + 50)
        return true;
      else
        return false;
   else
     return false;
  }
  
  void move (Platform p)  // 
  {
    if (onPlatform(p))
    {
      vy = 0;
      y = p.y;
    }
    else
      vy += 1;
    y += vy;
    if (keyPressed)
      if (key == 'd')
        x += 3;
      else if (key == 'a')
        x -= 3;
  }
   void jump (Platform p)
  {
    if (onPlatform(p))
    {
      vy = 0;
      y = p.y;
    }
    else
      vy += 0.5;
    y += vy;
    if (keyPressed)
      if (key == ' ')
      {
        println("Jump");
        y -= 30;
      }
      
  }
}

 class Bullet 
{
  int x, y;
  
  Bullet()
  {
    this.x = q.x;
    fill(255,0,0);
       rect(x,y,10,10);
       xx=0.1;   
  }
  
  

