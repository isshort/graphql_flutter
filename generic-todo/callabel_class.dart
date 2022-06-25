class Addition {
  int call(int a, int b) => a + b;
}

void main(List<String> args) {
  Addition addition = Addition();

  final result = addition(4, 3);
  print(result);
}
