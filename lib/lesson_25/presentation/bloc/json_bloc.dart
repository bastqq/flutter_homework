import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_homework/lesson_25/data/repository/dto/json_decode.dart';
import 'package:flutter_homework/lesson_25/data/repository/entities/json_entity.dart';

abstract class JsonState {}

class JsonLoading extends JsonState {}

class JsonStateInitial extends JsonState {}

class MyJsonLoaded extends JsonState {
  MyJsonLoaded(this.myJsonEntity);
  final MyJsonEntity myJsonEntity;
}

class MyJsonCubit extends Cubit<JsonState> {
  MyJsonCubit() : super(JsonStateInitial());

  //emit(JsonLoading());

  Future<void> loadJsonData() async {
    final jsonFile = await rootBundle.loadString(
      'assets/json/silpo_cheque_example.json',
    );

    //   final  jsonFile = await rootBundle.loadString( 'assets/json/silpo_cheque_example.json',);

    final jsonMap = jsonDecode(jsonFile) as Map<String, dynamic>;

    final json = JsonDto.fromJson(jsonMap);
    final myJsonEntity = MyJsonEntity.fromDto(json);

    emit(MyJsonLoaded(myJsonEntity));
  }
}
