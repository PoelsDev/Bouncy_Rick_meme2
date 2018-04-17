//libraries  
import processing.sound.*;
import processing.video.*;
//import ddf.minim.*;

// enkele constanten:
final int startX = 20;
final int startY = 100;
final int afmeting = 200;
final int imgH = 200;
final int imgW = 150;

// de toestandsvariabelen van het vierkant:
int xRichting = 1;      // naar rechts
int yRichting = -1;     // naar boven
int xpos = startX;
int ypos = startY;
int imgX = xpos;
int imgY = ypos + 27;

//toevoegingen
PImage img;
Movie movie;
//Minim minim;
//AudioPlayer song;
//SoundFile file;

void setup() {
  size(1280,720);
  frameRate(60);
  stroke(255);
  
  img = loadImage("rickastley.png");
  
  movie = new Movie(this,"rick.mp4"); 
  movie.loop();
  
  //minim = new Minim(this);
  //song = minim.loadFile("Never.mp3");
  //song.play();
  
  //file = new SoundFile(this,"Never.mp3");
  //file.play();  
}

void draw() {
  // update toestand
  if(xpos <= 0 || xpos+afmeting >= width) xRichting *= -1;
  if(ypos <= 0 || ypos+afmeting >= height) yRichting *= -1;
  xpos += xRichting;
  ypos += yRichting;
  
  imgX = xpos;
  imgY = ypos + 27;
  
  
  // teken
  clear();
  fill(255);
  image(movie,0,0);
  rect(xpos, ypos, afmeting, afmeting);
  image(img,imgX,imgY,imgH,imgW);  
}

void movieEvent(Movie m) { 
  m.read(); 
} 
