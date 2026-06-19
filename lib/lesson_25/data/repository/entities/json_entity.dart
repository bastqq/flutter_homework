import 'package:flutter_homework/lesson_25/data/repository/dto/json_decode.dart';

class MyJsonEntity {
  MyJsonEntity({
    required this.chequeId,
    required this.sumReg,
    required this.chPrediction,
    required this.items,
  });

  MyJsonEntity.fromDto(JsonDto dto)
    : chPrediction = dto.chPrediction ?? 'no data',

      chequeId = dto.chequeHeader?.chequeId ?? 0,
      sumReg = dto.chequeHeader?.sumReg ?? 0.00,
      items =
          dto.chequeLines?.map((itemDto) {
            return itemDto.lagerNameUa ?? 'no data';
          }).toList() ??
          [];

  final int chequeId;
  final double sumReg;
  List<String> items;
  final String chPrediction;
}
