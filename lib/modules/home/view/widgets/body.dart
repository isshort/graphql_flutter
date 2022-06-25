import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_todo/modules/home/view/pages/menu_page.dart';
import 'package:flutter_graphql_todo/modules/home/view/pages/product_page_view.dart';
import 'package:flutter_graphql_todo/modules/home/view/pages/search_page.dart';

import 'package:flutter_graphql_todo/modules/logic/cubit/cubit.dart';

class Body extends StatelessWidget {
  Body({super.key});

  final pages = <Widget>[
    const ProductPageView(),
    const SearchPage(),
    const MenuPage(),
  ];
  @override
  Widget build(BuildContext context) {
    // return pages[2];
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return pages[state.val];
      },
    );
  }
}
