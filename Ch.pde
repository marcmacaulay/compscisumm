class Ch
{
  int x, y, l, lastDir, lives; //       x - x-coordinate of top left of character
                               //       y - y-coordinate of top left of character
                               // lastDir - last direction of character
                               //             2 = right
                               //            -2 = left
                               //   lives - number of lives left
  float vx, vy;  // x and y velocities of character respectively
  boolean onJump = false; // States whether character is currently jumping
  boolean dead = false; // States whether character is dead
  PImage graphics;
  int bulletDir;
  
  Ch (int l, PImage graphics) // Custom constructor
  {
    this.l = l;
    this.graphics = graphics;
  }

  void display () // Displays character
  {
    image(graphics, x, y, l, l);
  }
  
  boolean onPlatform(Platform p) // Checks if character is on top of Platform 'p', returning a boolean value to state whether it is
  {
    if (x + l >= p.x - scrollFactor && x <= p.x + p.l - scrollFactor && y + l >= p.y - 1 && y <= p.y + 50)
      return true;
    else
      return false;
  }
  
  void move (Platform p) // Moves character according to user input and other conditions
  {                      // Parameters: p - Platform which is passed into onJump(), no returns
    if (!dead )
    {
      
      if (onPlatform(p)) // Resets jump and lets character stand when
      {                  // it is on top of a platform
        vy = 0;
        y = p.y - 26;
        onJump = false;
        if (x + l <= 500)
          x += lastDir;
        else
          scrollFactor += lastDir;
      }
      
      vy += (!onPlatform(p)) ? 0.7 : 0; // Accelerates character's vertical component
       
      if (keyPressed) // Receive keyboard input
      {                // and move character accordingly
        if (key == CODED)
        {
          if (keyCode == RIGHT)
          {
            if (x + l > 500)
            {
              x = 500 - l;
              scrollFactor += 4;
            }
            else
              x += 4;
            lastDir = bulletDir = 4;
          }
          else if (keyCode == LEFT)
          {
            if (x < 25)
            {
              x = 25;
              scrollFactor -= 4;
            }
            else
              x -= 4;
            lastDir = bulletDir = -4;
          }
          else if (keyCode == UP && !onJump)
          {
            onJump = true;
            vy = -15;
          }
        }
        else
        {
          if (key == 'd' || key == 'D')
          {
            if (x + l > 500)
            {
              x = 500 - l;
              scrollFactor += 4;
            }
            else
              x += 4;
            lastDir = bulletDir = 4;
          }
          else if (key == 'a' || key == 'A')
          {
            if (x < 25)
            {
              x = 25;
              scrollFactor -= 4;
            }
            else
              x -= 4;
            lastDir = bulletDir = -4;
          }
          else if ((key == 'w' || key == 'W') && !onJump)
          {
            onJump = true;
            vy = -15;
          }
        }
          
         
      }
      
      if (onJump && x + l <= 500)  // Moves x-component of jump parabola
      {
        x += lastDir;
      }
      else if (onJump)
      {
        scrollFactor += lastDir;
      }
      
      
      if (!onPlatform(p)) // Moves y coordinate according to current
        y += vy;          // y-velocity
        
      if (y > height) // Register character as dead if y-coordinate is below
      {               // the bottom of the screen
        dead = true;
        lives--;
      }
        
      this.display();
    } 
    else // Restart level if character has died.
    {
      x = levelList[screen].startX;
      y = levelList[screen].startY;
      dead = false;
      levelList[screen].start();
    }
  }








}