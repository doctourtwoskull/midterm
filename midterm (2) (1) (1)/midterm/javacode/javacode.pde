void   setup() {
  size (720, 400);
  noStroke();
  rectMode(CENTER);
}

void draw() {
  background(230);

  float r1 = map(mouseX, 0, width, 0, height);
  //above is where you put the code for the nob
  float r2 = height - r1;

  fill(300, 200, 43, r1);
  rect(width / 2 + r1 / 2, height / 2, r1, r1);

  fill(237, 300, 93, r2);
  rect(width / 2 - r2 / 2, height / 2, r2, r2);
}
