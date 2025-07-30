import 'package:flutter/material.dart';

class StackApp extends StatelessWidget {
  const StackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(width: 300, height: 300, color: Colors.redAccent),
          Positioned(
            top: 30,
            right: 30,
            child: Text('Save data', textDirection: TextDirection.ltr,),
            )
        ],
      ),
    );
  }
}


// Stack(
//         alignment: Alignment.topRight,
//         children: [
//           Container(width: 300, height: 300, color: Colors.redAccent),
//           Container(
//             width: 300,
//             height: 300,
//             padding: EdgeInsets.only(top: 30, right: 30),
//             child: Align(
//               alignment: Alignment.topRight,
//               child: Text('Save message ', textDirection: TextDirection.ltr),
//             ),
//           ),
//         ],
//       ),

// Stack(
//         // alignment: AlignmentDirectional.bottomStart, // error? hz
//         alignment: Alignment.topLeft,
//         children: <Widget>[
//           Container(width: 300, height: 300, color: Colors.red),
//           Container(width: 200, height: 200, color: Colors.green),
//           Positioned(
//             right: 10,// tanet po ukazanim parametram
//             top: 30,
//             bottom: 10,
//             child: Container(width: 80, height: 80, color: Colors.blue),
//           ),
//         ],
//       ),