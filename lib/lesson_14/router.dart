import 'package:flutter_homework/lesson_11/widgets_lesson_11.dart';
import 'package:flutter_homework/lesson_12/feat-FLAB-12-homework-p2.dart';
import 'package:flutter_homework/lesson_13/homework_lesson_13.dart';
import 'package:flutter_homework/lesson_18/homework_%D1%81ubit/homework_cubit_screen.dart';
import 'package:flutter_homework/lesson_18/homework_bloc/homework_bloc_screen.dart';
import 'package:flutter_homework/lesson_18/state_managment_base_screen.dart';
import 'package:flutter_homework/main.dart';
import 'package:flutter_homework/widgets_main_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: '/widgets',
          name: 'widgets',
          builder: (context, state) => const WidgetsScreen(),
          routes: [
            GoRoute(
              path: '/widgets/part1',
              name: 'Widgets1',
              builder:
                  (context, state) => const MyHomePage(title: 'Widgets Part 1'),
            ),
            GoRoute(
              path: '/widgets/part2',
              name: 'Widgets2',
              builder: (context, state) => const WidgetsP2(),
            ),
            GoRoute(
              path: '/widgets/constraints',
              name: 'Constraints',
              builder:
                  (context, state) => const WidgetConstrainsTrainingScreen(),
            ),
            GoRoute(
              path: '/widgets/STATE_MANAGMENT',
              name: 'STATE_MANAGMENT',
              builder: (context, state) => const StateManagementBaseScreen(),
              routes: [
                GoRoute(
                  path: '/widgets/block_BLOCK',
                  name: 'BLOCK',
                  builder: (context, state) => const HomeworkBlocScreen(),
                ),
                GoRoute(
                  path: '/widgets/block_CUBIT',
                  name: 'CUBIT',
                  builder: (context, state) => const HomeworkCubitScreen(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
