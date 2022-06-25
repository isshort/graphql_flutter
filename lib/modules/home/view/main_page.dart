import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_todo/core/locator/locator.dart';
import 'package:flutter_graphql_todo/modules/home/view/widgets/body.dart';
import 'package:flutter_graphql_todo/modules/home/view/widgets/navigation.dart';
import 'package:flutter_graphql_todo/modules/logic/cubit/home_cubit.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<HomeCubit>(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            // appBar: AppBar(title: const Text('MainPage Title')),
            body: Body(),
            bottomNavigationBar: CustomNavigationBar(),
          );
        },
      ),
    );
  }
}
