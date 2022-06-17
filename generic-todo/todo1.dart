import 'dart:collection';

void main(List<String> args) {
  List<Product> products = [
    Product(1, 'product1', 34.3),
    Product(2, 'product2', 40.3),
    Product(3, 'product3', 50.3),
  ];
  List<Inventory> inventories = [
    Inventory(344),
    Inventory(44),
    Inventory(400),
  ];

  Stroe<Product, Inventory> customeStore = Stroe<Product, Inventory>();
  customeStore.printProduct();
  customeStore.updateInventory(products[0], inventories[0]);
  customeStore.updateInventory(products[1], inventories[1]);
  customeStore.printProduct();

  T lastItem<T>(List<T> products) {
    T last = products.last;
    return last;
  }

  print('your last product is ${lastItem<Product>(products)}');
}

class Product {
  Product(this.id, this.name, this.price);

  final int id;
  final String name;
  final double price;

  @override
  String toString() {
    return 'price of $name is $price';
  }
}

class Inventory {
  Inventory(this.amount);

  final int amount;

  @override
  String toString() {
    return 'Inventory amount: $amount';
  }
}

class Stroe<P, I> {
  final HashMap<P, I> catalog = HashMap<P, I>();

  List<P> get products => catalog.keys.toList();

  void updateInventory(P product, I inventory) {
    print('update product$product and inventory $inventory');
    catalog[product] = inventory;
  }

  void printProduct() {
    print('print products');
    catalog.keys.forEach(
      (product) => print('Product  $product is  ${catalog[product]}'),
    );
  }
}

class MyStore<MyProduct, MyInventory> {
  final HashMap<MyProduct, MyInventory> catalog =
      HashMap<MyProduct, MyInventory>();

  List<MyProduct> get products => catalog.keys.toList();
  void updateInverntory(MyProduct product, MyInventory inventory) {
    catalog[product] = inventory;
  }

  void printProduct() {
    catalog.keys.forEach(
      (element) => print(' Product $element is ${catalog[element]}'),
    );
  }
}
