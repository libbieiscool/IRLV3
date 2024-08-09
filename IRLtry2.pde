import com.alialhasnawi.twitch.*;
import com.neovisionaries.ws.client.*;
import gifAnimation.*;


PopUp girlTroubleEffect;
FloatingImage floatingImage;

GifFrameRate butterflyController;
GifManager gifManager;
Gif backgroundGif, girlhood, butterfly, pansy2, flower, hairbrush,
  background_ass, background_hairTwirl, background_phone, background_typing, background_strong ;


PImage[] testGif;
PImage[] cursorImage;





//TWITCH THING
TwitchWebSocket socket = new TwitchWebSocket("zadds_", "oauth:n7spxddxiqcc8z27ke4rzofjkiyfmb");
//try to just run this with the Oauth here
// Do not touch this string
String tempTwitchChat;
//--- CHAT TRIGGERS

String wCommand = "<3";
String aCommand = "HeyGuys";
String sCommand = "hi";
String dCommand = "love";

// SETUP ----

void setup() {
  tempTwitchChat = "  ";
  size(1280, 720);

  backgroundGif = new Gif(this, "background_main.gif");
  backgroundGif.play();

  //Loading in my 'cursor'
  floatingImage = new FloatingImage("cursor3.png", width / 2, height / 2, 80, 80);


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
  socket.joinChannel("seiji");
}

// DRAW ------------------------------------------------------------------------------
void draw() {
  tempTwitchChatLoadIn();
  background(255);
   // MAIN IMAGE / IMAGE WHEN NOTHING ELSE IS HAPPENING
  image(backgroundGif, 0, 0, width, height);
  floatingImage.update(); // Update the position
  floatingImage.display(); // Display the image

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


  ////--------TRIGGERS----------------------

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




  text(tempTwitchChat, 20, 20);
}





// Outside ------------------------------------------------------------------------------
//--keep outside the drawloop ;-) its checking for new messages in chat to pull into temp string

void tempTwitchChatLoadIn() {
  if (socket.hasMoreMessages()) {
    tempTwitchChat = socket.getNextMessage();
  }
}
