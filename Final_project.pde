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
float upgr_cost = 15;
float upgr_1X = 623;
float upgr_1Y = 150;
float upgr_1_norW = 250;
float upgr_1W = upgr_1_norW;
float upgr_1_norL = 100;
float upgr_1L = upgr_1_norL;


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
    image(car_0, drawnCarX, drawnCarY, car_0W, car_0L);
    fill(0);
    textSize(30);
    text("money: " + money, 125, 40);
    if (mouseOverUpgr_1 ()) {
      fill(128, 184, 181);
    } else {
      fill(158, 216, 219);
    }
    rect(upgr_1X, upgr_1Y, upgr_1W, upgr_1L);
    fill(0);
    text("spark plugs: " + upgr_cost, upgr_1X + 30, upgr_1Y + 60 );
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
void mousePressed() {
  if (mouseOvercar_0()) {
    println("car was pressed");
    money += money_click;
  }
  if ( money >= upgr_cost) {
    if (mouseOverUpgr_1()) {
      money -= upgr_cost;
      money_click += 1;
      upgr_cost += 5;
    }
  }
}
void keyPressed() {
  while (playmode == false) {
    if ( key == 32) {
      playmode = true;
    }
  }
}
