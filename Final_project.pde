
/*
Matias Guzman
 Final proccesing projects
 TO DO :
 add breif descriptionof final project here
 */
boolean Race_start = false;
boolean playmode = false;
boolean start_menu = true;
boolean Boss_fight_1 = false;
boolean Boss_fight_ready = false;
boolean boss_fight_2 = false;
boolean boss_fight_ready2 = false;
boolean win_1 = false;
PImage car_0;
PImage logo;
PImage Boss_1;
boolean debug = false;
boolean quest_1 = true;
boolean quest_2 = false;
boolean ready_upgr = false;
boolean quest_3 = false;
boolean upgr_grp_1 = true;
String Car = "car_0.png";
int money = 0;
float car_0_normalW = 250;
float car_0_normalL = 250;
float car_0X = 50;
float car_0Y = 50;
float car_0W = car_0_normalW;
float car_0_hoverW = 300;
float car_0L = car_0_normalL;
float car_0_hoverL = 300;
float car_0_hitboxX = car_0X + 10;
float car_0_hitboxY = car_0Y + 67;
float car_0_hitboxW = car_0W - 20;
float car_0_hitboxL = car_0L - 135;

int money_click = 1;
int page = 1;

float upgr_cost = 60;
float upgr_1X = 623;
float upgr_1Y = 150;
float upgr_1_norW = 250;
float upgr_1W = upgr_1_norW;
float upgr_1_norL = 100;
float upgr_1L = upgr_1_norL;
int amount_upgr_1 = 0;

float upgr_2_cost = 700;
float upgr_2X = 623;
float upgr_2Y = 270;
float upgr_2_norW = 250;
float upgr_2W = upgr_2_norW;
float upgr_2_norL = 100;
float upgr_2L = upgr_2_norL;
int amount_upgr_2 = 0;

float upgr_3_cost = 9000;
float upgr_3X = 623;
float upgr_3Y = 390;
float upgr_3_norW = 250;
float upgr_3W = upgr_3_norW;
float upgr_3_norL = 100;
float upgr_3L = upgr_3_norL;
int amount_upgr_3 = 0;

float upgr_4_cost = 15000;
float upgr_4X = 623;
float upgr_4Y = 510;
float upgr_4_norW = 250;
float upgr_4W = upgr_4_norW;
float upgr_4_norL = 100;
float upgr_4L = upgr_4_norL;
int amount_upgr_4 = 0;

float upgr_5_cost = 50000;
float upgr_5X = 623;
float upgr_5Y = 150;
float upgr_5_norW = 250;
float upgr_5W = upgr_5_norW;
float upgr_5_norL = 100;
float upgr_5L = upgr_5_norL;
int amount_upgr_5 = 0;


float upgr_6_cost = 100000;
float upgr_6X = 623;
float upgr_6Y = 270;
float upgr_6_norW = 250;
float upgr_6W = upgr_6_norW;
float upgr_6_norL = 100;
float upgr_6L = upgr_6_norL;
int amount_upgr_6 = 0;

float car_upgrX = 310;
float car_upgrY = 400;
float car_upgrW = 300;
float car_upgrL = 65;

float Boss_fightX = 310;
float Boss_fightY = 400;
float Boss_fightW = 300;
float Boss_fightL = 65;

float Boss_fight2X = 310;
float Boss_fight2Y = 450;
float Boss_fight2W = 300;
float Boss_fight2L = 65;

float Race_carX = 20;
float Race_carY = 500;
float Race_carW = 150;
float Race_carL = 150;

float Boss_carX = 20;
float Boss_carY = 250;
float Boss_carW = 150;
float Boss_carL = 150;

float page_upX = 623;
float page_upY = 640;
float page_upW = 250;
float page_upL = 60;

float page_downX = 623;
float page_downY = 710;
float page_downW = 250;
float page_downL = 60;

void setup() {
  size(875, 800);

  logo = loadImage("Logo.png");
  Boss_1 = loadImage("Boss_1.png");
}

void draw() {
  if (debug) {
    fill(255, 0, 0);
    rect(car_0_hitboxX, car_0_hitboxY, car_0_hitboxW, car_0_hitboxL);
    amount_upgr_1 =+ 60;
    amount_upgr_2 =+ 50;
    amount_upgr_3 =+ 50;
    amount_upgr_4 =+ 50;
    quest_1 = false;
    quest_2 =false;
    quest_3 = true;
    start_menu = false;
    Boss_fight_1 = false;
    playmode = true;
    Car = "Car_1.png";
  }
  car_0 = loadImage(Car);
  background(233, 255, 249);
  if (Boss_fight_1) {
    background(214, 64, 69);
    image(car_0, Race_carX, Race_carY, Race_carW, Race_carL);
    image(Boss_1, Boss_carX, Boss_carY, Boss_carW, Boss_carL);
    fill(255);
    textSize(40);

    if (Race_start == true) {
      Boss_carX += 1.2;
    }
    if (Boss_carX >= 755 && Race_carX < 755) {
      playmode = true;
      Boss_fight_1 = false;
      Boss_carX = 20;
      Race_carX = 20;
      Race_start = false;
    }
    if (Race_carX >= 755 && Boss_carX < 755) {
      Race_start = false;
      win_1 = true;
      Boss_carX = 20;
      Race_carX = 20;
      Boss_fight_1 = false;
    }
  }
  if (start_menu) {
    image(logo, 275, 250);
    textSize(40);
    fill(0);
    text("click space to play", 275, 550);
  }
  if ( win_1 == true) {
    background(0, 180, 0);
    fill(255);
    textSize(40);
    text("YOU WON", 350, 400);
    text("Click anywhere to continue", 250, 450);
  }
  if (playmode) {
    background(233, 255, 249);
    if (mouseOvercar_0()) {
      car_0W = lerp(car_0W, car_0_hoverW, 0.5);
      car_0L = lerp(car_0L, car_0_hoverL, 0.5);
    } else {
      car_0W = lerp(car_0W, car_0_normalW, 0.5);
      car_0L = lerp(car_0L, car_0_normalL, 0.5);
    }
    float drawnCarX = car_0X - (car_0W - car_0_normalW) / 2;
    float drawnCarY = car_0Y - (car_0L - car_0_normalL) / 2;


    if (quest_1) {
      fill(70, 117, 153);
      rect(310, 100, 300, 280, 40);
      fill(255);
      textSize(35);
      text("Quest 1", 405, 150);
      textSize(20);
      text("Your boss told you if you dont \n repair this  car ill fire you. \n buy \n spark plugs: 20 \n oil filters: 10  \n turbos: 5 \n rocket boosters: 2 \n to upgrade car", 350, 200);
      if (amount_upgr_1 >= 20 && amount_upgr_2 >= 10 && amount_upgr_3 >= 5 && amount_upgr_4 >= 2) {
        ready_upgr = true;
        if (mouseOverCar_upgr()) {
          fill(50, 97, 133);
        } else {
          fill(70, 117, 153);
        }
        rect(car_upgrX, car_upgrY, car_upgrW, car_upgrL, 20);
        fill(255);
        textSize(25);
        text("Upgrade Car", 390, 440);
      }
    }
    if (quest_2) {
      Race_start = false;
      Boss_carX = 20;
      fill(70, 117, 153);
      rect(310, 100, 300, 280, 40);
      fill(255);
      textSize(35);
      text("Quest 2", 405, 150);
      textSize(20);
      text("now that you fixed the \n car u can take your boss's\n place. get ready to fight by buying:\n spark plugs: 60 \n oil filters: 40 \n turbo: 20 \n rocket boosters: 10 ", 325, 200);
      if (amount_upgr_1 >= 60 && amount_upgr_2 >= 40 && amount_upgr_3 >= 20 && amount_upgr_4 >= 10) {
        Boss_fight_ready = true;
        if (mouseOverBossfight()) {
          fill(50, 97, 133);
        } else {
          fill(70, 117, 153);
        }
        rect(Boss_fightX, Boss_fightY, Boss_fightW, Boss_fightL, 20);
        fill(255);
        textSize(25);
        text("Fight Boss", 390, 440);
      }
    }
    if (quest_3) {
      Race_start = false;
      Boss_carX = 20;
      fill(70, 117, 153);
      rect(310, 100, 300, 340, 40);
      fill(255);
      textSize(35);
      text("Quest 3", 405, 150);
      textSize(20);
      text("your car broke after the fight. \n you have to rapair it before ur \n ex boss's son comes to \n reclaim the shop. buy \n  spark plugs: 100 \n oil filter : 70 \n turbos: 60 \n rocket boosters: 40 \n supercharger: 20 \n nitros: 10", 325, 200);
      if (amount_upgr_1 >= 100 && amount_upgr_2 >= 70 && amount_upgr_3 >= 60 && amount_upgr_4 >= 40 && amount_upgr_5 >= 20 && amount_upgr_6 >= 10) {
        boss_fight_ready2 = true;
        if (mouseOverBossfight2()) {
          fill(50, 97, 133);
        } else {
          fill(70, 117, 153);
        }
        rect(Boss_fight2X, Boss_fight2Y, Boss_fight2W, Boss_fight2L, 20);
        fill(255);
        textSize(25);
        text("Fight Boss", 390, 490);
      }
    }
    image(car_0, drawnCarX, drawnCarY, car_0W, car_0L);
    fill(0);
    textSize(30);
    text("money: " + money, 115, 40);



    if (mouseOverPageUp()) {
      fill(128, 184, 181);
    } else {
      fill(158, 216, 219);
    }
    rect(page_upX, page_upY, page_upW, page_upL, 20);


    if (mouseOverPageDown()) {
      fill(128, 184, 181);
    } else {
      fill(158, 216, 219);
    }
    rect(page_downX, page_downY, page_downW, page_downL, 20);


    fill(0);
    textSize(25);
    text("Page Up", page_upX + 70, page_upY + 38);
    text("Page Down", page_downX + 60, page_downY + 38);
    if (page == 1) {
      if (mouseOverUpgr_1 ()) {
        fill(128, 184, 181);
      } else {
        fill(158, 216, 219);
      }

      rect(upgr_1X, upgr_1Y, upgr_1W, upgr_1L, 20);
      if (mouseOverUpgr_2()) {
        fill(128, 184, 181);
      } else {
        fill(158, 216, 219);
      }
      rect(upgr_2X, upgr_2Y, upgr_2W, upgr_2L, 20);

      if (mouseOverUpgr_3()) {
        fill(128, 184, 181);
      } else {
        fill(158, 216, 219);
      }

      rect(upgr_3X, upgr_3Y, upgr_3W, upgr_3L, 20);

      if (mouseOverUpgr_4()) {
        fill(128, 184, 181);
      } else {
        fill(158, 216, 219);
      }
      rect(upgr_4X, upgr_4Y, upgr_4W, upgr_4L, 20);
      fill(0);
      text("rocket boosters:  \n          " + upgr_4_cost, upgr_4X + 30, upgr_4Y + 45);
      text("turbo: " + upgr_3_cost, upgr_3X + 30, upgr_3Y + 60);
      text("spark plugs: " + upgr_cost, upgr_1X + 30, upgr_1Y + 60 );
      text("oil filter: " + upgr_2_cost, upgr_2X + 30, upgr_2Y + 60);
    } else if (page == 2) {
      if (quest_3) {
        if (mouseOverUpgr_5()) {
          fill(128, 184, 181);
        } else {
          fill(158, 216, 219);
        }
        rect(upgr_5X, upgr_5Y, upgr_5W, upgr_5L, 20);

        if (mouseOverUpgr_6()) {
          fill(128, 184, 181);
        } else {
          fill(158, 216, 219);
        }
        rect(upgr_6X, upgr_6Y, upgr_6W, upgr_6L, 20);
      }
      fill(0);
      text("supercharger: \n      " + upgr_5_cost, upgr_5X + 30, upgr_5Y + 45);
      text("nitro: " + upgr_6_cost, upgr_6X + 30, upgr_6Y + 60);
    }
    textSize(30);
    text("upgrades", 115, 275);
    textSize(25);
    text("Spark plugs: " + amount_upgr_1, 100, 325);
    text("Oil filters: " + amount_upgr_2, 100, 360);
    text("Turbos: " + amount_upgr_3, 100, 395);
    text("Rocket boosters: " + amount_upgr_4, 100, 430);
    if (quest_3) {
      text("Superchargers: " + amount_upgr_5, 100, 465);
      text("Nitros: " + amount_upgr_6, 100, 500);
    }
    textSize(20);
    text("Page " + page + " / 2", 100, 615);

    textSize(30);
    text("money per click: " + money_click, 375, 40);
  }
}
boolean mouseOvercar_0() {
  return mouseX > car_0_hitboxX &&
    mouseX < car_0_hitboxX + car_0_hitboxW &&
    mouseY > car_0_hitboxY &&
    mouseY< car_0_hitboxY + car_0_hitboxL;
}
boolean mouseOverUpgr_1() {
  return mouseX > upgr_1X &&
    mouseX < upgr_1X + upgr_1W &&
    mouseY > upgr_1Y &&
    mouseY < upgr_1Y + upgr_1L;
}
boolean mouseOverUpgr_2() {
  return mouseX > upgr_2X &&
    mouseX < upgr_2X + upgr_2W &&
    mouseY > upgr_2Y &&
    mouseY < upgr_2Y + upgr_2L;
}
boolean mouseOverUpgr_3() {
  return mouseX > upgr_3X &&
    mouseX < upgr_3X + upgr_3W &&
    mouseY > upgr_3Y &&
    mouseY < upgr_3Y + upgr_3L;
}
boolean mouseOverUpgr_4() {
  return mouseX > upgr_4X &&
    mouseX < upgr_4X + upgr_4W &&
    mouseY > upgr_4Y &&
    mouseY < upgr_4Y + upgr_4L;
}
boolean mouseOverCar_upgr() {
  return mouseX > car_upgrX &&
    mouseX < car_upgrX + car_upgrW &&
    mouseY > car_upgrY &&
    mouseY < car_upgrY + car_upgrL;
}
boolean mouseOverBossfight() {
  return mouseX > Boss_fightX &&
    mouseX < Boss_fightX + Boss_fightW &&
    mouseY > Boss_fightY &&
    mouseY < Boss_fightY + Boss_fightL;
}
boolean mouseOverBossfight2() {
  return mouseX > Boss_fightX &&
    mouseX < Boss_fight2X + Boss_fight2W &&
    mouseY > Boss_fight2Y &&
    mouseY < Boss_fight2Y + Boss_fight2L;
}
boolean mouseOverPageUp() {
  return mouseX > page_upX &&
    mouseX < page_upX + page_upW &&
    mouseY > page_upY &&
    mouseY < page_upY + page_upL;
}

boolean mouseOverPageDown() {
  return mouseX > page_downX &&
    mouseX < page_downX + page_downW &&
    mouseY > page_downY &&
    mouseY < page_downY + page_downL;
}

boolean mouseOverUpgr_5() {
  return mouseX > upgr_5X &&
    mouseX < upgr_5X + upgr_5W &&
    mouseY > upgr_5Y &&
    mouseY < upgr_5Y + upgr_5L;
}

boolean mouseOverUpgr_6() {
  return mouseX > upgr_6X &&
    mouseX < upgr_6X + upgr_6W &&
    mouseY > upgr_6Y &&
    mouseY < upgr_6Y + upgr_6L;
}
void mousePressed() {
  if (mouseOvercar_0()) {
    money += money_click;
  }
  if (page ==1) {
    if ( money >= upgr_cost) {
      if (mouseOverUpgr_1()) {
        money -= upgr_cost;
        money_click += 1;
        upgr_cost += 5;
        amount_upgr_1 += 1;
      }
    }
    if (money >= upgr_2_cost) {
      if (mouseOverUpgr_2()) {
        money -= upgr_2_cost;
        amount_upgr_2 += 1;
        money_click += 5;
        upgr_2_cost += 25;
      }
    }
    if (money >= upgr_3_cost) {
      if (mouseOverUpgr_3()) {
        money -= upgr_3_cost;
        amount_upgr_3 += 1;
        money_click += 20;
        upgr_3_cost += 100;
      }
    }
    if (money >= upgr_4_cost) {
      if (mouseOverUpgr_4()) {
        money -= upgr_4_cost;
        amount_upgr_4 += 1;
        money_click += 100;
        upgr_4_cost += 500;
      }
    }
  }
  if (quest_1) {
    if (ready_upgr) {
      if (mouseOverCar_upgr()) {
        Car = "Car_1.png";
        amount_upgr_1 = 0;
        amount_upgr_2 = 0;
        amount_upgr_3 = 0;
        amount_upgr_4 = 0;
        money = 0;
        money_click = 100;
        quest_1 = false;
        ready_upgr = false;
        quest_2 = true;
      }
    }
  }
  if (quest_2) {
    if (Boss_fight_ready) {
      if (mouseOverBossfight()) {
        playmode = false;
        Boss_fight_1 = true;
        quest_2 = false;
      }
    }
  }
  if ( win_1 == true) {
    quest_3 = true;
    quest_2 = false;
    win_1 = false;
    playmode = true;
  }
  if (quest_3) {
    if (mouseOverPageUp()) {

      page = 2;
    }

    if (mouseOverPageDown()) {

      page = 1;
    }
  }
}
void keyReleased() {
  if (start_menu) {
    if ( key == 32) {
      playmode = true;
      start_menu = false;
    }
  }
  if (Boss_fight_1) {
    if (key == 32) {
      Race_carX += 5;
      Race_start = true;
    }
  }
}
