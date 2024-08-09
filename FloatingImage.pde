class FloatingImage {
  // THIS WILL GIVE THE ILLUSION OF A CURSOR FLOATING ON THE SCREEN WHEN NOTHING IS HAPPENING

  PImage img; // The image to be displayed
  float x, y; // Position of the image
  float xSpeed, ySpeed; // Speed of the image

  // Constructor to initialize the image and its properties
  FloatingImage(String imgPath, float startX, float startY, int imgWidth, int imgHeight) {
    img = loadImage(imgPath);
    img.resize(imgWidth, imgHeight); // Resize the image

    x = startX;
    y = startY;

    // Randomize initial speed
    xSpeed = random(-4, 7);
    ySpeed = random(-4, 5);
  }

  // Method to update the image position
  void update() {
    x += xSpeed;
    y += ySpeed;

    // Check for collision with the edges of the screen and reverse direction
    if (x < 0 || x > width - img.width) {
      xSpeed *= -1;
    }
    if (y < 0 || y > height - img.height) {
      ySpeed *= -1;
    }
  }

  // Method to display the image
  void display() {
    image(img, x, y);
  }
}
