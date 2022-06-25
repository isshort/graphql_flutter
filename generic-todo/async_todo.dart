typedef FactoryFuncData<T, P1, P2> = T Function(P1 param1, P2 param2);
typedef FuncAsyncData<T, P1, P2> = Future<T> Function(P1 param1, P2 param2);

void main() {
  // String factoryFuncData<String>(int a, int b) {
  //   return 'your value is $b and $a' as String;
  // }

  // print(factoryFuncData<String>(4, 3));

  // ToDo.data((dynamic param1, dynamic param2) => 'data');

  Future<String> FuncAsyncData(int a, int b) async {
    print('1111');
    await Future.delayed(Duration(seconds: 2), () {
      print("future time ");
    });

    return 'your string is $a and $b';
  }

  print(FuncAsyncData(34, 34));
}

// FuncAsyncData<String>(String p1, int p2) async {}
class ToDo {
  static void data(FactoryFuncData data) {
    print('your data inside of ToDo class is ${data}');
  }
}
