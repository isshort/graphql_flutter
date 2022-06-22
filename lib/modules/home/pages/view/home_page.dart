import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_todo/core/locator/locator.dart';
import 'package:flutter_graphql_todo/modules/auth/cubit/auth_cubit.dart';
import 'package:flutter_graphql_todo/modules/home/pages/logic/cubit/home_cubit.dart';

import 'package:flutter_graphql_todo/modules/home/pages/view/product_page_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>(),
      child: const ProductPageView(),
    );
  }
}
