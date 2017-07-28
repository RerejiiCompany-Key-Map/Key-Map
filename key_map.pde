import ddf.minim.*;  //minim



/* ------------------------------- */ 
 /* ---------- CONSTANTS ---------- */ 
 /* ------------------------------- */ 
 // keyboard size 
 import java.awt.*; 
 final int BOARD_H = 266; 
 final int BOARD_W = 1020; 
 

 // key params 
 // start point (x) 
 final int[] KEYS_LEFT = { 
    10,  58, 105, 152, 199, 245, 292, 339, 386, 433, 479, 526, 573, 618,       684, 729, 774,       838, 883, 928, 975,     //   0,  14,  17 
    11,  57, 102, 147, 192, 237, 283, 328, 373, 418, 463, 508, 553, 596,       684, 729, 774,       838, 883, 928, 974,     //  21,  35,  38 
    12,  79, 124, 170, 215, 260, 305, 350, 395, 441, 485, 530, 575, 620,       684, 729, 774,       837, 882, 927, 972,     //  42,  56,  59 
    13,  91, 136, 181, 226, 272, 317, 362, 407, 452, 497, 542, 586,                                 837, 882, 927, 972,     //  63,       76 
    16, 116, 160, 205, 249, 294, 339, 384, 429, 475, 519, 564,                      729,            837, 882, 927, 972,     //  80,  92,  93 
    18,  85, 139, 206, 476, 544, 599,                                          685, 729, 775,       838, 927,               //  97, 104, 107 
 }; 
 // start point (y) 
 final int[] KEYS_TOP = { 
    9,    9,   9,   9,   9,   9,   9,   9,   9,   9,   9,   9,   9,   9,         9,   9,   9,         9,   9,   9,   9,     //   0,  14,  17 
   38,   38,  38,  38,  38,  38,  38,  38,  38,  38,  38,  38,  38,  38,        38,  38,  38,        38,  38,  38,  38,     //  21,  35,  38 
   80,   80,  80,  80,  80,  80,  80,  80,  80,  80,  80,  80,  80,  80,        80,  80,  80,        80,  80,  80,  80,     //  42,  56,  59 
   121, 121, 121, 121, 121, 121, 121, 121, 121, 121, 121, 121, 121,                                 121, 121, 121, 121,     //  63,       76 
   162, 161, 161, 161, 161, 161, 161, 161, 161, 161, 161, 161,                      167,            161, 161, 161, 161,     //  80,  92,  93 
   203, 205, 207, 207, 208, 208, 208,                                          208, 208, 208,       207, 207,               //  97, 104, 107 
 }; 
 // width 
 final int[] KEYS_W = { 
    40,  40,  40,  40,  40,  40,  40,  40,  40,  40,  40,  40,  40,  40,        38,  38,  38,        38,  38,  38,  38,     //   0,  14,  17 
    38,  38,  38,  38,  38,  38,  38,  38,  38,  38,  38,  38,  38,  62,        38,  38,  38,        38,  38,  38,  38,     //  21,  35,  38 
    62,  38,  39,  38,  38,  38,  38,  38,  38,  38,  38,  38,  38,  38,        38,  38,  38,        38,  38,  38,  38,     //  42,  56,  59 
    73,  38,  38,  38,  38,  38,  38,  38,  38,  38,  38,  38,  72,                                  38,  38,  38,  38,     //  80,  92,  93 
    96,  38,  38,  38,  38,  38,  38,  38,  38,  38,  38,  94,                       38,             38,  38,  38,  38,     //  63,       76 
    62,  49,  61, 263,  60,  48,  58,                                           38,  38,  38,        80,  36,               //  97, 104, 107 
 }; 
 // height 
 final int[] KEYS_H = { 
    23,  23,  23,  23,  23,  23,  23,  23,  23,  23,  23,  23,  23,  23,        23,  23,  23,        23,  23,  23,  23,     //   0,  14,  17 
    36,  36,  36,  36,  36,  36,  36,  36,  36,  36,  36,  36,  36,  36,        36,  36,  36,        36,  36,  36,  36,     //  21,  35,  38 
    36,  36,  36,  36,  36,  36,  36,  36,  36,  36,  36,  36,  36,  36,        36,  36,  36,        36,  36,  36,  36,     //  42,  56,  59 
    36,  36,  36,  36,  36,  36,  36,  36,  36,  36,  36,  36,  36,                                  36,  36,  36,  36,     //  63,       76 
    33 ,  36,  36,  36,  36,  36,  36,  36,  36,  36,  36,  36,                       36,             36,  36,  36,  80,     //  80,  92,  93 
    36,  35,  35,  35,  35,  35,  35,                                           35,  35,  35,        35,  35,               //  97, 104, 107 
 }; 
 // keyCode -> key_array_idx 
 final int[] KEYS_IDX = { 
 //  0    1    2    3    4    5    6    7    8    9 
    -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  34,  42,      //   0 ~   9 
    75,  -1,  38,  -1,  -1,  -1,  80,  97,  98,  -1,      //  10 ~  19 
    -1,  -1,  -1,  -1,  -1,  -1,  -1,   0,  -1,  -1,      //  20 ~  29 
    -1,  -1, 100,  37,  58,  57,  36, 104,  92, 106,      //  30 ~  39 
   105,  -1,  -1,  -1,  88,  32,  89,  90,  31,  22,      //  40 ~  49 
    23,  24,  25,  26,  27,  28,  29,  30,  -1,  73,      //  50 ~  59 
    -1,  33,  -1,  -1,  -1,  64,  85,  83,  66,  45,      //  60 ~  69 
    67,  68,  69,  50,  70,  71,  72,  87,  86,  51,      //  70 ~  79    
    52,  43,  46,  65,  47,  49,  84,  44,  82,  48,      //  80 ~  89 
    81,  53,  55,  54,  -1,  -1, 107,  93,  94,  95,      //  90 ~  99 
    76,  77,  78,  59,  60,  61,  41,  79,  -1,  62,      // 100 ~ 109 
   108,  40,  -1,  -1,  -1,  -1,   5,   6,  -1,  -1,      // 110 ~ 119 
 }; 
 
 
 
 
 //int[][] color = new int[5][3]; 
 
 
 int[][] color_ = {{255, 0, 255}, {255, 255, 255}, {75, 255, 180}, {20, 255, 125}, {145, 220, 255}}; 
 int c_cnt = 0; 

 
 
  /* ------------------------------- */ 
 /* ---------- VARIABLES ---------- */ 
 /* ------------------------------- */ 
 // key center point (x) 
 int[] keys_center_x = new int[KEYS_LEFT.length]; 
 // key center point (y) 
 int[] keys_center_y = new int[KEYS_LEFT.length]; 
 // keyPressed status 
 boolean[] keyPressed_status = new boolean[KEYS_LEFT.length]; 
 // color 
 color c; 
 // Effect 
 Effect eff; 
 
 Minim minim1,minim2,minim3, minim4, minim5, minim6;
 
  AudioPlayer play_ora, play_re, play_gr, play_whi, play_bl, play_en;
  
 
 
 
 
 /* ---------------------------------- */ 
 /* ---------- MAIN METHODS ---------- */ 
 /* ---------------------------------- */ 
 void setup(){
    size(displayWidth, displayHeight); 
    minim1 = new Minim(this);  //初期化
    play_ora = minim1.loadFile("coin.mp3");  //groove.mp3をロードする
    
    minim2 = new Minim(this);
    play_re = minim2.loadFile("sound1.mp3");
    
    minim3 = new Minim(this);
    play_gr = minim3.loadFile("sound2.mp3");
    
    minim4 = new Minim(this);
    play_whi = minim4.loadFile("sound5.mp3");
    
    minim5 = new Minim(this);
    play_bl = minim5.loadFile("water-drop3.mp3");
    
    minim6 = new Minim(this);
    play_en = minim6.loadFile("sound3.mp3");
    
   for (int i=0; i<KEYS_LEFT.length; i++) { 
     keys_center_x[i] = KEYS_LEFT[i] + KEYS_W[i]/2; 
     keys_center_y[i] = KEYS_TOP[i]  + KEYS_H[i]/2; 
   } 
    
   c = color_change(); 
   eff = new Effect_Chara(c); 
 } 
 
 
 void draw() { 
   c = color_change();
   calib(); 
   disp_keys(); 
   disp_keyPressed();
   eff.keycolor_change(c_cnt%5);
   if(c_cnt % 5 != 3) {
     eff.disp();
   } else {
     eff.coin();
   }
   
   eff.ripple_move();
 } 
 
 void init() {
  frame.removeNotify();
  frame.setUndecorated(true);
  frame.addNotify();
  super.init();  
}
 
 
 void keyPressed() {
   
   if (keyCode == ENTER) { 
     c_cnt = (c_cnt + 1) % 5;
     play_en.play();
     play_en.rewind();
   } else if (c_cnt == 0) {
     play_whi.play();
     play_whi.rewind();
   } else if (c_cnt == 1){
     play_re.play();
     play_re.rewind();
   } else if (c_cnt == 2) {
     play_gr.play();
     play_gr.rewind();
   } else if (c_cnt == 3) {
     play_ora.play();
     play_ora.rewind();
   } else if (c_cnt == 4) {
     play_bl.play();
     play_bl.rewind();
   }
   
   int i = keyCode2keyidx(keyCode); 
   if (i != -1) { 
     keyPressed_status[i] = true; 
     eff.pressed(i, keys_center_x[i], keys_center_y[i]);
     if(c_cnt == 4) {
       eff.ripple_generate();
     }
   } 
   
 }  
 
 
 void keyReleased() { 
   int i = keyCode2keyidx(keyCode); 
   if (i != -1) keyPressed_status[i] = false; 
 } 
 

 
 
 
 
 /* ----------------------------- */ 
 /* ---------- METHODS ---------- */ 
 /* ----------------------------- */ 
 
 
 // calibration 
 void calib() { 
   translate(width, height); 
   rotate(PI); 
   translate(width - BOARD_W, height - BOARD_H); 
 } 
 
 
 
 
 // display keys 
 void disp_keys() {   
   background(0); 
   fill(0); 
   stroke(c); 
   strokeWeight(3);   
   for (int i=0; i<KEYS_LEFT.length; i++) { 
     rect(KEYS_LEFT[i], KEYS_TOP[i], KEYS_W[i], KEYS_H[i], 3); 
   } 
 } 
 
 
 
 
 // keyCode -> key array index (with array index out of bounds) 
 int keyCode2keyidx(int keycode) { 
   if (keycode < KEYS_IDX.length) { 
     return KEYS_IDX[keycode]; 
   } else { 
     switch(keycode) { 
       case 127: 
         return 56; 
       case 157: 
         return 99; 
       case 192: 
         return 21; 
       case 222: 
         return 74; 
         case 61440: 
         return 14; 
       case 61441: 
         return 15; 
       case 61442: 
         return 16; 
       case 61443: 
         return 17; 
     } 
   } 
   return -1; 
 } 
 
 
 
 
 // display key pressed 
 void disp_keyPressed() { 
   for (int i=0; i<keyPressed_status.length; i++) { 
     if (keyPressed_status[i]) { 
       fill(c); 
       rect(KEYS_LEFT[i], KEYS_TOP[i], KEYS_W[i], KEYS_H[i], 3); 
     } 
   } 
 } 
 
 
 color color_change() { 
   colorMode(HSB); 
   color c; 
   c = color(color_[c_cnt][0],color_[c_cnt][1],color_[c_cnt][2]); 
   return c; 
 } 
