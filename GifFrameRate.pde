import gifAnimation.*;

class GifFrameRate {
  Gif gif;
  int frameCounter;
  int frameDelay;
  PApplet p;
  float width;
  float height;

  GifFrameRate(PApplet p, String filename, int frameDelay, float width, float height) {
    this.p = p;
    this.gif = new Gif(p, filename);
    this.frameCounter = 0;
    this.frameDelay = frameDelay;
    this.width = width;
    this.height = height;
    this.gif.play();
  }

  void updateAndDisplay(float x, float y) {
    // Control frame rate for the GIF
    if (frameCounter % frameDelay == 0) {
      gif.play();
    } else {
      gif.pause();
    }
    frameCounter++;
    p.image(gif, x, y, width, height);
  }

  void setSize(float width, float height) {
    this.width = width;
    this.height = height;
  }
}
