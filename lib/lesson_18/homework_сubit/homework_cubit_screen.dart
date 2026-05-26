import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_homework/lesson_18/homework_%D1%81ubit/homework_cubit_logic.dart';

class HomeworkCubitScreen extends StatefulWidget {
  const HomeworkCubitScreen({super.key});

  @override
  State<HomeworkCubitScreen> createState() => _HomeworkCubitScreenState();
}

class _HomeworkCubitScreenState extends State<HomeworkCubitScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => HWCubitLogic())],
      child: Scaffold(
        appBar: AppBar(title: Text('Cubit Homework')),
        body: CubitView(),
      ),
    );
  }
}

class CubitView extends StatelessWidget {
  const CubitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16,
        children: [
          Text('CUBIT Homework Screen', style: TextStyle(fontSize: 24)),
          BlocBuilder<HWCubitLogic, int>(
            builder: (context, state) {
              return Text(
                //context.watch<HomeworkBlocLogic>().state.toString(),
                '$state',
                style: TextStyle(fontSize: 24),
              );
            },
          ),
          FloatingActionButton(
            onPressed: () => context.read<HWCubitLogic>().increment(),
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => context.read<HWCubitLogic>().decrement(),
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
