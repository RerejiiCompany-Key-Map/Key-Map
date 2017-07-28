interface Effect {
  void disp();
  void pressed(int i, int x, int y);
  void setColor(color c);
  void keycolor_change(int c_cnt);
  void ripple_generate();
  void ripple_move();
  void coin();
  void light_gene();
  void light_move();
}