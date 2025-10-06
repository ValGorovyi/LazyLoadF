import 'package:big_study/hiveLes/hiveModel.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(MaterialApp(home: HiveLessonW()));
}

class HiveLessonW extends StatelessWidget {
  final model = HiveModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Hive')),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => model.interactionWithDB(),
                child: Text('interaction with the database'),
              ),
              ElevatedButton(
                onPressed: () => model.setup(),
                child: Text('Setup database'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
