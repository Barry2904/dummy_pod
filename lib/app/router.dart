import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/counter/presentation/counter_screen.dart';
import '../features/users/presentation/user_list_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      // builder: (context, state) => const CounterScreen(),
      builder: (context, state) => const UserListScreen(),
    ),
  ],
);
