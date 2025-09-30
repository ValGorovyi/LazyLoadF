import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart' as pathProvider;

class FilesInherit extends InheritedNotifier {
  final FilesModel model;
  const FilesInherit({required this.model, Key? key, required Widget child})
    : super(child: child, key: key);

  static FilesInherit? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FilesInherit>();
  }

  static FilesInherit? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<FilesInherit>()
        ?.widget;
    return widget is FilesInherit ? widget : null;
  }
}

class FilesModel extends ChangeNotifier {
  void modefierFiles() async {
    final directory = await pathProvider.getApplicationDocumentsDirectory();

    final pathToFile = directory.path + '/ValDoneF.txt';

    final file = File(pathToFile); // ne soderzhimoe file
    // await file.writeAsString('hello world, ave val done'); // zapis v file
    final existF = await file.exists(); // sushestvovanie file
    if (!existF) {
      await file.create();
    }
    final strFile = await file.readAsString();
    final stats = await file.stat();
    print(existF);
    print(strFile);
    print(stats);
  }
}
