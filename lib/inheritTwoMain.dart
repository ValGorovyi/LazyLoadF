import 'package:big_study/logikInherit/InheritTwoLogik.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: InheritDemoTwo()));
}

class InheritDemoTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inherit demo')),
      body: SafeArea(child: SimpleCalcWidget()),
    );
  }
}

class SimpleCalcWidget extends StatefulWidget {
  @override
  State<SimpleCalcWidget> createState() => _SimpleCalcWidgetState();
}

class _SimpleCalcWidgetState extends State<SimpleCalcWidget> {
  final _model = SimpleCalcWidgetModel();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
        child: SimpleCalcInherit(
          model: _model,
          child: Column(
            children: [
              FirstInput(),
              SizedBox(height: 20),
              SecondInput(),
              SizedBox(height: 20),
              ButtonToCalc(),
              SizedBox(height: 20),
              ResultWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class FirstInput extends StatelessWidget {
  const FirstInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) =>
          SimpleCalcInherit.of(context)?.model.firstNum = value,
    );
  }
}

class SecondInput extends StatelessWidget {
  const SecondInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) =>
          SimpleCalcInherit.of(context)?.model.secondNum = value,
    );
  }
}

class ButtonToCalc extends StatelessWidget {
  const ButtonToCalc({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        SimpleCalcInherit.of(context)?.model.sum();
      },
      child: Text('Tab to show result'),
    );
  }
}

class ResultWidget extends StatefulWidget {
  const ResultWidget({super.key});

  @override
  State<ResultWidget> createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
  String result = '...';
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final model = SimpleCalcInherit.of(context)?.model;
    model?.addListener(() {
      result = '${model.resultNum}';
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('Result => $result');
  }
}
