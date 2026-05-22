import 'package:flutter/material.dart';
import 'package:flutter_homework/widgets_main_screen.dart';
import 'package:go_router/go_router.dart';

class StateManagementBaseScreen extends StatefulWidget {
  const StateManagementBaseScreen({super.key});

  @override
  State<StateManagementBaseScreen> createState() =>
      _StateManagementBaseScreenState();
}

class _StateManagementBaseScreenState extends State<StateManagementBaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('State Management Base Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NavigationCard(
              title: 'BLOC_BLOCK',
              description: '...',
              onTap: () => context.goNamed('BLOCK'),
            ),
            NavigationCard(
              title: 'BLOCK_CUBIT',
              description: '...',
              onTap: () => context.goNamed('CUBIT'),
            ),
          ],
        ),
      ),
    );
  }
}
