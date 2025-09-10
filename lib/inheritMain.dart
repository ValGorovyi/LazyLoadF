import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: UpperDemoInherit()));
}

class UpperDemoInherit extends StatefulWidget {
  @override
  State<UpperDemoInherit> createState() => _UpperDemoInheritState();
}

class _UpperDemoInheritState extends State<UpperDemoInherit> {
  int firstValue = 0;
  int secondValue = 0;
  void onFirstTab() {
    firstValue = firstValue + 1;
    setState(() {});
  }

  void onSecondTab() {
    secondValue = secondValue + 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('demo inherit')),
      body: Center(
        child: Column(
          children: [
            TextButton(onPressed: onFirstTab, child: Text('Tab to 1')),
            TextButton(onPressed: onSecondTab, child: Text('Tab to 2')),

            InheritDemo(
              firstValue: firstValue,
              secondValue: secondValue,
              child: const StateLDemo(),
            ),
            // InheritDemo(
            //   secondValue: secondValue,
            //   firstValue: firstValue,
            //   child: StateFDemo(),
            // ),
          ],
        ),
      ),
    );
  }
}

class InheritDemo extends InheritedModel<String> {
  final int firstValue;
  final int secondValue;
  const InheritDemo({
    required this.secondValue,
    required this.firstValue,
    Key? key,
    required Widget child,
  }) : super(child: child, key: key);
  @override
  bool updateShouldNotify(InheritDemo oldWidget) {
    return firstValue != oldWidget.firstValue ||
        secondValue != oldWidget.secondValue;
  }

  @override
  bool updateShouldNotifyDependent(
    covariant InheritDemo oldWidget,
    Set<String> aspect,
  ) {
    final isFirstUpdate =
        firstValue != oldWidget.firstValue && aspect.contains('first');
    final isSecondUpdate =
        secondValue != oldWidget.secondValue && aspect.contains('second');
    return isFirstUpdate || isSecondUpdate;
  }
}

class StateLDemo extends StatelessWidget {
  const StateLDemo({super.key});
  @override
  Widget build(BuildContext context) {
    final value =
        context
            .dependOnInheritedWidgetOfExactType<InheritDemo>(aspect: 'first')
            ?.firstValue ??
        0;
    return Column(children: [Text('$value'), const StateFDemo()]);
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
    final value =
        context
            .dependOnInheritedWidgetOfExactType<InheritDemo>(aspect: 'second')
            ?.secondValue ??
        0;
    // final value = getInheritHelper(context).value ?? 0;
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
