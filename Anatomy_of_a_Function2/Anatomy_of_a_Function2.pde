int a;
int c;
void setup() {
  size(1000, 1000);
  a = 0;
  println(a);
  addOneToA();
  println(a);
  addTwoNumbers(3, 5);
  c = addTwoNumbers(2, 3);
}

void draw() {
}

void addOneToA() {
  a += 1;
}

int addTwoNumbers(int A, int B) {
  return A + B;
}
