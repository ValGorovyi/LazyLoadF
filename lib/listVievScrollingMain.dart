import 'package:flutter/material.dart';

// tekst v textField pri nachale scrolla budet sohranen. resursozatratno
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: ListView.separated(
          addAutomaticKeepAlives: true,
          itemCount: 300,
          itemBuilder: (BuildContext content, int index) {
            return AppText(text: index.toString());
          },
          separatorBuilder: (BuildContext content, int index) {
            return Container(
              width: double.infinity,
              height: 22,
              color: Colors.blueAccent,
            );
          },
        ),
      ),
    ),
  );
}

class AppText extends StatefulWidget {
  final String text;
  AppText({required this.text});

  _AppText createState() => _AppText();
}

class _AppText extends State<AppText> with AutomaticKeepAliveClientMixin {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.text);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return TextField(controller: controller);
  }

  @override
  bool get wantKeepAlive => true;
}

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       itemCount: 3000,
//       physics: BouncingScrollPhysics(),
//       itemBuilder: (BuildContext context, int index) {
//         return Text('$index');
//       },
//       separatorBuilder: (BuildContext context, int index) {
//         return Container(
//           width: double.infinity,
//           height: 30,
//           color: Colors.deepOrangeAccent,
//         );
//       },
//     );
//   }
// }
