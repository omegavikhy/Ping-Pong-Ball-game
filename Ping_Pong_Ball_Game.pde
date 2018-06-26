PImage start;
PImage end;
float x=width/2;
float y=0;
//float t=320;
float z=320;
//float xspeed=random(-5,10);
//float yspeed=random(-5,10);
float xspeed=2;
float yspeed=2;
float zspeed=25;
int score=0;
int highscore;
int gamestate=0;
void setup()
{
size(640,360);
 start=loadImage("start.png");
 end=loadImage("end.png");
}

void draw()
{
  if(gamestate==1)
  {
  background(0);
  //stroke(255);
  textSize(20);
  text("score:",540,25);
   text(score,600,25);
  x += xspeed;
    y += yspeed;
  if(x>width-12 || x<0)
  {
    xspeed *= -1;
    
  }


  if(y>height-18 || y<0)
  {
    yspeed *= -1;
        }
  stroke(255);
  strokeWeight(2);
  ellipse(x,y,25,25);
 if(x>=z-12 && x<=z+72) 
  {
      if(y>height-20 && y<height-5)
      {
        xspeed *= 1;
         yspeed *= -1;
        score+=1;
        println(z);
        fill(random(255),random(255),random(255));
      }
  }
  stroke(255);
  strokeWeight(2);
  rect(z,height-5,60,5);
 if(y>height-18) //This has to be changed tomorrow
 {
   score-=1;
  }
  }
  
 else if (gamestate==0)
 {
   imageMode(CENTER);
   image(start,width/2,height/2);
   textSize(26);
   text("score:",150,250);
   text(score,250,250);
   text("Best:",150,290);
   text(highscore,250,290);
   }
   
   else if(gamestate==-1)
   {
   imageMode(CENTER);
   image(end,width/2,height/2);
   textSize(26);
   text("Your Score:",100,250);
   text(score,250,250);
   text("Best:",150,290);
   text(highscore,250,290);
   if(score>=highscore)
   {
   highscore=score;
   }  
 }
   
 
}

 
  void mouseClicked() 
   {
     if(mouseButton==LEFT)
     {
       
  gamestate=gamestate+1; 
     }
     else if(mouseButton==RIGHT)
     {
       gamestate=gamestate-2; 
       
     }
}

void keyPressed() 
{
  

  if (key == CODED) 
  {
    if (keyCode == LEFT) 
    {
        z=z-zspeed;
          } 
    else if (keyCode == RIGHT) {
         z=z+zspeed;
         } 
  }
  if(z<0)
  {
    z=0;
  }
  else if(z>width-60)
    {
      z=width-60;
    }
}
