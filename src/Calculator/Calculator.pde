// Ian Hundley | Sept. 15 | Calculator
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[13];
float l, r, result, x;
char op;
boolean left, newEntry;
String displayVal;


void setup() {
  size(167, 300);
  l = 0.0;
  r = 0.0;
  result = 0.0;
  op = ' ';
  left = true;
  newEntry = true;
  displayVal = "0.0";
  // First row
  opButtons[0] = new Button(40, 80, 20, 20, '←');
  opButtons[1] = new Button(70, 80, 20, 20, 'C');
  opButtons[3] = new Button(100, 80, 20, 20, '±');
  opButtons[4] = new Button(130, 80, 20, 20, '÷');

  // Second row
  numButtons[0] = new Button(40, 110, 20, 20, '7');
  numButtons[1] = new Button(70, 110, 20, 20, '8');
  numButtons[2] = new Button(100, 110, 20, 20, '9');
  opButtons[2] = new Button(130, 110, 20, 20, '×');

  // Third row
  numButtons[3] = new Button(40, 140, 20, 20, '4');
  numButtons[4] = new Button(70, 140, 20, 20, '5');
  numButtons[5] = new Button(100, 140, 20, 20, '6');
  opButtons[5] = new Button(130, 140, 20, 20, '-');

  // Fourth row
  numButtons[6] = new Button(70, 170, 20, 20, '2');
  numButtons[7] = new Button(100, 170, 20, 20, '3');
  numButtons[8] = new Button(40, 170, 20, 20, '1');
  opButtons[6] = new Button(130, 170, 20, 20, '+');

  // Fifth row
  opButtons[7] = new Button(40, 200, 20, 20, '.');
  numButtons[9] = new Button(70, 200, 20, 20, '0');
  opButtons[8] = new Button(115, 200, 50, 20, '=');

  // Sixth row
  opButtons[9] = new Button(40, 230, 20, 20, '√');
  opButtons[10] = new Button(70, 230, 20, 20, 's');
  opButtons[11] = new Button(100, 230, 20, 20, 'd');
  opButtons[12] = new Button(130, 230, 20, 20, '!');
}

void draw() {
  background(77);
  drawDisplay();
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].mouseOver(mouseX, mouseY);
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].mouseOver(mouseX, mouseY);
  }
}

void drawDisplay() {
  rectMode(CENTER);
  fill(127);
  rect(width/2, 40, 110, 40);
  fill(255);
  textSize(16);
  textAlign(RIGHT);
  text(displayVal, width-40, 45);
}

void mouseReleased() {
  // Update display with button clicked by user
  for (int i = 0; i < numButtons.length; i++) {
    if (numButtons[i].hover) {
      handleEvent(numButtons[i].val, true);
    }
  }

  // loop through opButtons
  for (int i = 0; i < opButtons.length; i++) {
    if (opButtons[i].hover) {
      handleEvent(opButtons[i].val, false);
    }
  }

  println("L:" + l);
  println("R:" + r);
  println("result:" + result);
  println("Left:" + left);
  println("op:" + op);
}


void performCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '÷') {
    result = l / r;
  } else if (op == '×') {
    result = l * r;
  } else if (op == '^') {
    result = pow(l, r);
  }
  displayVal = str(result);
  left = !left;
}

void keyPressed() {
  println("keyCode: " + keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent('1', true);
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent('2', true);
  } else if (keyCode == 51 || keyCode == 99) {
    handleEvent('3', true);
  } else if (keyCode == 52 || keyCode == 100) {
    handleEvent('4', true);
  } else if (keyCode == 53 || keyCode == 101) {
    handleEvent('5', true);
  } else if (keyCode == 54 || keyCode == 102) {
    handleEvent('6', true);
  } else if (keyCode == 55 || keyCode == 103) {
    handleEvent('7', true);
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent('8', true);
  } else if (keyCode == 57 || keyCode == 105) {
    handleEvent('9', true);
  } else if (keyCode == 48 || keyCode == 96) {
    handleEvent('0', true);
  } else if (keyCode == 45 || keyCode == 109) { // Start of op buttons
    handleEvent('-', false);
  } else if (keyCode == 107) {
    handleEvent('+', false);
  } else if (keyCode == 46 || keyCode == 110) {
    handleEvent('.', false);
  } else if (keyCode == 47 || keyCode == 111) {
    handleEvent('÷', false);
  } else if (keyCode == 106) {
    handleEvent('×', false);
  } else if (keyCode == 10) {
    handleEvent('=', false);
  } else if (keyCode == 82) {
    handleEvent('√', false);
  } else if (keyCode == 83) {
    handleEvent('²', false);
  } else if (keyCode == 67) {
    handleEvent('³', false);
  }
}

void handleEvent(char val, boolean isNum) {
  if (isNum == true) {
    // Do number stuff
    String digit = str(val);

    if (newEntry || displayVal.equals("0.0")) {
      displayVal = digit;
      newEntry = false;
    } else {
      displayVal += digit;
    }

    if (left) {
      l = float(displayVal);
    } else {
      r = float(displayVal);
    }
  } else {
    // Do operator stuff
    char clicked = val;

    if (clicked == '=') {
      performCalc();
    } else if (clicked == '+' || clicked == '-' || clicked == '×' || clicked == '÷' || clicked == '^') {
      op = clicked;
      left = false;
      newEntry = true;
      displayVal = str(op);
    } else if (clicked == '±') {
      if (left == true) {
        l *= -1;
        displayVal = str(l);
      } else {
        r *= -1;
        displayVal = str(r);
      }
    } else if (clicked == 'C') {
      // reset all variables
      l = 0.0;
      r = 0.0;
      result = 0.0;
      op = ' ';
      left = true;
      newEntry = true;
      displayVal = "0.0";
    } else if (clicked == '√') {
      // square root of value in display
      if (left == true) {
        l = sqrt(l);
        displayVal = str(l);
      } else {
        r = sqrt(r);
        displayVal = str(r);
      }
    } else if (clicked == '²') {
      // square the value in display
      if (left == true) {
        l = sq(l);
        displayVal = str(l);
      } else {
        r = sq(r);
        displayVal = str(r);
      }
    } else if (clicked == '³') {
      // cube the value in display
      if (left == true) {
        l = pow(l, 3);
        displayVal = str(l);
      } else {
        r = pow(r, 3);
        displayVal = str(r);
      }
    } else if (clicked == '!') {
      // factorial the value in display
      long result = 1;
      if (left == true) {
        for (int n = 1; n <= (int)l; n++) {
          result *= n;
        }
        l = result;
        displayVal = str((int)l);
      } else {
        for (int n = 1; n <= (int)r; n++) {
          result *= n;
        }
        r = result;
        displayVal = str((int)r);
      }
    } else if (clicked == '.') {
      if (!displayVal.contains(".")) {
        displayVal += ".";
      }
    }
  }
}
