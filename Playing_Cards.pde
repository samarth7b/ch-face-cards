import java.io.File;

JSONArray values;
PImage img, bg;
int index;
java.io.File folder;
String[] filenames;
int fileCount = 0;
int[] hand = {1, 25, 50, 75, 100};
int faceIndex = 0;
int set = 0;

void setup() {

  size(1024, 737);
  bg = loadImage("tsne.png");

  /*values = loadJSONArray("card_palettes.json");

  //for (int i = 0; i < values.size(); i++) {
  for (int i = 0; i < 5; i++) {
    
    JSONObject card = values.getJSONObject(i);
    JSONArray colors = card.getJSONArray("colors");
    
    for (int j = 0; j < colors.size(); j++) {
      String cardColor = colors.getJSONObject(j).getString("color");
      color c = unhex("FF" + cardColor.substring(1, 7));
      
      fill(c);
      rect(i*150, j*50, 100, 50);
    }
  }*/
  
  //img = loadImage("images/0.jpg");
  
  index = 0;
  
  folder = new java.io.File(dataPath("face-cards/"));
  filenames = folder.list();
  fileCount = filenames.length;

  /*for (int i = 1; i < filenames.length; i++) {
    println(filenames[i]);
    img = loadImage("face-cards/" + filenames[i]);
    image(img, i*10, 100, 150, 200);
  }*/
}

void draw() {
  background(bg);
  
  fill(0, 225);
  rect(800, 125, 200, 200);
  
  println(frameCount);
  if (frameCount % 2 == 0) {
    faceIndex = int(random(141));
  }
  img = loadImage("images/" + faceIndex + ".jpg");
  image(img, 825, 150, 150, 150);
  //delay(500);
  
  fill(0, 200);
  rect(0, 350, 1024, 300);
  

  for (int i = 0; i < 5; i++) {
    img = loadImage("face-cards/" + filenames[hand[i]]);
    image(img, 25 + i*200, 400, 150, 200);
  }
}

void keyPressed() {
  if (key == ' ') {

    for (int i = 0; i < 5; i++) {
      hand[i] = int(random(fileCount));
      if(hand[i] == 0) {
        hand[i] = 1;
      }
    }
  }
  /*if (key == 'a') {
    set = (set+1)%2;
    println(set);
    
    if (set == 0) {
    for (int i = 0; i < 5; i++) {
      hand[i] = int(random(fileCount));
      if(hand[i] == 0) {
        hand[i] = 1;
      }
    }
    } else {
      for (int i = 0; i < 5; i++) {
      hand[i] = int(random(fileCount2));
      if(hand[i] == 0) {
        hand[i] = 1;
      }
    }
    }
  }*/
}