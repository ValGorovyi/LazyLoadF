import 'package:flutter/material.dart';

class SimpleCalcInherit extends InheritedWidget {
  final SimpleCalcWidgetModel model;
  SimpleCalcInherit({required this.model, required super.child});
  static SimpleCalcInherit? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SimpleCalcInherit>();
  }

  @override
  bool updateShouldNotify(covariant SimpleCalcInherit oldWidget) {
    return model != oldWidget.model;
  }
}

class SimpleCalcWidgetModel extends ChangeNotifier {
  int? _firstNum;
  int? _secondNum;
  int? resultNum;

  set firstNum(String value) => _firstNum = int.tryParse(value);
  set secondNum(String value) => _secondNum = int.tryParse(value);
  void sum() {
    int? localRes;
    if (_firstNum != null && _secondNum != null) {
      localRes = _firstNum! + _secondNum!;
    } else {
      return null;
    }
    if (localRes != this.resultNum) {
      resultNum = localRes;
      notifyListeners();
    }
  }
}
