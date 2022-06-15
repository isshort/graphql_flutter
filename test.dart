import 'dart:collection';

void main() {
  // data['named']['result']['data']

  final data = {
    'name': {
      'result': {
        'data': ['wahidi', 'salam']
      }
    }
  };
  print(data.runtimeType);
  List<String>? mapData() {
    return data['name']!['result']!['data'];
  }

  ;

  // void testFunction([List<dynamic] args=[]){

  // }

  // final Object? obj1 = <T>['name']!['result']!!['data'];
  print(mapData()?[0]);
  //  print(data['name']!['result']!['data']![0]);

  void superheroes(List<String> heroNames) {
    for (final superHero in heroNames) {
      // var obj = data[superHero]!;
       
    }
  }

  superheroes(['result', 'data', 'salam']);
}
