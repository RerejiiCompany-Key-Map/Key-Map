class StringKey{
  int center_y;
  int[] centerX;
  int[] centerY;
  char[] object;
  int[] arg;
  int temp;
  int[] m_y;
  int cnt = 300;
  StringKey(int x[], int y[], char obj[]){
    centerX = new int[x.length];
    centerY = new int[y.length];
    object = new char[obj.length];
    temp = 0;
    arg = new int[cnt];
    m_y = new int[cnt];
    for (int i = 0; i < x.length; i++) {
      object[i] = obj[i];
      centerX[i] = x[i];
      centerY[i] = y[i]; 
    }
    center_y = 0;
  }
      
  int keyExpress(char obj) {
    /*
    fill(255, 0, 0);
    rotate(PI);
    */
    int i;
    
    if (obj == '/') {
      i = 18;
     } else
    
    if (obj == '.') {
      i = 19;
    } else
    
    if (obj == ',') {
      i = 20;
    } else
    
    if (obj == 'm') {
      i = 21;
    } else
    
    if (obj == 'n') {
      i = 22;
    } else
    
    if (obj == 'b') {
      i = 23;
    } else
    
    if (obj == 'v') {
      i = 24;
    } else
    
    if (obj == 'c') {
      i = 25;
    } else
    
    if (obj == 'x') {
      i = 26;
    } else 
    
    if (obj == 'z') {
      i = 27;
    } else
    
    if (obj == ';') {
      i = 35;
    } else 
    
    if (obj == 'l') {
      i = 36;
    } else
    
    if (obj == 'k') {
      i = 37;
    } else
    
    if (obj == 'j') {
      i = 38;
    } else
    
    if (obj == 'h') {
      i = 39;
    } else
    
    if (obj == 'g') {
      i = 40;
    } else
    
    if (obj == 'f') {
      i = 41;
    } else
    
    if (obj == 'd') {
      i = 42;
    } else
    
    if (obj == 's') {
      i = 43;
    } else
    
    if (obj == 'a') {
      i = 44;
    } else
    
    if (obj == ']') {
      i = 54;
    } else
    
    if (obj == '[') {
      i = 55;
    } else
    
    if (obj == 'p') {
      i = 56;
    } else
    
    if (obj == 'o') {
      i = 57;
    } else
    
    if (obj == 'i') {
      i = 58;
    } else
    
    if (obj == 'u') {
      i = 59;
    } else
    
    if (obj == 'y') {
      i = 60;
    } else
    
    if (obj == 't') {
      i = 61;
    } else
    
    if (obj == 'r') {
      i = 62;
    } else
    
    if (obj == 'e') {
      i = 63;
    } else
    
    if (obj == 'w') {
      i = 64;
    } else
    
    if (obj == 'q') {
      i = 65;
    } else
    
    if (obj == '=') {
      i = 75;
    } else 
    
    if (obj == '-') {
      i = 76;
    } else
    
    if (obj == '0') {
      i = 77;
    } else
    
    if (obj == '9') {
      i = 78;
    } else
    
    if (obj == '8') {
      i = 79;
    } else
    
    if (obj == '7') {
      i = 80;
    } else
    
    if (obj == '6') {
      i = 81;
    } else
    
    if (obj == '5') {
      i = 82;
    } else
    
    if (obj == '4') {
      i = 83;
    } else
    
    if (obj == '3') {
      i = 84;
    } else
    
    if (obj == '2') {
      i = 85;
    } else
    
    if (obj == '1') {
      i = 86;
    } else {
      i = 0;
    }
    return i;
  }
  
  void display(int i) {
    arg[temp] = i;
    m_y[temp] = 0;
    temp += 1;
    if(temp == cnt) {
      temp = 0;
      println(temp);
    }
  }
  
  void move() {
    colorMode(HSB);
    textSize(30);
    translate(13,0);
    rotate(PI);
    for(int x = 0; x < cnt; x++) {
      if(arg[x] == 0) {
        continue;
      }
    i = arg[x];
    m_y[x] += 2;
    fill(m_y[x]*255/displayHeight +7, 255, 255);
    //fill(15, 255, 255);  // orange(yellow)
    //fill(255, 0, 255);  // white(red)
    text(object[i], -centerX[i], -centerY[i]-m_y[x]);
    }
  }
}
