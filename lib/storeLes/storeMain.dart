import 'package:big_study/storeLes/storeLogic.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: StateLessonUpperW()));
}

class StateLessonUpperW extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Simle state')),
      body: SafeArea(child: Center(child: ButtonsW())),
    );
  }
}

class ButtonsW extends StatelessWidget {
  final _model = StoreDemoModel();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => _model.setSimpleStorage(),
          child: Text('Set Simple Data'),
        ),
        ElevatedButton(
          onPressed: () => _model.getSimpleStorage(),
          child: Text('Get Simple Data'),
        ),
        SizedBox(height: 25),
        ElevatedButton(
          onPressed: () => _model.setSecurityStorage(),
          child: Text('Set Security Data'),
        ),
        ElevatedButton(
          onPressed: () => _model.getSecurityStorage(),
          child: Text('Get Security Data'),
        ),
      ],
    );
  }
}
