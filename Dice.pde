ArrayList<Die> dice = new ArrayList<Die>();
int sum;
void setup(){
  size(400, 400);
  sum = 0;
  for(int i = 0; i < 5; i++){
    for(int j = 0; j < 5; j++){
      Die d = new Die(75+i*50,75 + j*50,6, 50);
      d.rollDie();
      d.drawDie();
      sum += d.getValue();
      dice.add(d);
    }
  }
}
void mouseClicked(){
  sum = 0;
  for(int p = 0; p < dice.size(); p++){
    dice.get(p).rollDie();
    sum += dice.get(p).getValue();
  }
}
void draw(){
  background(0,0,0);
  for(int p = 0; p < dice.size(); p++){
    dice.get(p).drawDie();
  }
  textAlign(CENTER);
  text("Score: " + sum, 200, 25);
}
class Die{
  int posX;
  int posY;
  int sides;
  int value;
  int size;
  public Die(int x, int y, int s, int siz){
    this.posX = x;
    this.posY = y;
    this.sides = s;
    this.size = siz;
  }
  public void drawDie(){
    fill(255,255,255);
    rect(this.posX, this.posY, size, size);
    fill(255,0,0);
    if(value == 1){
      ellipse(posX + size/2, posY + size/2, size/5, size/5);
    } else if(value == 2){
      ellipse(posX + size/3, posY + size/2, size/5, size/5);
      ellipse(posX + 2*size/3, posY + size/2, size/5, size/5);
    } else if(value == 3){
      ellipse(posX + size/4, posY + size/4, size/5, size/5);
      ellipse(posX + size/2, posY + size/2, size/5, size/5);
      ellipse(posX + 3*size/4, posY + 3*size/4, size/5, size/5);
    } else if(value == 4){
      ellipse(posX + size/4, posY + size/4, size/5, size/5);
      ellipse(posX + 3*size/4, posY + size/4, size/5, size/5);
      ellipse(posX + size/4, posY + 3*size/4, size/5, size/5);
      ellipse(posX + 3*size/4, posY + 3*size/4, size/5, size/5);
    } else if(value == 5){
      ellipse(posX + size/4, posY + size/4, size/5, size/5);
      ellipse(posX + 3*size/4, posY + size/4, size/5, size/5);
      ellipse(posX + size/4, posY + 3*size/4, size/5, size/5);
      ellipse(posX + 3*size/4, posY + 3*size/4, size/5, size/5);
      ellipse(posX + size/2, posY + size/2, size/5, size/5);
    } else if(value == 6){
      ellipse(posX + size/4, posY + size/5, size/5, size/5);
      ellipse(posX + size/4, posY + size/2, size/5, size/5);
      ellipse(posX + size/4, posY + 4*size/5, size/5, size/5);
      ellipse(posX + 3*size/4, posY + size/5, size/5, size/5);
      ellipse(posX + 3*size/4, posY + size/2, size/5, size/5);
      ellipse(posX + 3*size/4, posY + 4*size/5, size/5, size/5);
    } else {
      System.out.println("Error");
    }
  }
  public void rollDie(){
    this.value = (int)(Math.random() * this.sides + 1);
  }
  public int getValue(){
    return this.value;
  }
}
