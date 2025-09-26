import 'package:big_study/httpLes/domein/inheritData/modelApi.dart';
import 'package:flutter/material.dart';

class apiInherit extends InheritedNotifier {
  final modelApi model;
  const apiInherit({required this.model, Key? key, required Widget child})
    : super(child: child, key: key, notifier: model);

  static apiInherit? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<apiInherit>();
  }

  static apiInherit? read(BuildContext context) {
    final widgt = context
        .getElementForInheritedWidgetOfExactType<apiInherit>()
        ?.widget;
    return widgt is apiInherit ? widgt : null;
  }
}
