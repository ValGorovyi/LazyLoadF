import 'package:flutter/material.dart';

class ChildLayaudApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.blueAccent,
        child: CustomMultiChildLayout(
          delegate: MyMultiChildLayoutDelegate(),
          children: [
            // Container() // error
            LayoutId(
              id: 1,
              child: Text(
                'left igjkg  hjg jg uig  ui gvjhf ugvkgjon klkj,m g uhj jg',
                textDirection: TextDirection.ltr,
              ),
            ),
            LayoutId(
              id: 2,
              child: Text(
                'center fdhgkj  dsn jk esfjk dhsk  kdshf kj kjds fj sdih  dsjh k dhf lkk ;sn ; ',
                textDirection: TextDirection.ltr,
              ),
            ),
            LayoutId(
              id: 3,
              child: Text(
                'test hhk hkl hlk xdk kxjnv ck gkj jgk ',
                textDirection: TextDirection.ltr,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyMultiChildLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  Size getSize(BoxConstraints constraints) {
    return Size(constraints.biggest.width, 100);
  }

  @override
  void performLayout(Size size) {
    if (hasChild(1) && hasChild(2) && hasChild(3)) {
      final minWidthElem = 50;

      final firstElemMaxWidth = size.width - minWidthElem * 2; // main elem

      final firstElemSize = layoutChild(
        1,
        BoxConstraints.loose(Size(firstElemMaxWidth, size.height)),
      );
      final secondElemWidth = size.width - firstElemSize.width - minWidthElem;
      final secondElemSize = layoutChild(
        2,
        BoxConstraints.loose(Size(secondElemWidth, size.height)),
      );
      final thirtElemWidth =
          size.width - firstElemSize.width - secondElemSize.width;
      final thirtElemSize = layoutChild(
        3,
        BoxConstraints.loose(Size(thirtElemWidth, size.height)),
      );

      final firstElemYOffset = size.height / 2 - firstElemSize.height / 2;
      positionChild(1, Offset(0, firstElemYOffset));
      var secondElemXOffset = size.width / 2 - secondElemSize.width / 2;
      final thirtElemXOffset = size.width - thirtElemSize.width;
      final thirtElemYOffset = size.height / 2 - thirtElemSize.height / 2;
      positionChild(3, Offset(thirtElemXOffset, thirtElemYOffset));

      final secondElemYOffset = size.height / 2 - secondElemSize.height / 2;
      if (firstElemSize.width > secondElemXOffset) {
        secondElemXOffset = firstElemSize.width + 1;
      } else if (thirtElemXOffset < secondElemXOffset + secondElemSize.width) {
        secondElemXOffset = thirtElemXOffset - secondElemSize.width - 1;
      }
      positionChild(2, Offset(secondElemXOffset, secondElemYOffset));
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
}

// class MyMultiChildLayoutDelegate extends MultiChildLayoutDelegate {
//   @override
//   Size getSize(BoxConstraints constraints) {
//     return Size(constraints.biggest.width, 100);
//   }

//   @override
//   void performLayout(Size size) {
//     final x = hasChild(1);
//     final e = hasChild(2);
//     final y = hasChild(3);

//     if (x && e && y) {
//       layoutChild(1, BoxConstraints.loose(size));
//       layoutChild(2, BoxConstraints.tight(Size(50, size.height)));
//       layoutChild(3, BoxConstraints.loose(size));

//       positionChild(1, Offset(0, 40));
//       positionChild(2, Offset(0, -50));
//       positionChild(3, Offset(200, 0));
//     }
//   }

//   @override
//   bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
//     return true;
//   }
// }

// Container(
//         color: Colors.red,
//         child: CustomMultiChildLayout(
//           delegate: MyMultiChildLayoutDelegate(),
//           children: [
//             // Container() // error
//             LayoutId(
//               id: 1,
//               child: Container(width: 100, height: 100, color: Colors.pink),
//             ),
//             LayoutId(id: 2, child: Container(color: Colors.green)),
//             LayoutId(
//               id: 3,
//               child: Text('test text', textDirection: TextDirection.ltr),
//             ),
//           ],
//         ),
//       ),

// custom single child layoud
// class ChildLayaudApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         color: Colors.blueAccent,
//         child: CustomSingleChildLayout(
//           delegate: MyCustomSingleChildLayout(),
//           child: Container(width: 200, height: 200, color: Colors.red),
//         ),
//       ),
//     );
//   }
// }

// class MyCustomSingleChildLayout extends SingleChildLayoutDelegate {
//   @override
//   Size getSize(BoxConstraints constraints) {
//     return Size(320, 300); // rozmer roditelu vverx po derevu. docherniy mb bolshe
//   }
//   @override
//   BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
//     return BoxConstraints.tight(Size(100, 100)); // razmer dochernego
//   }
//   @override
//   Offset getPositionForChild(Size size, Size childSize) {
//     // mozno schitat cherez raxmeny
//     // final test = size.height / 2;
//     // return Offset(test, test); // smeshenive rebenka
//     final polovinaH = size.height / 2 - childSize.height /2;
//     final polovinaW = size.width / 2 - childSize.width/2 ;
//     return Offset(polovinaW, polovinaH);
//   }

//   @override
//   bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
//     return true;
//   }
// }
