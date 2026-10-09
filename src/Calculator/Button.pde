class Button {
  // member variables
  float x, y, w, h;
  char val;
  boolean hover;
  color c1, c2;

  // construcotr
  Button(float x, float y, float w, float h, char val) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    hover = false;
    c1 = color(127);
    c2 = color(177);
  }

  // member methods
  void display() {
    if (hover == true) {
      fill(c2);
    } else {
      fill(c1);
    }
    rectMode(CENTER);
    rect(x, y, w, h, 3);
    fill(255);
    textAlign(CENTER);
    if (val == 's') {
      text("x²", x, y+6);
    } else if (val == 'd') {
      text("x³",x, y+6);
    } else {
      text(val, x, y+6);
    }
  }

  void mouseOver(float tempX, float tempY) {
    if (tempX>x-w/2 && tempX<x+w/2 && tempY>y-h/2 && tempY<y+h/2) {
      hover = true;
    } else {
      hover = false;
    }
  }
}
