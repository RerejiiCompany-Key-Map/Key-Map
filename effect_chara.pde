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
}
