import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_todo/modules/logic/cubit/cubit.dart';

class CustomNavigationBar extends StatelessWidget {
  CustomNavigationBar({super.key});

  final destination = <NavigationDestination>[
    const NavigationDestination(
      icon: Icon(Icons.home_outlined),
      label: 'home',
      tooltip: 'home page',
      selectedIcon: Icon(Icons.home),
    ),
    const NavigationDestination(
      icon: Icon(Icons.search_outlined),
      label: 'search',
      tooltip: 'search',
      selectedIcon: Icon(Icons.search),
    ),
    const NavigationDestination(
      icon: Icon(Icons.menu_outlined),
      label: 'menu',
      tooltip: 'menu',
      selectedIcon: Icon(Icons.menu),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return NavigationBar(
          selectedIndex: state.val,
          destinations: destination,
          onDestinationSelected: context.read<HomeCubit>().change,
        );
      },
    );
  }
}
