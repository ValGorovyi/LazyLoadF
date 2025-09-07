import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: UpperDemoInherit()));
}

class UpperDemoInherit extends StatefulWidget {
  @override
  State<UpperDemoInherit> createState() => _UpperDemoInheritState();
}

class _UpperDemoInheritState extends State<UpperDemoInherit> {
  int value = 0;
  void onTab() {
    value = value + 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('demo inherit')),
      body: Center(
        child: Column(
          children: [
            TextButton(onPressed: onTab, child: Text('Tab to show')),
            InheritDemo(value: value, child: StateLDemo()),
            InheritDemo(value: value, child: StateFDemo()),
          ],
        ),
      ),
    );
  }
}

class InheritDemo extends InheritedWidget {
  final int value;
  const InheritDemo({required this.value, Key? key, required Widget child})
    : super(child: child, key: key);
  @override
  bool updateShouldNotify(InheritDemo oldWidget) {
    return value != oldWidget.value;
  }
}

class StateLDemo extends StatelessWidget {
  const StateLDemo({super.key});
  @override
  Widget build(BuildContext context) {
    final value =
        context.dependOnInheritedWidgetOfExactType<InheritDemo>()?.value ?? 0;
    return Text('$value');
  }
}

class StateFDemo extends StatefulWidget {
  const StateFDemo({super.key});
  @override
  State<StateFDemo> createState() => _StateFDemoState();
}

class _StateFDemoState extends State<StateFDemo> {
  @override
  Widget build(BuildContext context) {
    final value = getInheritHelper(context).value ?? 0;
    return Text('$value');
  }
}

I? getInheritHelper<I>(BuildContext context) {
  final elem = context.getElementForInheritedWidgetOfExactType<InheritDemo>();
  final widget = elem?.widget;
  if (widget is I) {
    return widget as I;
  } else {
    return null;
  }
}
