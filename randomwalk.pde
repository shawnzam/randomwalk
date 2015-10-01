
int stepSize = 10;
int myHeightWidth, startX, startY, index;

void setup()
{
  myHeightWidth = 1000;
  startX = myHeightWidth/2;
  startY = myHeightWidth/2;
  fill(color(0, 0, 0));
  size(1000, 1000);
  frameRate(10);
  background(178);
  index = 0;
}

void draw()
{ 
  if(index == 0){
    ellipse(startX, startY, stepSize, stepSize);
  }
  index += 1;
  if(index % 10 == 0){
    println(index);
  }
  if (index == 500) {
    fill(color(255, 0, 0));
    ellipse(startX, startY, stepSize, stepSize);
    saveFrame(millis() + ".png");
    background(178);
    index = 0;
    startX = myHeightWidth/2;
    startY = myHeightWidth/2;
    fill(color(0, 0, 0));
  }
  int newStartX, newStartY;
  newStartX = startX;
  newStartY = startY;
  int r = int(random(4));
  switch(r) {
  case 0: 
    startX = (startX > myHeightWidth) ? myHeightWidth : (startX += stepSize);
    startY = (startY > myHeightWidth) ? myHeightWidth : (startY += stepSize);
    break;
  case 1: 
    startX = (startX > myHeightWidth) ? myHeightWidth : (startX += stepSize);
    startY = (startY < 0) ? 0 : (startY -= stepSize);
    break;
  case 2: 
    startX = (startX < 0) ? 0 : (startX -= stepSize);
    startY = (startY > myHeightWidth) ? myHeightWidth : (startY += stepSize);
    break;
  case 3: 
    startX = (startX < 0) ? 0 : (startX -= stepSize);
    startY = (startY < 0) ? 0 : (startY -= stepSize);
    break;
  }
  line(newStartX, newStartY, startX, startY);
}