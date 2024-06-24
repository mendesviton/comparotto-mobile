import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../core/widgets/standard_bottom_sheet.dart';

enum StockType { up, down }

List<StockItemModel> stockHomeList = [
  StockItemModel(
      type: StockType.down, title: 'Farinha de rosca', date: '03/06/2000'),
  StockItemModel(type: StockType.up, title: 'Pão', date: '03/06/2000'),
  StockItemModel(type: StockType.up, title: 'Carne moída', date: '03/06/2000'),
  StockItemModel(
      type: StockType.down, title: 'Farinha de rosca', date: '03/06/2000'),
];

class StockItemModel {
  StockType type;
  String title;
  String date;
  StockItemModel({
    required this.type,
    required this.title,
    required this.date,
  });
}

class HomeButtonModel {
  String urlImage;
  String title;
  Color color;
  Color textColor;
  StandardBottomSheetParams standardBottomSheetParams;
  HomeButtonModel({
    required this.standardBottomSheetParams,
    required this.urlImage,
    required this.title,
    required this.color,
    required this.textColor,
  });

  HomeButtonModel copyWith({
    String? urlImage,
    String? title,
    Color? color,
    Color? textColor,
  }) {
    return HomeButtonModel(
      urlImage: urlImage ?? this.urlImage,
      title: title ?? this.title,
      color: color ?? this.color,
      textColor: textColor ?? this.textColor,
      standardBottomSheetParams: standardBottomSheetParams,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'urlImage': urlImage,
      'title': title,
      'color': color.value,
      'textColor': textColor.value,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'HomeButtonModel(urlImage: $urlImage, title: $title, color: $color, textColor: $textColor)';
  }

  @override
  bool operator ==(covariant HomeButtonModel other) {
    if (identical(this, other)) return true;

    return other.urlImage == urlImage &&
        other.title == title &&
        other.color == color &&
        other.textColor == textColor;
  }

  @override
  int get hashCode {
    return urlImage.hashCode ^
        title.hashCode ^
        color.hashCode ^
        textColor.hashCode;
  }
}
