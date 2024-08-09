class PopUp {
  PImage img;
  ArrayList<PVector> positions;
  int phase; // 0: Initial, 1: Replication, 2: Wipe
  int maxImages;
  int imageCounter;
  int timer;
  int delay;
  PApplet p;

  PopUp(PApplet p, String filename, int maxImages, int delay) {
    this.p = p;
    this.img = p.loadImage(filename);
    this.positions = new ArrayList<PVector>();
    this.phase = 0;
    this.maxImages = maxImages;
    this.imageCounter = 0;
    this.timer = 0;
    this.delay = delay;
  }

  void update() {
    if (phase == 0) {
      // Initial pop-up in the middle of the screen
      p.image(img, p.width/2 - img.width/2, p.height/2 - img.height/2);

      // After delay, switch to replication phase
      if (timer > delay) {
        phase = 1;
        timer = 0;
      }
    } else if (phase == 1) {
      // Replication phase: add new positions and draw images
      if (timer % 5 == 0 && imageCounter < maxImages) {
        float x = p.random(p.width - img.width);
        float y = p.random(p.height - img.height);
        positions.add(new PVector(x, y));
        imageCounter++;
      }

      // Draw all images at their positions
      for (PVector pos : positions) {
        p.image(img, pos.x, pos.y);
      }

      // After maximum images, switch to wipe phase
      if (imageCounter >= maxImages) {
        phase = 2;
        timer = 0;
      }
    } else if (phase == 2) {
      // Wipe phase: clear the positions gradually
      if (timer % 5 == 0 && !positions.isEmpty()) {
        positions.remove(0);
      }

      // Draw remaining popups
      for (PVector pos : positions) {
        p.image(img, pos.x, pos.y);
      }

      // If all images are wiped, reset everything
      if (positions.isEmpty()) {
        phase = 0;
        imageCounter = 0;
        timer = 0;
      }
    }

    timer++;
  }
}
