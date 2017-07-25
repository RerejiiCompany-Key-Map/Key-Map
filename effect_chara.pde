class Effect_Chara implements Effect {
  /* ------------------------------- */
  /* ---------- CONSTANTS ---------- */
  /* ------------------------------- */
  char[] KEYS_CHARA = {
    '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*' , '*', '*' ,       '*', '*', '*',       '*', '*', '*', '*',
    '*', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '-' , '=', '*' ,       '*', '*', '*',       '*', '=', '/', '*',
    '*', 'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P', '[' , ']', '\\',       '*', '*', '*',       '7', '8', '9', '-',
    '*', 'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L', ';', '\'', '*',                                  '4', '5', '6', '+',
    '*', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', ',', '.', '/', '*' ,                       '↑',            '1', '2', '3', '*',
    '*', '*', '*', '*', '*', '*', '*',                                            '←', '↓', '→',       '0', '.',
  };
  
  // keyColor_change
   int[][] color_ = {{255, 0, 255}, {255, 0, 255}, {255, 0, 255}, {15, 255, 255}, {255, 0, 255}}; 
   
  // Sound 
  //Minim minim;
  //AudioPlayer player;
  
  // speed
  final int SP = 3;
  // text size
  final int TEXT_SIZE = 30;
  // maximum number of chara
  final int N = 300;
  // y coordinate critical point
  final int YCCP = -5000;
  
  
  
  /* ------------------------------- */
  /* ---------- VARIABLES ---------- */
  /* ------------------------------- */
  // color
  color c;
  color c_key;
  // charas x point
  int[] charas_x = new int[N];
  // charas y point
  int[] charas_y = new int[N];
  // chara
  char[] charas = new char[N];
  // set chara idx
  int cnt = 0;
  
  
  
  
  /* --------------------------------- */
  /* ---------- CONSTRUCTOR ---------- */
  /* --------------------------------- */
  Effect_Chara(color c_) {   
    c = c_;
  }
  
  
  /* ----------------------------- */
  /* ---------- METHODS ---------- */
  /* ----------------------------- */
  // display effect
  void disp() {
    textAlign(CENTER);
    textSize(TEXT_SIZE);
    fill(c);
    for (int i=0; i<N; i++) {
      // x = 0 -> not move
      if (charas_x[i] > 0) {
        charas_y[i] -= SP; // move
        
        text(charas[i], charas_x[i], charas_y[i]); // display
        
        if (charas_y[i] < YCCP) charas_x[i] = 0; // set not move 
      }
    }
  }
  
  
  // pressed key (add move chara)
  void pressed(int i, int x, int y) {
    charas_x[cnt] = x;
    charas_y[cnt] = y;
    charas[cnt] = KEYS_CHARA[i];
    cnt = (cnt+1)%N;
  }
  
  
  // change color
  void setColor(color c_) {
    c = c_;
  }
  
  // keyColor_change
  void keycolor_change(int c_cnt) {
    c_key = color(color_[c_cnt][0], color_[c_cnt][1], color_[c_cnt][2]);
    setColor(c_key);
    // red 255, 0, 255
    // yellow 15, 255, 255
    // white, blue, green  charas_y[x]*255 / displayHeight, 255, 255
  }
}