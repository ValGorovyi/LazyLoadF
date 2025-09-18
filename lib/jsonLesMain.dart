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
  void decode() {}
  void encode() {}
}

class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(onPressed: () {}, child: Text('DeCode')),
          ElevatedButton(onPressed: () {}, child: Text('EnCode')),
        ],
      ),
    );
  }
}
