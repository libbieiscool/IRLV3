import gifAnimation.Gif; // Ensure you import the Gif class from the GifAnimation library

class FloatingImage {
  Gif img; // The GIF to be displayed
  float x, y; // Position of the image
  float xSpeed, ySpeed; // Speed of the image

  // Constructor to initialize the GIF and its properties
  FloatingImage(Gif gif, float startX, float startY) {
    img = gif;
    img.play(); // Start playing the GIF

    x = startX;
    y = startY;

    // Randomize initial speed
    xSpeed = random(-3, 2);
    ySpeed = random(-2, 4);
  }

  // Method to update the GIF position
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

  // Method to display the GIF
  void display() {
    image(img, x, y);
  }
}
