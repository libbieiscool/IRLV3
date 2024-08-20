import com.alialhasnawi.twitch.*;
import com.neovisionaries.ws.client.*;
import gifAnimation.*;

PopUp girlTroubleEffect;

FloatingImage floatingCursor;

GifFrameRate butterflyController;
GifManager gifManager;
Gif backgroundGif, girlhood, butterfly, pansy2, flower, hairbrush, cursor,
  background_ass, background_hairTwirl, background_phone, background_typing, background_strong ;

int textMinX = 35;
int textMaxX = 100;
int textMinY = 35;
int textMaxY = 75;


PImage[] testGif;
PImage textBubbles, textBubbleTop, textBubbleBottom ;

int textDisplayStartTime;
int textDisplayDuration = 5000; // Duration in milliseconds (e.g., 5000ms = 5 seconds)

//TWITCH THING
TwitchWebSocket socket = new TwitchWebSocket("zadds_", "oauth:n7spxddxiqcc8z27ke4rzofjkiyfmb");

// Do not touch this string
String tempTwitchChat;
//--- CHAT TRIGGERS

String wCommand = "LUL";
String aCommand = "yay";
String sCommand = "hi";
String dCommand = "love";


// SETUP ----

void setup() {
  tempTwitchChat = "  ";
  textDisplayStartTime = millis(); // Initialize the timer

  size(1280, 720);

  backgroundGif = new Gif(this, "background_main.gif");
  backgroundGif.play();



  //Loading in my 'cursor'
  //floatingImage = new FloatingImage("cursor3.gif", width / 2, height / 2, 80, 80);
  cursor = new Gif(this, "cursor3.gif");
  cursor.play();

  floatingCursor = new FloatingImage(cursor, 100, 100);

  textBubbles =  loadImage("textbbls.png");
  textBubbleTop = loadImage("topText.png");
  textBubbleBottom = loadImage("galGText.png");

  flower = new Gif(this, "smiling-flower.gif");
  flower.play();
  butterfly = new Gif (this, "ButterflyV2.gif");
  butterfly.play();

  // BACKGROUNDS FOR DIFFERENT TRIGGERS
  background_ass = new Gif(this, "background_ass.gif");
  background_ass.play();
  background_hairTwirl = new Gif(this, "background_hairTwirl.gif");
  background_hairTwirl.play();
  background_strong = new Gif(this, "background_strong.gif");
  background_strong.play();
  background_phone = new Gif(this, "background_phone.gif");
  background_phone.play();
  background_typing = new Gif(this, "background_typing.gif");
  background_typing.play();

  //--pansy
  girlhood = new Gif(this, "finalGirl1.gif");
  girlhood.play();

  // //------ PANSY WORLD -----
  pansy2 = new Gif(this, "pansySmall.gif");
  pansy2.play();
  butterfly = new Gif(this, "ButterflyV2.gif");
  butterfly.play();
  butterflyController = new GifFrameRate(this, "ButterflyV2.gif", 3, 150, 150);

  // //--GIRL TROUBLE
  girlTroubleEffect = new PopUp(this, "GrlTrouble2.png", 100, 100);

  // HAIR
  hairbrush= new Gif(this, "Hairbrush.gif");
  hairbrush.play();


  //// --- WHAT TWITCH ARE WE CONNECTED TO ?
  socket.open();
  socket.joinChannel("alveussanctuary");
}

// DRAW ------------------------------------------------------------------------------
void draw() {
  tempTwitchChatLoadIn();
  textSize(20);
  background(255);


   //MAIN IMAGE / IMAGE WHEN NOTHING ELSE IS HAPPENING
  image(backgroundGif, 0, 0, width, height);
  //image(textBubbles, 0,0);
  image(textBubbleTop, 0, 0);
  image(textBubbleBottom, 0, 600);
  floatingCursor.update(); // Update the position
  floatingCursor.display(); // Display the image

  // Start the text position at textMinX and textMinY
  int textX = textMinX;
  int textY = textMinY;

  // Constrain the position within the specified range
  textX = constrain(textX, textMinX, textMaxX);
  textY = constrain(textY, textMinY, textMaxY);

  // Display the text at the constrained position
  if (millis() - textDisplayStartTime < textDisplayDuration) {
    text(tempTwitchChat, textX, textY);
  } else {
    text(tempTwitchChat, textX, textY);  // Draw the text even when not in trigger
  }
  
 //// Calculate the desired text position
 // int desiredTextX = (textMinX + textMaxX) / 2; // Centered horizontally within the range
 // int desiredTextY = textMinY + 20; // A bit below the top of the range

 // // Constrain the position within the specified range
 // int textX = constrain(desiredTextX, textMinX, textMaxX);
 // int textY = constrain(desiredTextY, textMinY, textMaxY);

 // if (millis() - textDisplayStartTime < textDisplayDuration) {
 //   text(tempTwitchChat, textX, textY);
 // } else {
 //   text(tempTwitchChat, textX, textY);  // Draw the text even when not in trigger
 // }

  // //GIRLTROUBLE ON COMPUTER COMBO
  //image(background_typing, 0, 0, width, height);
  // girlTroubleEffect.update();

  // //---PANSY TOWN --- ///
  //image(background_ass, 0, 0, width, height);
  //image(pansy2, 0, 0);
  //image(pansy2, 850, 0);
  //butterflyController.updateAndDisplay(250, 400);
  //butterflyController.updateAndDisplay(860, 350);
  //butterflyController.updateAndDisplay(1000, 500);
  //butterflyController.updateAndDisplay(40, 455);
  //butterflyController.updateAndDisplay(350, 100);
  //butterflyController.updateAndDisplay(750, 100);

  // //---GIRLHOOD 6000
  //image(background_phone, 0, 0, width, height);
  //image(girlhood, 0, 0, 1280, 720);

  // // HAIR WORLD
  //image (background_hairTwirl, 0, 0, width, height);

  ////--------ORIGINAL TRIGGERS NO DISPLAY TIMER----------------------

  if (tempTwitchChat.trim().equals(wCommand) == true) {
    //GIRLTROUBLE ON COMPUTER COMBO
    image(background_typing, 0, 0, width, height);
    girlTroubleEffect.update();
    tempTwitchChat = "   ";
  } else if (tempTwitchChat.trim().equals(sCommand) == true) {
    //---PANSY TOWN --- ///
    image(background_ass, 0, 0, width, height);
    image(pansy2, 0, 0);
    image(pansy2, 850, 0);
    butterflyController.updateAndDisplay(250, 400);
    butterflyController.updateAndDisplay(860, 350);
    butterflyController.updateAndDisplay(1000, 500);
    butterflyController.updateAndDisplay(40, 455);
    butterflyController.updateAndDisplay(350, 100);
    butterflyController.updateAndDisplay(750, 100);

    tempTwitchChat = "   ";
  } else if (tempTwitchChat.trim().equals(aCommand) == true) {
    //---GIRLHOOD 6000
    image(background_phone, 0, 0, width, height);
    image(girlhood, 0, 0, 1280, 720);

    tempTwitchChat = "   ";
  } else if (tempTwitchChat.trim().equals(dCommand) == true) {
    // HAIR WORLD
    image (background_hairTwirl, 0, 0, width, height);

    tempTwitchChat = "   ";
  }
  
  
 
//OG text load in to specific coords
  //text(tempTwitchChat, 35, 35);
}

// Outside ------------------------------------------------------------------------------
//--keep outside the drawloop ;-) its checking for new messages in chat to pull into temp string
void resetTwitchChatTimer() {
  textDisplayStartTime = millis(); // Reset the timer
  tempTwitchChat = "   "; // Optionally reset the chat message to clear it after the duration
}

void tempTwitchChatLoadIn() {
  if (socket.hasMoreMessages()) {
    tempTwitchChat = socket.getNextMessage();
    textDisplayStartTime = millis(); // Reset timer when a new message arrives
  }
}
