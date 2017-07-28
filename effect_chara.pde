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
   int[][] color_ = {{230, 120, 255}, {255, 135, 255}, {42, 255, 255}, {42, 255, 255}, {255, 0, 255}}; 
   
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
  
  // distance
  int[] dis = new int[N];
  // ripple x point
  int[] ripple_x = new int[N];
  // ripple y point
  int[] ripple_y = new int[N];
  //ripple count
  int r_cnt = 0;
  
  // Light x
  int[] light_x = new int [N];
  int[] li_af = new int[N];
  //Light y
  int[] light_y = new int[N];
  // light count
  int l_cnt = 0;
  
  
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
  
  void ripple_generate() {
   if(cnt -1  < 0) {
     ripple_x[r_cnt] = charas_x[N-1];
     ripple_y[r_cnt] = charas_y[N-1];
     dis[r_cnt] = 1;
   } else {
     ripple_x[r_cnt] = charas_x[cnt-1];
     ripple_y[r_cnt] = charas_y[cnt-1];
     dis[r_cnt] =1;
   }
   r_cnt = (r_cnt+1) % N;
 }
 
  void ripple_move() {
    noFill();
    strokeWeight(2);
    stroke(255);
    for (int i = 0; i < N; i++) {
      if(dis[i] ==0) {
        continue;
      } else {
        if(dis[i] < 320){
          dis[i] += 3;
          ellipse(ripple_x[i], ripple_y[i], dis[i],dis[i]);
        }
      }
    }
  }
    
 
  // change color
  void setColor(color c_) {
    c = c_;
  }
  
  // keyColor_change
  void keycolor_change(int c_cnt) {
    c_key = color(color_[c_cnt][0], color_[c_cnt][1], color_[c_cnt][2]);
    setColor(c_key);
  }
  
  void coin() {
    fill(c);
    stroke(30, 255, 255);
    strokeWeight(3);
    for(int i = 0; i < N; i++) {
      if(charas_x[i] > 0) {
        charas_y[i] -= SP;
        if(charas_y[i] > -200) {
        ellipse(charas_x[i], charas_y[i],10 ,15); 
        }
      }
      if (charas_y[i] < YCCP) charas_x[i] = 0; // set not move 
    }
  }
  
  void light_gene() {
    if(cnt  - 1 < 0) {
      light_x[l_cnt] = charas_x[N - 1];
      light_y[l_cnt] = charas_y[N - 1];
    } else {
      light_x[l_cnt] = charas_x[cnt-1];
      light_y[l_cnt] = charas_y[cnt-1];
    }
    li_af[l_cnt] = 30;

  }
    
  
  void light_move() {
    strokeWeight(1);
    stroke(255);
    for(int i = 0; i < N; i++) {
      if(li_af[i] == 0) {
        continue;
      } else {
        if (li_af[i] < 80) {
          li_af[i] += 2;
          line(light_x[i] + li_af[i],light_y[i], light_x[i] + 20 +li_af[i], light_y[i]);
          line(light_x[i] - li_af[i] ,light_y[i], light_x[i] - 20 - li_af[i], light_y[i]);
          line(light_x[i],light_y[i] + li_af[i], light_x[i], light_y[i] + 15 + li_af[i]);
          line(light_x[i],light_y[i] - li_af[i], light_x[i], light_y[i] - 15 - li_af[i]);
        }
      }
    }
  }
}