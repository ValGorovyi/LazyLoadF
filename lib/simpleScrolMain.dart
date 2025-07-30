import 'package:flutter/material.dart';

void main() {
  runApp(ScrollWidget());
}

class ScrollWidget extends StatefulWidget {
  ScrollWidget({super.key});

  @override
  State<ScrollWidget> createState() => _ScrollWidgetState();
}

class _ScrollWidgetState extends State<ScrollWidget> {
  var items = <Widget>[];

  final controller = ScrollController(
    keepScrollOffset: false,
    // initialScrollOffset: 432,
  );

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1)).then((e) {
      controller.animateTo(
        100,
        duration: Duration(seconds: 1),
        curve: Curves.easeOutCirc,
      );
    });
    // controller.addListener(() {
    //   print('${controller.position}');
    // });
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 300; i++) {
      final neededWidget = Text(i.toString(), textDirection: TextDirection.ltr);
      items.add(neededWidget);
    }

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(), // iphone scroll
      reverse: true, //nachalnaya tochka v konce
      child: Container(
        width: double.infinity,
        child: Column(children: items),
      ),
    );
  }
}
