/*
Matias Guzman
 Final proccesing projects
 TO DO :
 add breif descriptionof final project here
 */
boolean playmode = false;
PImage car_0;
PImage logo;
boolean debug = false;
boolean quest_1 = true;
boolean ready_upgr = false;
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

float car_upgrX = 310;
float car_upgrY = 400;
float car_upgrW = 300;
float car_upgrL = 65;

void setup() {
  size(875, 800);

  logo = loadImage("Logo.png");
}

void draw() {
  car_0 = loadImage(Car);
  background(233, 255, 249);

  if (playmode == false) {
    image(logo, 275, 250);
    textSize(40);
    fill(0);
    text("click space to play", 275, 550);
  } else {

    if (mouseOvercar_0()) {
      car_0W = lerp(car_0W, car_0_hoverW, 0.5);
      car_0L = lerp(car_0L, car_0_hoverL, 0.5);
    } else {
      car_0W = lerp(car_0W, car_0_normalW, 0.5);
      car_0L = lerp(car_0L, car_0_normalL, 0.5);
    }
    float drawnCarX = car_0X - (car_0W - car_0_normalW) / 2;
    float drawnCarY = car_0Y - (car_0L - car_0_normalL) / 2;

    if (debug) {
      fill(255, 0, 0);
      rect(car_0_hitboxX, car_0_hitboxY, car_0_hitboxW, car_0_hitboxL);
      amount_upgr_1 = 50;
      amount_upgr_2 = 50;
      amount_upgr_3 = 50;
      amount_upgr_4 = 50;
    }
    if (quest_1) {
      fill(70, 117, 153);
      rect(310, 100, 300, 280, 40);
      fill(255);
      textSize(35);
      text("Quest 1", 405, 150);
      textSize(20);
      text("Your boss told you if you dont \n repair this  car or ill fire you. \n buy \n spark plugs: 20 \n oil filters: 10  \n turbos: 5 \n rocket boosters: 2 \n to upgrade car", 350, 200);
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
    image(car_0, drawnCarX, drawnCarY, car_0W, car_0L);
    fill(0);
    textSize(30);
    text("money: " + money, 115, 40);


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
    textSize(30);
    text("upgrades", 115, 275);
    textSize(25);
    text("Spark plugs: " + amount_upgr_1, 100, 325);
    text("Oil filters: " + amount_upgr_2, 100, 360);
    text("Turbos: " + amount_upgr_3, 100, 395);
    text("Rocket boosters: " + amount_upgr_4, 100, 430);
    text("money per click: " + money_click, 375, 40);
    textSize(45);
    text("Shop", 700, 50);
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
void mousePressed() {
  if (mouseOvercar_0()) {
    money += money_click;
  }
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
  if (ready_upgr) {
    if (mouseOverCar_upgr()) {
      Car = "Car_1.png";
      amount_upgr_1 = 0;
      amount_upgr_2 = 0;
      amount_upgr_3 = 0;
      amount_upgr_4 = 0;
      money = 0;
      money_click = 5000;
      quest_1 = false;
    }
  }
}
void keyPressed() {
  if (playmode == false) {
    if ( key == 32) {
      playmode = true;
    }
  }
}
