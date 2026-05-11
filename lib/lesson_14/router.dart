import 'package:flutter_homework/lesson_11/widgets_lesson_11.dart';
import 'package:flutter_homework/lesson_12/feat-FLAB-12-homework-p2.dart';
import 'package:flutter_homework/lesson_13/homework_lesson_13.dart';
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
          ],
        ),
      ],
    ),
  ],
);
