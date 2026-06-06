import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_homework/lesson_18/homework_bloc/homework_bloc_logic.dart';

class HomeworkBlocScreen extends StatefulWidget {
  const HomeworkBlocScreen({super.key});

  @override
  State<HomeworkBlocScreen> createState() => _HomeworkBlocScreenState();
}

class _HomeworkBlocScreenState extends State<HomeworkBlocScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => HomeworkBloc())],
      child: Scaffold(
        appBar: AppBar(title: Text('BLoC Homework')),
        body: BlocView(),
      ),
    );
  }
}

class BlocView extends StatelessWidget {
  const BlocView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16,
        children: [
          Text('BLoC Homework Screen', style: TextStyle(fontSize: 24)),
          BlocBuilder<HomeworkBloc, int>(
            builder: (context, state) {
              return Text('$state', style: TextStyle(fontSize: 24));
            },
          ),
          FloatingActionButton(
            onPressed: () => context.read<HomeworkBloc>().add(IncrementEvent()),
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => context.read<HomeworkBloc>().add(DecrementEvent()),
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
