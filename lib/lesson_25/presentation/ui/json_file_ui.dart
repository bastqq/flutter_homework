import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_homework/lesson_25/presentation/bloc/json_bloc.dart';

class JsonFileUi extends StatefulWidget {
  const JsonFileUi({super.key});

  @override
  State<JsonFileUi> createState() => _JsonFileUiState();
}

class _JsonFileUiState extends State<JsonFileUi> {
  // JsonEntity? _jsonEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widgets'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: BlocBuilder<MyJsonCubit, JsonState>(
        builder: (context, state) {
          return switch (state) {
            JsonLoading() => const CircularProgressIndicator(),

            MyJsonLoaded() => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 4,
                    child: ListTile(
                      title: Text(
                        'chequeId',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '${state.myJsonEntity.chequeId}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: ListTile(
                      title: Text(
                        'sumReg',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '${state.myJsonEntity.sumReg}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: ListTile(
                      title: Text(
                        'chPrediction',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        state.myJsonEntity.chPrediction,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: ListTile(
                      title: Text(
                        'chequeId',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '${state.myJsonEntity.chequeId}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: ListTile(
                      title: Text(
                        'items',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '${state.myJsonEntity.items}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            _ => const Center(
              child: Text(
                'no data',
                //chequeMagicName
              ),
            ),
          };
        },
      ),
    );
  }
}

// {const JsonFileUi({super.key});}
