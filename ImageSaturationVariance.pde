import processing.core.PApplet;
import processing.core.PImage;

  PImage[] img = new PImage[9005];
  float hue;
  static final int hueRange = 360; 
  float saturation;
  float brightness;
  String newName;
  int imageCount;
  String[] list;

  public void setup() {
    File dir = new File("/Users/safinah/Desktop/j");
    String[] list = dir.list();

   /*if (list == null) {
      println("Folder does not exist or cannot be accessed.");
    } 
    else {
      println(list[5]);
    }*/

    size(500,500);
    background(0);
    
for (imageCount = 6000; imageCount < 8000; imageCount++) {
    print(imageCount);
    img[imageCount] = loadImage("/Users/safinah/Desktop/j/" + list[imageCount]);
    colorMode(HSB, (hueRange - 1));
   // extractColorFromImage();
}
  }

  public void draw() {
    for (imageCount = 6000; imageCount < 8000; imageCount++) {
    image(img[imageCount], 0, 0, 640, 480);
    fill(hue, saturation, brightness);
    rect(0, 480, 640, 120);
    
 //   ---
    
    img[imageCount].loadPixels();
    int numberOfPixels = img[imageCount].pixels.length;
    int[] hues = new int[hueRange];
    float[] saturations = new float[hueRange];
    float[] brightnesses = new float[hueRange];

    for (int i = 0; i < numberOfPixels; i++) {
      int pixel = img[imageCount].pixels[i];
      int hue = Math.round(hue(pixel));
      float saturation = saturation(pixel);
      float brightness = brightness(pixel);
      hues[hue]++;
      saturations[hue] += saturation;
      brightnesses[hue] += brightness;
    }

    // Find the most common hue.
    int hueCount = hues[0];
    int hue = 0;
    for (int i = 1; i < hues.length; i++) {
       if (hues[i] > hueCount) {
        hueCount = hues[i];
        hue = i;
      }
    }

    // Set the vars for displaying the color.
    this.hue = hue;
    saturation = saturations[hue] / hueCount;
    brightness = brightnesses[hue] / hueCount;
    println(saturation);
    println(brightness);
    newName = Float.toString(saturation);
  //  print(newName);
  if(img[imageCount].width > 0){
    img[imageCount].resize(500,500);}
    img[imageCount].save("/Users/safinah/Documents/Processing/Variance/data/" + newName + ".jpg");
    exit();
    
    
    }
  }