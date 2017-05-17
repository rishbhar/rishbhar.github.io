TwitterStream twitterStream;
import processing.serial.*; 
import processing.opengl.*;

int radius = 10, directionX = 1, directionY = 0;
int characterDirX =1;
float characterX = 20, characterY = 160, characterSpeed = 80;
float x=1, y=20;


//level up text 
int MAX = 255;
int firstLevelCheck=0;
int momClimbing = 700;
float delay = 500; // 3 seconds
float levelUpSpeed = 1.; 
float levelUpValue = 0.0;
int levelWentUp=0;
int time = 0;
float fade;
int score=0;

float healthValue=300;

String tweetText="";
//variables for the game
float xPos1=3;                      // x Position of the ball
float xPos2=9;                      // x Position of the ball
float xPos3=1;                      // x Position of the ball
float xPos4=11;                      // x Position of the ball
float xPos5=7;                      // x Position of the ball
float xPos6=5;                      // x Position of the ball

float xPosHeart=4;
float xPosClock=6;
float xPosBalloon=8;

int yPos1=-2400;                      // y Position of the first emoji
//int Pos1Flag=0;                    // active flag for 1st emoji

int yPos2=-1110;                      // y Position of the second emoji
//int Pos2Flag=0;                    // active flag for 1st emoji

int yPos3=-3290;                      // y Position of the 3rd emoji
//int Pos3Flag=0;                    // active flag for 1st emoji

int yPos4=-2300;                      // y Position of the 4th emoji
//int Pos4Flag=0;                    // active flag for 1st emoji

int yPos5=-1108;                      // y Position of the 5th emoji
//int Pos5Flag=0;                    // active flag for 1st emoji

int yPos6=-2250;                      // y Position of the 5th emoji
//int Pos6Flag=0;                    // active flag for 1st emoji
 
int yPosHeart=-930; 
int yPosClock=-970;
int yPosBalloon=-970;

int speed=5;                   //How fast is it moving?
int yDir=-1;                    //what direction is the ball going?

int happyIs=0;
int sadIs=0;
int angryIs=0;
int kissIs=0;
int laughIs=0;
int loveIs=0;
int happyScore=0;

int level=0;

int yBarPos=470;

int gameStart=0, gameIntro=0;

int evilAttack=0;
int slowDownSec=0;
int recordSpeed=0;

PImage angryEmojiImage;
PImage angryEmojiLargeImage;
PImage sadEmojiImage;
PImage sadEmojiLargeImage;
PImage happyEmojiImage;
PImage kissEmojiImage;
PImage laughEmojiImage;
PImage cryEmojiImage;
PImage largecryEmojiImage;
PImage evilEmojiImage;
PImage angelEmojiImage;
PImage savedHerImage;
PImage characterDaughterAngryUpImage;

PImage characterImage;
PImage zerohurtcharacterImage;
PImage onehurtcharacterImage;
PImage twohurtcharacterImage;
PImage threehurtcharacterImage;
PImage fourhurtcharacterImage;
PImage fivehurtcharacterImage;
PImage sixhurtcharacterImage;
PImage sevenhurtcharacterImage;
PImage eighthurtcharacterImage;
PImage ninehurtcharacterImage;
PImage tenhurtcharacterImage;
PImage elevenhurtcharacterImage;
PImage twelvehurtcharacterImage;
PImage backgroundImage;

PImage characterDaughterImage;
PImage characterDaughterAngryImage;
PImage characterDaughterSadImage;
PImage heartEmojiImage;
PImage clockEmojiImage;
PImage grayClockEmojiImage;
PImage notGrayClockEmojiImage;
PImage balloonEmojiImage;
PImage grayBalloonEmojiImage;
PImage notGrayBalloonEmojiImage;
PImage twitterLaptop;

//Serial ComPort;

import ddf.minim.*;

AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;
AudioPlayer levelUp;
AudioPlayer healthBarUp;
AudioPlayer gameIntroSound;
AudioPlayer slowDownAudio;
AudioPlayer explosion;
AudioPlayer awwWin;
Minim minim;//audio context

void setup() {     
  size(1100, 900);  
  background(0); 
  //openTwitterStream();
   smooth();
  //fill(0,255,0);               //Makes the ball and text green
  textSize(13);                //Sets the size of our text
  //ended
  fill(0, 0, 0);
  rect(0, 0, width, height);
  minim = new Minim(this);
  
  
  //player1 = minim.loadFile("8bitgamemusic.wav", 2048);
  player1 = minim.loadFile("gameStart.wav", 2048);
  gameIntroSound = minim.loadFile("gameIntro.mp3", 2048);
  levelUp = minim.loadFile("levelup.wav", 2048);
  healthBarUp = minim.loadFile("healthbarup.aiff", 2048);
  slowDownAudio = minim.loadFile("slowdown.mp3", 2048);
  explosion = minim.loadFile("explosion.wav", 2048);
  awwWin = minim.loadFile("aww.wav", 2048);
  //game background music
  
  //game main audio playing
  player1.loop();
 
  
  backgroundImage = loadImage("Level0.png");

  backgroundImage.loadPixels();
for (int i = 0; i < backgroundImage.pixels.length; i++) {
  backgroundImage.pixels[i] = color(0, 90, 102); 
}
backgroundImage.updatePixels();

  //String portName=Serial.list()[2];
  //println(Serial.list());
  //ComPort = new Serial(this, portName,9600);
  //ComPort.bufferUntil('\n');
    
  characterImage = loadImage("character.png"); 
  
   onehurtcharacterImage = loadImage("1hurtcharacter.png");
   twohurtcharacterImage = loadImage("2hurtcharacter.png");
   threehurtcharacterImage = loadImage("3hurtcharacter.png");
   fourhurtcharacterImage = loadImage("4hurtcharacter.png");
   fivehurtcharacterImage = loadImage("5hurtcharacter.png");
   sixhurtcharacterImage = loadImage("6hurtcharacter.png");
   sevenhurtcharacterImage = loadImage("7hurtcharacter.png");
   eighthurtcharacterImage = loadImage("8hurtcharacter.png");
   ninehurtcharacterImage = loadImage("9hurtcharacter.png");
   tenhurtcharacterImage = loadImage("10hurtcharacter.png");
   elevenhurtcharacterImage = loadImage("11hurtcharacter.png");
   twelvehurtcharacterImage = loadImage("12hurtcharacter.png");
   zerohurtcharacterImage = loadImage("0hurtcharacter.png");
   characterDaughterAngryUpImage = loadImage("characterDaughterAngryUp.png");
   savedHerImage = loadImage("savedHer.png");
   
   
  characterDaughterImage = loadImage("characterDaughter.png");
  characterDaughterSadImage = loadImage("characterDaughterSad.png");
  characterDaughterAngryImage = loadImage("characterDaughterAngry.png");
  heartEmojiImage = loadImage("heartemoji.png");
  clockEmojiImage = loadImage("clockemoji.png");
  balloonEmojiImage = loadImage("balloonemoji.png");
  notGrayClockEmojiImage = loadImage("clockemoji.png");
  notGrayBalloonEmojiImage = loadImage("balloonemoji.png");
  grayClockEmojiImage = loadImage("grayclockemoji.png");
  grayBalloonEmojiImage = loadImage("grayballoonemoji.png");
  twitterLaptop = loadImage("twitterLaptop.png");
    
  angryEmojiLargeImage= loadImage("angryemojilarge.png");
  angryEmojiImage = loadImage("angryemoji.png");
   
  sadEmojiLargeImage= loadImage("sademojilarge.png");
  sadEmojiImage = loadImage("sademoji.png");
  
  laughEmojiImage = loadImage("laughemoji.png");
  evilEmojiImage = loadImage("evilemoji.png"); 
  angelEmojiImage = loadImage("angelemoji.png");
  
  kissEmojiImage = loadImage("kissemoji.png");
  
  cryEmojiImage = loadImage("cryemoji.png");
  largecryEmojiImage = loadImage("largecryemoji.png");
  
  happyEmojiImage = loadImage("happyemoji.png");
  
  player4 = minim.loadFile("gamelost1.wav", 2048);
  
  player3 = minim.loadFile("powerDown.mp3", 2048);
  
  player2 = minim.loadFile("powerUp.wav", 2048);
  //gameIntroSound.loop();
     
     
}  
 
 
void draw() {     
  //speed+=1;
  background(backgroundImage);
  fill(0,255,0);
  //tweetText= tweetText.substring(1,3);
  //text(tweetText,50,50,100,100);
  
   //int damage=0;
   
       if(gameIntro==0)
         {
           
         textSize(25);
         text("This is Apoorva",width/2-300, height/2-180,400,30);
         image(characterDaughterImage, width/2-220, height/2 - 90);
         
         text("and her mother, Neelam",width/2-100, height/2-180,400,30);
         image(characterImage, width/2+60, height/2 - 100);
         //image();
         textSize(18);
         fill(0,0,0);
         text("Press RETURN/ENTER key to continue",width/2-190, height/2+200,400,30);
         
         }
         
        if(gameIntro==1)
         {  
         textSize(25);  
         fill(0,255,0);
         text("Apoorva spends a lot of time on social media. She got involved in a heated argument on Twitter.",width/2-250, height/2-350,600,30);
         image(characterDaughterImage, width/2-150, height/2 - 300);
         image(twitterLaptop, width/2+20, height/2 - 270);
         
         text("She got badly involved in an argument, and now does not know how to snap out of it.",30, height/2-130,1100,30);
         image(sadEmojiLargeImage, width/2-260, height/2-50);
         image(angryEmojiLargeImage, width/2-190, height/2-50);
         image(characterDaughterAngryImage, width/2-50, height/2-50);
         image(angryEmojiLargeImage, width/2+120, height/2-50);
         image(sadEmojiLargeImage, width/2+180, height/2-50);
         
         text("#heatedargument #angry #verysad #pottykhalo",width/2-310, height/2+150,600,30);
         
         fill(0,0,0); 
         textSize(18);  
         text("Press RETURN/ENTER key to continue",width/2-170, height/2+300,400,30);
         }
     
         if(gameIntro==2)
         {
         textSize(25);
         text("Guide Neelam to save Apoorva from the vicious circle of arguments.",200, 50,600,100);
         
         // apurva on the right side of the screen
         //image(sadEmojiImage, width-200, 30);
         //image(angryEmojiImage, width-90, 30);
         //image(characterDaughterSadImage, width-150, 70);
         //image(angryEmojiImage, width-200, 150);
         //image(sadEmojiImage, width-90, 150);
         image(characterDaughterAngryUpImage, width-220, 40);
         image(twitterLaptop, width-130, 50);
         text("Apoorva's room",width-220, 110,200,30);
         //ends
         
         image(characterImage, 60, 30);
         
         text("Collect",200, 300,600,100);
         image(happyEmojiImage, 300, 290);
         image(laughEmojiImage, 360, 290);
         image(kissEmojiImage, 420, 290);
         
         
         text("Stay away from",200, 390,600,100);
         image(sadEmojiImage, 400, 380);
         image(angryEmojiImage, 465, 380);
         image(cryEmojiImage, 530, 380);
         
        //text("Help her mother",width/2-100, height/2-180,400,30);
        // image(characterImage, width/2+60, height/2 - 100);
         //image();
         textSize(18);
         fill(0,0,0);
         text("Press RETURN/ENTER to start the game!",width/2-190, height/2+200,400,30);
         
         }
     
  //game start if started
  if(gameStart==1) 
   {  
      

     //clear();
     background(backgroundImage);
     fill(0,255,0);
     
   /*   if(!player1.isPlaying() && slowDownSec==0)
  { player1.rewind();
  player1.play();
  }*/
     //player1.play();
    //background(backgroundImage);
    //int yeah=0, damage=0;
    int damage=0;
    
    
    //if(player.isPlaying()==false)
    //{
    //  player.rewind();
    //  player.play();
    //}
    //tweetText.indexOf("sad");
    //tweetText.indexOf("love");
    //tweetText.indexOf("kiss");
    //tweetText.indexOf("laugh");
    
   
     
  
  
  
  
   if(tweetText.indexOf("happy")>=0 || tweetText.indexOf("HAPPY")>=0 || 
   tweetText.indexOf("HAPPY")>=0 || tweetText.indexOf(":D")>=0)
   happyIs = happyIs+1;
   
   if(tweetText.indexOf("sad")>=0 || tweetText.indexOf(":(")>=0 || 
   tweetText.indexOf("SAD")>=0 || tweetText.indexOf(":'(")>=0)
   sadIs =sadIs+1;
   
   if(tweetText.indexOf("laugh")>=0 || tweetText.indexOf("haha")>=0 ||
   tweetText.indexOf("hahaha")>=0 || tweetText.indexOf("HaHa")>=0 || 
   tweetText.indexOf("HAHA")>=0)
   laughIs = laughIs+1;
   
   if(tweetText.indexOf("kiss")>=0 || tweetText.indexOf("kisses")>=0 || 
   tweetText.indexOf(":*")>=0 || tweetText.indexOf("KISS")>=0 || 
   tweetText.indexOf("KISSES")>=0)
   kissIs = kissIs+1;
   
   if(tweetText.indexOf("love")>=0 || tweetText.indexOf("<3")>=0 || 
   tweetText.indexOf("LOVE")>=0)
   loveIs = loveIs+1;
   
   if(tweetText.indexOf("hate")>=0 || tweetText.indexOf("HATE")>=0 || 
   tweetText.indexOf("angry")>=0 || tweetText.indexOf("ANGRY")>=0 || 
   tweetText.indexOf("PISSED")>=0 || tweetText.indexOf("pissed")>=0)
   angryIs = angryIs+1;
  
    fill(0,255,0);
    textSize(25); 
    //text("#love",width-200,20,150,50);
    
    //image(ladder,width-200,200);
    
     //image(sadEmojiImage, width-200, 30);
     //image(angryEmojiImage, width-90, 30);
     image(characterDaughterAngryUpImage, width-220, 40);
         image(twitterLaptop, width-130, 50);
         text("Apoorva's room",width-220, 110,200,30);
     //image(angryEmojiImage, width-200, 150);
     //image(sadEmojiImage, width-90, 150);
     textSize(20); 
     text("Score - "+score,30, 30,200,30);

    
   
    
    int xPosArray[]={1,3,5,7,9,11};
    int rando=0;
     int xPosPowersArray[]={1,3,5,7,9,11};
    
    if(yPos1==900 || yPos1>900)
    {
      
      rando = (int)random(0,6);
      yPos1=rando*(-2);
      xPos1 = xPosArray[rando];
      xPosArray=trimArray(rando, xPosArray);
      
    }
    
    if(yPos2==900 || yPos2>900)
    {
      
      rando = (int)random(0,5);
      yPos2=rando*(-2);
      xPos2 = xPosArray[rando];
      trimArray(rando, xPosArray);
    }
    
    if(yPos3==900 || yPos3>900)
    {
    
      rando = (int)random(0,5);
      yPos3=rando*(-2);
      xPos3 = xPosArray[rando];
      trimArray(rando, xPosArray);
    }
    
    if(yPos4==900 || yPos4>900)
    {
     rando = (int)random(0,5);
      yPos4=rando*(-2);
      xPos4 = xPosArray[rando];
      trimArray(rando, xPosArray);
    }
    
    if(yPos5==900 || yPos5>900)
    {
      rando = (int)random(0,5);
       yPos5=rando*(-2);
      xPos5 = xPosArray[rando];
      trimArray(rando, xPosArray);
    }
    
    if(yPos6==900 || yPos6>900)
    {
      rando = (int)random(0,5);
       yPos6=rando*(-2);
      xPos6 = xPosArray[rando];
      trimArray(rando, xPosArray);
      
    }
    
    if(yPosHeart==2000 || yPosHeart>2000 )
    {
      rando = (int)random(0,5);
       yPosHeart=rando*(-2); 
       xPosHeart = xPosPowersArray[rando];
       trimArray(rando, xPosPowersArray);
      
    }
    
    if(yPosClock==1800 || yPosClock>1800 )
    {
      rando = (int)random(0,5);
       yPosClock=rando*(-2); 
       xPosClock = xPosPowersArray[rando];
       trimArray(rando, xPosPowersArray);
      
    }
    
    if(yPosBalloon==2200 || yPosBalloon>2200 )
    {
      rando = (int)random(0,5);
       yPosBalloon=rando*(-2); 
      yPosBalloon = xPosPowersArray[rando];
       trimArray(rando, xPosPowersArray);
      
    }
    
    
    
    //if(yPos4>110)    
    //{
      
      //if(angryIs==1)
        //   {  
               
              //if(level>0)
             // {
               
                image(sadEmojiLargeImage,(xPosHeart*70),yPos5);
              yPos5=yPos5-((speed-4)*yDir);  
              
              image(heartEmojiImage,(xPosHeart*80),yPosHeart);
              yPosHeart=yPosHeart-((speed-4)*yDir);

             
              //}
              
              if(level==0)
              {
                fill(255,255,0);
               rect(width-230,630,210,210);
                fill(0,0,0);
                 image(heartEmojiImage,width-160,700);
               text("Level - 1",width-170, 800,200,30);
               
                fill(170,170,170);
               rect(width-230,420,210,210);
                fill(0,0,0);
                image(grayBalloonEmojiImage,width-160,470);
               text("Level - 2",width-170, 590,200,30);
               
                fill(170,170,170);
               rect(width-230,210,210,210);
                fill(0,0,0);
                  image(grayClockEmojiImage,width-160,270);
               text("Level - 3",width-170, 380,200,30);
               
              }
              else if(level==1)
              {
                 fill(0,255,0);
               rect(width-230,630,210,210);
                fill(0,0,0);
                 image(heartEmojiImage,width-160,700);
               text("Level - 1",width-170, 800,200,30);
               
                fill(255,255,0);
               rect(width-230,420,210,210);
                fill(0,0,0);
                image(notGrayBalloonEmojiImage,width-160,470);
               text("Level - 2",width-170, 590,200,30);
               
                fill(170,170,170);
               rect(width-230,210,210,210);
                fill(0,0,0);
                  image(grayClockEmojiImage,width-160,270);
               text("Level - 3",width-170, 380,200,30);
               
              }
              else if(level==2)
              {
                 fill(0,255,0);
               rect(width-230,630,210,210);
                fill(0,0,0);
                 image(heartEmojiImage,width-160,700);
               text("Level - 1",width-170, 800,200,30);
               
                fill(0,255,0);
               rect(width-230,420,210,210);
                fill(0,0,0);
                image(notGrayBalloonEmojiImage,width-160,470);
               text("Level - 2",width-170, 590,200,30);
               
                fill(255,255,0);
               rect(width-230,210,210,210);
                fill(0,0,0);
                  image(notGrayClockEmojiImage,width-160,270);
               text("Level - 3",width-170, 380,200,30);
               
              }
              else if(level==3)
              {
                 fill(0,255,0);
               rect(width-230,630,210,210);
                fill(0,0,0);
                 image(heartEmojiImage,width-160,700);
               text("Level - 1",width-170, 800,200,30);
               
                fill(0,255,0);
               rect(width-230,420,210,210);
                fill(0,0,0);
                image(notGrayBalloonEmojiImage,width-160,470);
               text("Level - 2",width-170, 590,200,30);
               
                fill(0,255,0);
               rect(width-230,210,210,210);
                fill(0,0,0);
                  image(notGrayClockEmojiImage,width-160,270);
               text("Level - 3",width-170, 380,200,30);
  
              }
              
              
              
              if(level==3)
              {
                 noFill();
                 stroke(0,255,0);
                 if(millis()%(2*delay)<delay)                 
                 rect(width-230,20,210,190);
              }
              
              
              
              if(level>1)
              {
              image(clockEmojiImage,(xPosClock*60),yPosClock);
              yPosClock=yPosClock-((speed-4)*yDir);
              }
              
              if(level>0)
              {
             
              image(balloonEmojiImage,(xPosBalloon*70),yPosBalloon);
              yPosBalloon=yPosBalloon-((speed-4)*yDir);
              }
             
              if((int)(xPos6%3)==0 || (int)(xPos6%3)==2)
              image(angryEmojiImage,(xPos6*70),yPos6);
              else if((int)(xPos6%3)==1)
              image(angryEmojiLargeImage,(xPos6*70),yPos6);
              yPos6=yPos6-(speed*yDir);
              
          // }
            
            
      
     //  if(sadIs==1)
       //    {  
              //if((int)(xPos5%3)==1)
              image(sadEmojiLargeImage,(xPos5*70),yPos5);
             // else if((int)(xPos5%3)==0 || (int)(xPos5%3)==2)
              //image(sadEmojiImage,(xPos5*70),yPos5);
              yPos5=yPos5-((speed-4)*yDir);  
          // }
     //}
     
     
    
    //if(yPos3>110)    
    //{
      // if(laughIs>0)
        //    {  
                if(xPos4%3==0 || xPos4%3==2)
              image(laughEmojiImage,(xPos4*70),yPos4);
               else if(xPos4%3==1)
                image(evilEmojiImage,(xPos4*70),yPos4);
              yPos4=yPos4-(speed*yDir);  
          //  }
     //}
    
    
    
    
    //if(yPos2>110)    
    //{
   // if(kissIs>0)
     //   {  
          if(xPos3%3==1)
          image(cryEmojiImage,(xPos3*70),yPos3);
          else if(xPos3%3==0 || xPos3%3==2)
          image(largecryEmojiImage,(xPos3*70),yPos3);
          yPos3=yPos3-(speed*yDir);  
          
       // }
     //}
    
    
    
    
    //if(yPos1>110)    
    //{
         //  if(loveIs>01)
        //{  
           if(xPos2%3==1)
          image(kissEmojiImage,(xPos2*70),yPos2);
         // else if((xPos2%3==0 || xPos2%3==2) && healthValue<200)
         // image(angelEmojiImage,(xPos2*70),yPos2);
          yPos2=yPos2-(speed*yDir);
          
       // }
    //}
    
     
    
    
    //text(tweetText,(1*70),yPos1,150,100);
   //if(happyIs>0)
   // {  
      
      image(happyEmojiImage,(xPos1*70),yPos1);
      yPos1=yPos1-(speed*yDir);  
    //}
   
      textSize(20); 
     //text("happy : "+happyIs,width-180,60,150,100);
     //text("love : "+loveIs,width-180,100,150,100);
     //text("laugh : "+laughIs,width-180,140,150,100);
     //text("sad : "+sadIs,width-180,180,150,100);
     //text("kiss : "+kissIs,width-180,220,150,100);Skype
     fill(0,0,0);
     stroke(10);
     line(width-250,0,width-250,height);
     fill(255,255,255);
     text("Level - "+(level+1),width-470,70,200,40);
     
    
     
     fill (color(0,0, 225));
     rect(width-470,30,180,30); // the Level bar
     
     
     if(((10+(happyScore*5))/180)>0)
      {
     // level += 1;
      
      
      
      yPos1=-7080;
      yPos2=-6750;
      yPos4=-3180;
      yPos3=-2900;
      yPos5=-4000;
      yPos6=-5870;
      yPosBalloon=-6910;

      momClimbing-=200;
      
      if(level==4)
      gameStart=2;
      else
      levelWentUp=1;
      
      if(slowDownSec!=0)
        {
          recordSpeed+=1;
        }
        else
      speed+=1;
      
      levelUp.play();
      levelUp.rewind();
      }
      
      //level up
      if(levelWentUp==1)
      {     
          //if (fade!=0)
          //{
          textSize(70);  
          levelUpValue+=levelUpSpeed;
          fade = ((sin(radians(levelUpValue))+1)/3)*MAX;
          fill(255, fade);
          
          if(level<3)
          text("Level - "+(level+1),width/2-250, height/2);
          else if(level==3)
          text("Apoorva's Room",width/2-350, height/2);
          
          
          textSize(25);
          if(level==1)
          text("Collect balloons to clear the sky.",width/2-270, height/2+40);
          else if(level==2)
          text("Collect clocks to slow the time.",width/2-270, height/2+40);
          else if(level==3)
          text("Almost there. Save Apoorva!",width/2-300, height/2+40);
          
          
          if(fade==0){
          levelWentUp=0;fade=1;
          }
          //}
          
      }
      
      if(firstLevelCheck==0)
      {     
          
          textSize(70);  
         levelUpValue+=levelUpSpeed;
          fade = ((sin(radians(levelUpValue))+1)/3)*MAX;
          fill(255, fade);
          
          text("Level - "+(level+1),width/2-250, height/2);
          
          textSize(25);
           text("Collect hearts for power ups.",width/2-270, height/2+40);
           if(fade==0){
          firstLevelCheck=1;fade=1;
          }
      }
      
      move();
      
      //fill (color(225, 225, 0));
      //if(level>0)
      //{
      
      //   if(healthValue<70)
      //  {image(twelvehurtcharacterImage,characterX, height-characterY-(level*120));}
      //  else if(healthValue<90)
      //  {image(elevenhurtcharacterImage,characterX, height-characterY-(level*120));}
      //   else if(healthValue<110)
      //  {image(tenhurtcharacterImage,characterX, height-characterY-(level*120));}
      //    else if(healthValue<130)
      //  {image(ninehurtcharacterImage,characterX, height-characterY-(level*120));}
      //  else if(healthValue<150)
      //  {image(eighthurtcharacterImage,characterX, height-characterY-(level*120));}
      //  else if(healthValue<160)
      //  {image(sevenhurtcharacterImage,characterX, height-characterY-(level*120));}
      //  else if(healthValue<180)
      //  {image(sixhurtcharacterImage,characterX, height-characterY-(level*120));}
      //  else if(healthValue<200)
      //  {image(fivehurtcharacterImage,characterX, height-characterY-(level*120));}
      //  else if(healthValue<220)
      //  {image(fourhurtcharacterImage,characterX, height-characterY-(level*120));}
      //  else if(healthValue<240)
      //  {image(threehurtcharacterImage,characterX, height-characterY-(level*120));}
      //  else if(healthValue<260)
      //  {image(twohurtcharacterImage,characterX, height-characterY-(level*120));}
      //  else if(healthValue<280)
      //  {image(onehurtcharacterImage,characterX, height-characterY-(level*120));}
      //  else
      //  image(characterImage,characterX, height-characterY-(level*120));
      //}
      //else if(level==0)
      //{
      //  if(healthValue<70)
      //  {image(twelvehurtcharacterImage,characterX, height-characterY);}
      //  else if(healthValue<90)
      //  {image(elevenhurtcharacterImage,characterX, height-characterY);}
      //   else if(healthValue<110)
      //  {image(tenhurtcharacterImage,characterX, height-characterY);}
      //    else if(healthValue<130)
      //  {image(ninehurtcharacterImage,characterX, height-characterY);}
      //  else if(healthValue<150)
      //  {image(eighthurtcharacterImage,characterX, height-characterY);}
      //  else if(healthValue<160)
      //  {image(sevenhurtcharacterImage,characterX, height-characterY);}
      //  else if(healthValue<180)
      //  {image(sixhurtcharacterImage,characterX, height-characterY);}
      //  else if(healthValue<200)
      //  {image(fivehurtcharacterImage,characterX, height-characterY);}
      //  else if(healthValue<220)
      //  {image(fourhurtcharacterImage,characterX, height-characterY);}
      //  else if(healthValue<240)
      //  {image(threehurtcharacterImage,characterX, height-characterY);}
      //  else if(healthValue<260)
      //  {image(twohurtcharacterImage,characterX, height-characterY);}
      //  else if(healthValue<280)
      //  {image(onehurtcharacterImage,characterX, height-characterY);}
      //  else
      //image(characterImage,characterX, height-characterY);
      //}
      //text("xPos6 : "+xPos6,width-200,100,200,40);
         
        if((10+(happyScore*5))<180)
     rect(width-470,30,10+(happyScore*5),30);
     else
     {rect(width-470,30,10,30);
       happyScore=0;
       
      }

  // draw
  // if(direction==1)
  // rect(x, y, 20, 20);
  fill (color(222, 22, 22)); 
  //ellipse (characterX, height-characterY, radius*2, radius*2);    // body
  
  //image(characterImage,characterX, height-characterY);
  fill (color(22, 82, 22)); 
  //ellipse (characterX-4, characterY-4, 2, 2);  // the eye
  
    if (characterX < (xPosBalloon*60) + 70
  && (xPosBalloon*60) < characterX+ 65
  && (height-characterY-(level*120))< yPosBalloon + 70
  && (height-characterY-(level*120))+ 65 > yPosBalloon)
  {
  explosion.play();score+=50;
    explosion.rewind();
    yPos1=-580;
    yPos2=-750;
    yPos4=-1180;
    yPos3=-900;
    yPos5=-2000;
    yPos6=-870;
  yPosBalloon=910;
 
  //yeah=1;
}
 
  if (characterX < (xPosHeart*60) + 70
  && (xPosHeart*60) < characterX+ 65
  && (height-characterY-(level*120))< yPosHeart + 70
  && (height-characterY-(level*120))+ 65 > yPosHeart)
  {healthValue+=20;score+=100;
  healthBarUp.play();
    healthBarUp.rewind();
  yPosHeart=910;
 
  //yeah=1;
}

if (characterX < (xPosClock*60) + 70
  && (xPosClock*60) < characterX+ 65
  && (height-characterY-(level*120))< yPosClock + 70
  && (height-characterY-(level*120))+ 65 > yPosClock)
  {
  if(slowDownSec==0)  
  recordSpeed=speed;score+=50;
  speed-=5;
  slowDownSec = millis();
  slowDownAudio.play();
    slowDownAudio.rewind();
    player1.pause();
  yPosClock=910;
 
  //yeah=1;
}

if(slowDownSec!=0)
  {
    if(slowDownSec+6000<millis())
    {
      speed=recordSpeed;
      slowDownSec=0;
      player1.play();
    }
  }
  
  if (characterX < (xPos1*60) + 70
  && (xPos1*60) < characterX+ 65
  && (height-characterY-(level*120))< yPos1 + 70
  && (height-characterY-(level*120))+ 65 > yPos1)
  {happyScore+=2;score+=20;
  player2.play();
    player2.rewind();
  yPos1=910;
  //yeah=1;
}

 if (characterX < (xPos2*60) + 70
  && (xPos2*60) < characterX+ 65
  && (height-characterY-(level*120))< yPos2 + 70
  && (height-characterY-(level*120))+ 65 > yPos2)
  {happyScore+=2;score+=20;player2.play();
    player2.rewind();
  yPos2=910;
  //yeah=1;
}


 /*if (characterX < (xPos3*60) + 70
  && (xPos3*60) < characterX+ 65
  && (height-characterY-(level*120))< yPos3 + 70
  && (height-characterY-(level*120))+ 65 > yPos3)
  {happyScore+=1;
  player2.play();
    player2.rewind();
  yPos3=910;
  //yeah=1;
}*/


if(xPos4%3==0 || xPos4%3==2)
  {
   
 if (characterX < (xPos4*60) + 70
  && (xPos4*60) < characterX+ 65
  && (height-characterY-(level*120))< yPos4 + 70
  && (height-characterY-(level*120))+ 65 > yPos4)
  {happyScore+=2;score+=20;
  player2.play();
    player2.rewind();
  yPos4=910;
  //yeah=1;}
  }}
  
   if(xPos4%3==1)
   {
   
 if (characterX < (xPos4*60) + 70
  && (xPos4*60) < characterX+ 65
  && (height-characterY-(level*120))< yPos4 + 30
  && (height-characterY-(level*120))+ 65 > yPos4)
  {healthValue-=80;
    yBarPos+=10;
    damage=1;
    player3.play();
    player3.rewind();
  yPos4=910;
  //evilAttack=1;
  //stop();
  //yeah=1;}
  }}
  
  
if(xPos3%3==0 || xPos3%3==2)
  {
    
   
        if (characterX < (xPos3*(138/2)) + 70
        && (xPos3*(138/2)) < characterX+ 65
        && (height-characterY-(level*120))< yPos3 + 70
        && (height-characterY-(level*120))+ 65 > yPos3)
        {healthValue-=20;
        yBarPos+=20;
        damage=1;
        player3.play();
        player3.rewind();
      yPos3=910;}
        
  
  
 }
   if(xPos3%3==1){ 
    if (characterX < (xPos3*60) + 70
    && (xPos3*60) < characterX+ 65
    && (height-characterY-(level*120))< yPos3 + 70
    && (height-characterY-(level*120))+ 65 > yPos3)
    {healthValue-=10;
    yBarPos+=10;
    damage=1;
     player3.play();
    player3.rewind();
  yPos3=910;}
  
  }  
  
  
              
  if(xPos5%3==0 || xPos5%3==2)
  {
    if (characterX < (xPos5*60) + 70
    && (xPos5*60) < characterX+ 65
    && (height-characterY-(level*120))< yPos5 + 70
    && (height-characterY-(level*120))+ 65 > yPos5)
    {healthValue-=10;
    yBarPos+=10;
    damage=1;
    player3.play();
    player3.rewind();
  yPos5=910;}
 }
   if(xPos5%3==1){ 
     
    
           if (characterX < (xPos5*(138/2)) + 70
          && (xPos5*(138/2)) < characterX+ 65
          && (height-characterY-(level*120))< yPos5 + 70
          && (height-characterY-(level*120))+ 65 > yPos5)
          {healthValue-=20;
          yBarPos+=20;
          damage=1;
           player3.play();
          player3.rewind();
          yPos5=910;}
        
   
  }
  
  
  if(xPos6%3==0 || xPos6%3==2)
  {
      if (characterX < (xPos6*60) + 70
      && (xPos6*60) < characterX+ 65
      && (height-characterY-(level*120))< yPos6 + 70
      && (height-characterY-(level*120))+ 65 > yPos6)
      {healthValue-=10;
      yBarPos+=10;
      damage=1;
        player3.play();
    player3.rewind();
      yPos6=910;
      }
  }
   if(xPos6%3==1)
  {
     
        if (characterX < (xPos6*(138/2)) + 70
        && (xPos6*(138/2)) < characterX+ 65
        && (height-characterY-(level*120))< yPos6 + 70
        && (height-characterY-(level*120))+ 65 > yPos6)
        {healthValue-=20;
        yBarPos+=20;
        player3.play();
        player3.rewind();
        damage=1;yPos6=910;
      }
      
      
      
  }
  
  
  
  if(healthValue-60<=0)
  {
      stop();
  }
  
  
  //fill (color(0,0, 225)); 
  //rect(width-150,460,50,270);
  //fill (color(0, 225, 0)); 
  //rect(width-145,yBarPos,40,(healthValue-50));
  
  
  
  //fill (color(0,0,0)); 
  //text("Emotional Health",width-165,750,100,100);
  fill (color(0,0, 225));
  
   /*if(ComPort.available()>0)
     { 
       String value = ComPort.readStringUntil('\n');
       if(value!=null && value.equals("A\n"))
       {
         
         characterDirX=-10;
         if (!(characterX<(2*radius)))
          {   
             characterX=characterX+10*characterDirX;
          }
       }
       else if(value!=null && value.equals("B\n"))
       {print(value);
        characterDirX=10;
        if (!(characterX>width-(2*radius)))
        {   
            characterX=characterX+10*characterDirX;
        } 
       }
     }*/
  

   }// game start if ended
  
  if(gameStart==2)
  {
         //clear();
         background(backgroundImage);
         fill(0,255,0);
         textSize(25);
         text("You saved her!!",width/2-100, 70,400,30);
         awwWin.play();
         image(savedHerImage, 250, 150);
         //image();
         textSize(18);
         fill(0,0,0);
         score=0;
         text("Press RETURN/ENTER to play again.",width/2-170, height/2+300,400,30);
         
  }
}

void stop()
{
  player1.pause();
  player4.play();
  fill(225,0,0);
  rect(400,400,250,80);
  fill(225,225,225);
  //if(evilAttack==1)
  //text("Evil got you! It's over",width/2-120, height/2 - 20,350,30);
  //else if(evilAttack==0)
  text("You could not save Apoorva :'(",width/2-120, height/2 - 20,500,30);
  gameStart=0;
  fill(0,0,0);
  text("Press RETURN/ENTER key to restart the game",width/2-190, height/2+200,400,60);
  noLoop();
}
 
// Stream iti
void openTwitterStream() {  
 
  ConfigurationBuilder cb = new ConfigurationBuilder();  
   cb.setOAuthConsumerKey("P6r3f5rT9qlZdj85dzv6Q2yCn");
    cb.setOAuthConsumerSecret("y9XsNPfGKW1eglUdMqfKxR4EHaKep9OQspk5FqZBFFkkSYVuPa");
    cb.setOAuthAccessToken("879461929-thY2LDhXblhG494PW1vYsKfC85rgl0Cfvl1OxD40");
    cb.setOAuthAccessTokenSecret("3Fkv9HxZlzGB7RHvOAV4TwMuKrbxt3KIoupvmAlhuOadZ");
 
  TwitterStream twitterStream = new TwitterStreamFactory(cb.build()).getInstance();
 
  FilterQuery filtered = new FilterQuery();
 
  // if you enter words it will use them to filter, otherwise it will sample
  String keywords[] = {
    "#HNDRXX"
  };
 
  filtered.track(keywords);
 
  twitterStream.addListener(listener);
 
  if (keywords.length==0) {
    // sample() method internally creates a thread which manipulates TwitterStream 
    twitterStream.sample(); // and calls these adequate listener methods continuously.
  }
  else { 
    twitterStream.filter(filtered);
    
  }
  println("connected");
} 
 
 
// Implementing StatusListener interface
StatusListener listener = new StatusListener() {
 
  //@Override
  public void onStatus(Status status) {
    System.out.println("@" + status.getUser().getScreenName() + " - " + status.getText());
    tweetText=status.getText();
  }
 
  //@Override
  public void onDeletionNotice(StatusDeletionNotice statusDeletionNotice) {
   // System.out.println("Got a status deletion notice id:" + statusDeletionNotice.getStatusId());
  }
 
  //@Override
  public void onTrackLimitationNotice(int numberOfLimitedStatuses) {
    //System.out.println("Got track limitation notice:" + numberOfLimitedStatuses);
  }
 
  //@Override
  public void onScrubGeo(long userId, long upToStatusId) {
   // System.out.println("Got scrub_geo event userId:" + userId + " upToStatusId:" + upToStatusId);
  }
 
  //@Override
  public void onStallWarning(StallWarning warning) {
  //  System.out.println("Got stall warning:" + warning);
  }
 
  //@Override
  public void onException(Exception ex) {
    ex.printStackTrace();
  }
};


void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      //if (directionX>0) { 
      characterDirX=-1;
      //directionY=0;
      
       if (!(characterX<(2*radius)))
        {   
          if((characterX+characterSpeed*characterDirX)>=20) 
          characterX=characterX+characterSpeed*characterDirX;
        }
      //}
    }
    else if (keyCode == RIGHT)
    {
      //if (directionX<0) {  
      characterDirX=1;
      //directionY=0;
       if (!(characterX>width-(2*radius)))
        {   
          if((characterX+characterSpeed*characterDirX)<=720)
            characterX=characterX+characterSpeed*characterDirX;
        }
      //}
    }
    
    
    //else if (keyCode == UP)
    //{
    //  //if (directionY<0) {
    //  directionY=-1;
    //  directionX=0;
    //  //}
    //}
    //else if (keyCode == DOWN)
    //{
    //  //if (directionY<0) { 
    //  directionY=1;
    //  directionX=0;
    //  //}
    //}
  }
  
  if(key == ENTER)
    {
      if(gameIntro==0)
      gameIntro=1;
      else if(gameIntro==1)
      gameIntro=2;
      else if(gameIntro==2)
      {gameStart=1;
      gameIntro=3;
        //gameIntroSound.close();
        }
        
        
      if(gameStart==0 && gameIntro==3)
      {
        healthValue=300;
        //game reset
         yPos1=-7080;
      yPos2=-6750;
      yPos4=-3180;
      yPos3=-2900;
      yPos5=-4000;
      yPos6=-5870;
      yPosHeart=-2930; 
      yPosClock=-3970;
      yPosBalloon=-4970;
      firstLevelCheck=0;
      score=0;
        happyScore=0;
        gameStart=1;
        yBarPos=470;
        level=0;
        speed=9;
        //clear();
        background(backgroundImage);
        fill(0,255,0);
         if(!player1.isPlaying() && slowDownSec==0)
  { player1.rewind();
  player1.play();
  }
        loop();
      }
      
      if(gameStart==2 && gameIntro==3)
      {
        happyScore=0;
        gameStart=1;
        yBarPos=470;
        level=0;
        speed=9;
        //clear();
         background(backgroundImage);
     fill(0,255,0);
        loop();
      }
        
    }
}

public int[] trimArray(int index, int[] z ){
    if(index > z.length){
        return z;
    } else {
        int[] returnThis = new int[z.length - 1];
        int newIndex = 0;
        for(int i = 0; i < z.length; i++){
            if(i != index){
                returnThis[newIndex] = z[i];
                newIndex++;
            }
        }
        return returnThis; 
    }
}

void move()
{
   fill (color(225, 225, 0));
      if(level>0)
      {
      
         if(healthValue<70)
        {image(twelvehurtcharacterImage,characterX, height-characterY-(level*120));}
        else if(healthValue<90)
        {image(elevenhurtcharacterImage,characterX, height-characterY-(level*120));}
         else if(healthValue<110)
        {image(tenhurtcharacterImage,characterX, height-characterY-(level*120));}
          else if(healthValue<130)
        {image(ninehurtcharacterImage,characterX, height-characterY-(level*120));}
        else if(healthValue<150)
        {image(eighthurtcharacterImage,characterX, height-characterY-(level*120));}
        else if(healthValue<160)
        {image(sevenhurtcharacterImage,characterX, height-characterY-(level*120));}
        else if(healthValue<180)
        {image(sixhurtcharacterImage,characterX, height-characterY-(level*120));}
        else if(healthValue<200)
        {image(fivehurtcharacterImage,characterX, height-characterY-(level*120));}
        else if(healthValue<220)
        {image(fourhurtcharacterImage,characterX, height-characterY-(level*120));}
        else if(healthValue<240)
        {image(threehurtcharacterImage,characterX, height-characterY-(level*120));}
        else if(healthValue<260)
        {image(twohurtcharacterImage,characterX, height-characterY-(level*120));}
        else if(healthValue<280)
        {image(onehurtcharacterImage,characterX, height-characterY-(level*120));}
        else
        image(zerohurtcharacterImage,characterX, height-characterY-(level*120));
      }
      else if(level==0)
      {
        if(healthValue<70)
        {image(twelvehurtcharacterImage,characterX, height-characterY);}
        else if(healthValue<90)
        {image(elevenhurtcharacterImage,characterX, height-characterY);}
         else if(healthValue<110)
        {image(tenhurtcharacterImage,characterX, height-characterY);}
          else if(healthValue<130)
        {image(ninehurtcharacterImage,characterX, height-characterY);}
        else if(healthValue<150)
        {image(eighthurtcharacterImage,characterX, height-characterY);}
        else if(healthValue<160)
        {image(sevenhurtcharacterImage,characterX, height-characterY);}
        else if(healthValue<180)
        {image(sixhurtcharacterImage,characterX, height-characterY);}
        else if(healthValue<200)
        {image(fivehurtcharacterImage,characterX, height-characterY);}
        else if(healthValue<220)
        {image(fourhurtcharacterImage,characterX, height-characterY);}
        else if(healthValue<240)
        {image(threehurtcharacterImage,characterX, height-characterY);}
        else if(healthValue<260)
        {image(twohurtcharacterImage,characterX, height-characterY);}
        else if(healthValue<280)
        {image(onehurtcharacterImage,characterX, height-characterY);}
        else
      image(zerohurtcharacterImage,characterX, height-characterY);
      }
}