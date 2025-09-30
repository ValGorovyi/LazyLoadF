import 'package:big_study/filesLesson/filesInherit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: FilesLessonW()));
}

class FilesLessonW extends StatelessWidget {
  final model = FilesModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Files Less'))),
      body: SafeArea(
        child: FilesInherit(
          model: model,
          child: Center(child: ButtonW()),
        ),
      ),
    );
  }
}

class ButtonW extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => FilesInherit.read(context)?.model.modefierFiles(),
      child: Text('Modefier files'),
    );
  }
}
