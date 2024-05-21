//Max Oyewole | 4/10/2024 | InteractiveShapeGame

float x, y, score, tx, ty, tw, ta, tt;

void setup() {
  size(500, 500);
  background(77, 212, 245);
  x = width/2;
  y = height/2;
  score = 0.0;
  tx = random(width);
  ty = random(height);
  tw = 5.0;
  ta = 0.5;
  tt = 2.5;
}

void draw() {
  println(dist(x, y, tx, ty));
  background(77, 212, 245);
  target();
  score();
  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      y = y - 5;
    } else if (key == 's' || key == 'S') {
      y = y + 5;
    } else if (key == 'a' || key == 'A') {
      x = x - 5;
    } else if (key == 'd' || key == 'D') {
      x = x + 5;
    }
  }
  rectMode(CENTER);
  if (x<1) {
    x = width;
  } else if (x>width) {
    x = 0;
  } else if (y<1) {
    y = height;
  } else if (y>height) {
    y = 0;
  }
  fill(190, 190, 190);
  triangle(x, y+13, x-5, y+5, x+5, y+5);
  triangle(x, y-13, x-5, y-5, x+5, y-5);
  triangle(x+13, y, x+5, y+5, x+5, y-5);
  triangle(x-13, y, x-5, y+5, x-5, y-5);
  gameOver();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      y-=5;
    } else if (keyCode == DOWN) {
      y+=5;
    } else if (keyCode == LEFT) {
      x-=5;
    } else if (keyCode == RIGHT) {
      x+=5;
    }
  }
}

void score() {
  if (dist(x, y, tx, ty)<tw) {
    score = score + 100;
    tx = random(width);
    ty = random(height);
    tw = 5;
    ta+=0.1;
    tt = 2.5;
  }
  fill(0);
  textSize(25);
  textAlign(CENTER);
  text("Score: " + score, width/2, 30);
}

void target() {
  background(77, 212, 245);
  fill(255, 36, 80);
  strokeWeight(1);
  circle(tx, ty, tw);
  triangle(tx, ty+tt, tx-5, ty+tt+5, tx+5, ty+tt+5);
  tw = tw + ta;
  tt = tt + ta/2;
}

void gameOver() {
  if (tw>100) {
    background(0);
    fill(255);
    text("Game Over!", width/2, height/2-100);
    text("Score: " + score, width/2, height/2-50);
    noLoop();
  }
}
