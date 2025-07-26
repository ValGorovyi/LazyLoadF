import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// https://habr.com/ru/articles/500210/

class AppTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox.expand(
          child: Container(
            color: Colors.blue,
            child: Column(children: [Text('Hello!'), Text('Goodbye!')]),
          ),
        ),
      ),
    );
  }
}

// UnconstrainedBox(
//       child: Container(
//         color: Colors.red,
//         width: double.infinity,
//         height: 100, // err
//       ),
//     );

// OverflowBox(
//       minWidth: 0.0,
//       minHeight: 0.0,
//       maxWidth: double.infinity,
//       maxHeight: double.infinity,
//       child: Container(color: Colors.red, width: 4000, height: 50), // no err
//     )

// UnconstrainedBox(
//       child: Container(color: Colors.red, width: 2000, height: 50), //  err
//     );

// Center(
//       child: ConstrainedBox(
//         constraints: BoxConstraints(
//           minWidth: 70,
//           minHeight: 70,
//           maxWidth: 150,
//           maxHeight: 150,
//         ),
//         child: Container(color: Colors.red, width: 1, height: 100), //max 150, min 70
//       ),
//     );

// Center(
//       child: Container(
//         width: 300,
//         color: Colors.red,
//         child: Container(color: Colors.green, width: 30, height: 30), //green 300 / 30
//       ),
//     );
