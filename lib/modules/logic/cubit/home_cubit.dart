import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_graphql_todo/modules/home/data/repo/home_repo.dart';
import 'package:flutter_graphql_todo/modules/home/home.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepository) : super(const HomeState(0));

  final HomeRepository homeRepository;
  void change(int val) => emit(HomeState(val));

  Future<List<Product>> getProducts() async {
    final _productList = await homeRepository.getProducts();
    print(_productList);
    return _productList.fold(
      (l) => throw Exception('Some error was happend'),
      (r) => r,
    );
  }
}
