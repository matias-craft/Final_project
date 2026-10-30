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

void setup() {
  size(875, 800);
  car_0 = loadImage("car_0.png");
  logo = loadImage("Logo.png");
}

void draw() {
  background(233, 255, 249);

  if (playmode == false) {
    image(logo, 275, 250);
    textSize(40);
    fill(0);
    text("click space to play", 275, 550);
  } else {
    if (mouseOvercar_0()) {
      car_0W = lerp(car_0W, car_0_hoverW, 0.1);
      car_0L = lerp(car_0L, car_0_hoverL, 0.1);
    } else {
      car_0W = lerp(car_0W, car_0_normalW, 0.1);
      car_0L = lerp(car_0L, car_0_normalL, 0.1);
    }
    float drawnCarX = car_0X - (car_0W - car_0_normalW) / 2;
    float drawnCarY = car_0Y - (car_0L - car_0_normalL) / 2;

    if (debug) {
      fill(255, 0, 0);
      rect(car_0_hitboxX, car_0_hitboxY, car_0_hitboxW, car_0_hitboxL);
    }
    if (quest_1) {
      fill(70, 117, 153);
      rect(310, 100, 300, 250, 40);
      fill(255);
      textSize(35);
      text("Quest 1",405, 150);
      textSize(20);
      text("Your boss told you if you dont \n repair this  car ill fire you", 350, 200);
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

    fill(0);
    text("turbo: " + upgr_3_cost, upgr_3X + 30, upgr_3Y + 60);
    fill(0);
    text("spark plugs: " + upgr_cost, upgr_1X + 30, upgr_1Y + 60 );
    text("oil filter: " + upgr_2_cost, upgr_2X + 30, upgr_2Y + 60);
    textSize(30);
    text("upgrades", 115, 275);
    textSize(25);
    text("Spark plugs: " + amount_upgr_1, 100, 325);
    text("Oil filters: " + amount_upgr_2, 100, 360);
    text("Turbos: " + amount_upgr_3, 100, 395);
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
}
void keyPressed() {
  if (playmode == false) {
    if ( key == 32) {
      playmode = true;
    }
  }
}
