import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';
part 'json_decode.g.dart';

final Future<String> jsonFile = rootBundle.loadString(
  'assets/json/silpo_cheque_example.json',
);
//final jsonMap = jsonDecode(jsonFile as String) as Map<String, dynamic>,

//final JsonDto json = JsonDto.fromJson(jsonMap);

@JsonSerializable(createToJson: false)
class JsonDto {
  JsonDto({
    required this.chequeHeader,
    required this.sumDiscount,
    required this.chequeLines,
    required this.chequeActions,
    required this.chPrediction,
    required this.sumCashback,
    required this.chequeMagicName,
    required this.feedbackRates,
  });

  factory JsonDto.fromJson(Map<String, dynamic> json) =>
      _$JsonDtoFromJson(json);

  final ChequeHeaderDto? chequeHeader;
  final double? sumDiscount;
  final List<ChequeLineDto>? chequeLines;
  final List<dynamic>? chequeActions;
  final String? chPrediction;
  final int? sumCashback;
  final String chequeMagicName;
  final List<dynamic>? feedbackRates;
}

@JsonSerializable(createToJson: false)
class ChequeActionDto {
  ChequeActionDto({
    required this.actionType,
    required this.actionTypeCodeName,
    required this.actionId,
    required this.discpercent,
    required this.discount,
    required this.varcharData,
  });

  factory ChequeActionDto.fromJson(Map<String, dynamic> json) =>
      _$ChequeActionDtoFromJson(json);

  final int? actionType;
  final String? actionTypeCodeName;
  final int? actionId;
  final int? discpercent;
  final double? discount;
  final String? varcharData;
}

@JsonSerializable(createToJson: false)
class ChequeHeaderDto {
  ChequeHeaderDto({
    required this.filId,
    required this.chequeId,
    required this.created,
    required this.loyaltyFactId,
    required this.businessCardId,
    required this.sumReg,
    required this.sumBalance,
    required this.filialName,
    required this.cityName,
    required this.frId,
    required this.zId,
    required this.frChequeId,
    required this.payType,
    required this.payTypeArray,
    required this.fiscalNumber,
    required this.externalOperationId,
  });

  factory ChequeHeaderDto.fromJson(Map<String, dynamic> json) =>
      _$ChequeHeaderDtoFromJson(json);

  final int? filId;
  final int? chequeId;
  final DateTime? created;
  final int? loyaltyFactId;
  final int? businessCardId;
  final double? sumReg;
  final double? sumBalance;
  final String? filialName;
  final String? cityName;
  final int? frId;
  final int? zId;
  final int? frChequeId;
  final int? payType;
  final List<dynamic>? payTypeArray;
  final String? fiscalNumber;
  final dynamic externalOperationId;
}

@JsonSerializable(createToJson: false)
class ChequeLineDto {
  ChequeLineDto({
    required this.chequeLineId,
    required this.lagerId,
    required this.lagerNameUa,
    required this.lagerUnit,
    required this.kolvo,
    required this.priceOut,
    required this.unitText,
    required this.fileName,
    required this.sumCashbackLine,
    required this.additionalData,
    required this.like,
  });

  factory ChequeLineDto.fromJson(Map<String, dynamic> json) =>
      _$ChequeLineDtoFromJson(json);

  final int? chequeLineId;
  final int? lagerId;

  @JsonKey(name: 'lagerNameUA')
  final String? lagerNameUa;
  final String? lagerUnit;
  final double? kolvo;
  final double? priceOut;
  final String? unitText;
  final String? fileName;
  final int? sumCashbackLine;
  final dynamic additionalData;
  final dynamic like;
}

@JsonSerializable(createToJson: false)
class AdditionalDataDto {
  AdditionalDataDto({
    required this.id,
    required this.title,
    required this.icon,
    required this.ratio,
    required this.sectionSlug,
    required this.companyId,
    required this.externalProductId,
    required this.slug,
    required this.classifierSapId,
    required this.brandId,
    required this.brandTitle,
    required this.weighted,
    required this.departmentName,
    required this.barcodes,
    required this.weight,
    required this.scanExcise,
  });

  factory AdditionalDataDto.fromJson(Map<String, dynamic> json) =>
      _$AdditionalDataDtoFromJson(json);

  final String? id;
  final String? title;
  final String? icon;
  final String? ratio;
  final String? sectionSlug;
  final String? companyId;
  final String? externalProductId;
  final String? slug;
  final String? classifierSapId;
  final String? brandId;
  final String? brandTitle;
  final bool? weighted;
  final String? departmentName;
  final List<String>? barcodes;
  final double? weight;
  final bool? scanExcise;
}

@JsonSerializable(createToJson: false)
class LikeDto {
  LikeDto({required this.contains});

  factory LikeDto.fromJson(Map<String, dynamic> json) =>
      _$LikeDtoFromJson(json);

  final bool? contains;
}
