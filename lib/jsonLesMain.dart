import 'dart:convert';

import 'package:big_study/jsonLesDataDemo/exampleData.dart';
import 'package:big_study/jsonLesDataDemo/humanData.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: JsonLesW()));
}

class JsonLesW extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('JSON DEMO')),
      body: SafeArea(
        child: JsonInherit(coder: JsonCoder(), child: ButtonWidget()),
      ),
    );
  }
}

class JsonInherit extends InheritedWidget {
  final JsonCoder coder;

  const JsonInherit({required this.coder, required Widget child, super.key})
    : super(child: child);

  static JsonInherit? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<JsonInherit>()
        ?.widget;
    return widget is JsonInherit ? widget : null;
  }

  static JsonInherit? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<JsonInherit>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class JsonCoder {
  void decode() {
    try {
      final myJson = jsonDecode(jsonData) as List<dynamic>;
      final humans = myJson
          .map((dynamic e) => Human.fromJson(e as Map<String, dynamic>))
          .toList();
      print(humans);
    } catch (error) {
      print(error); // instance of Human
    }
  }

  void encode() {
    try {
      final obj = humansDataNoJson.map((elem) => elem.toJson()).toList();
      final jsonString = jsonEncode(obj);
      print(jsonString);
    } catch (error) {
      print(error);
    }
  }
}

class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => JsonInherit.read(context)?.coder.decode(),
            child: Text('DeCode'),
          ),
          ElevatedButton(
            onPressed: () => JsonInherit.read(context)?.coder.encode(),
            child: Text('EnCode'),
          ),
        ],
      ),
    );
  }
}
