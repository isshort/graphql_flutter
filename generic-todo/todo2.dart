import 'todo1.dart';

class FreshProduct<T extends Product> {
  FreshProduct(int i, double d, String s);

  @override
  String toString() {
    return "Instance of Type: ${T}";
  }
}

void main(List<String> args) {
  FreshProduct<Product> spanish = FreshProduct<Product>(1, 233.4, "Spanish");
  print(spanish.toString());
  FreshProduct spanish2 = FreshProduct(23, 23.4, "spanish2");
  print(spanish2.toString());
  FreshProduct spanish3 = FreshProduct(3, 34.4, 'salam');
}
