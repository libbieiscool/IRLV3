import gifAnimation.*;

class GifManager {
  Gif[] gifArray;
  float gifWidth;
  float gifHeight;
  float spacing;
  float[] currentTransparencies;
  float[] targetTransparencies;
  float[] initialTransparencies;
  int transitionFrames;
  int currentFrame;
  int[] gifFrameDelays; // Array to store frame delays for each GIF
  int[] gifFrameCounters; // Array to count frames for each GIF

  GifManager(Gif[] gifs, float gifWidth, float gifHeight, float spacing, int transitionFrames, int[] gifFrameDelays) {
    this.gifArray = gifs;
    this.gifWidth = gifWidth;
    this.gifHeight = gifHeight;
    this.spacing = spacing;
    this.transitionFrames = transitionFrames;
    this.currentFrame = 0;
    this.currentTransparencies = new float[gifs.length];
    this.targetTransparencies = new float[gifs.length];
    this.initialTransparencies = new float[gifs.length];
    this.gifFrameDelays = gifFrameDelays;
    this.gifFrameCounters = new int[gifs.length];

    for (int i = 0; i < gifs.length; i++) {
      currentTransparencies[i] = random(10, 255);
      targetTransparencies[i] = currentTransparencies[i];
      initialTransparencies[i] = currentTransparencies[i];
      gifFrameCounters[i] = 0; // Initialize frame counters
    }
  }

  void updateAndDisplay() {
    float x = spacing;
    float y = spacing;

    for (int i = 0; i < gifArray.length; i++) {
      Gif gif = gifArray[i];

      if (x + gifWidth > width) {
        x = spacing;
        y += gifHeight + spacing;
      }

      // Interpolate the transparency value
      if (currentFrame < transitionFrames) {
        float t = (float) currentFrame / transitionFrames;
        currentTransparencies[i] = lerp(initialTransparencies[i], targetTransparencies[i], t);
      }

      tint(255, currentTransparencies[i]); // Set the transparency for this GIF

      // Update the GIF frame based on the frame delay
      if (gifFrameCounters[i] % gifFrameDelays[i] == 0) {
        gif.play();
      } else {
        gif.pause();
      }

      gifFrameCounters[i]++;
      image(gif, x, y, gifWidth, gifHeight);
      noTint(); // Reset tint after drawing

      x += gifWidth + spacing;
    }

    if (currentFrame < transitionFrames) {
      currentFrame++;
    }
  }

  void randomizeTransparency() {
    for (int i = 0; i < targetTransparencies.length; i++) {
      initialTransparencies[i] = currentTransparencies[i];
      targetTransparencies[i] = random(255);
    }
    currentFrame = 0;
  }
}
