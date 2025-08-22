import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ButtonApp()));
}

class ButtonApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ButtonApp();
}

class _ButtonApp extends State<ButtonApp> {
  String demoText = 'no press';
  @override
  Widget build(BuildContext context) {
    void tabToFirst() {
      setState(() {
        demoText = 'tab fist string';
      });
    }

    void tabToSecond() {
      setState(() {
        demoText = 'tab sec string';
      });
    }

    void tabToThirt() {
      setState(() {
        demoText = 'tab thirt string';
      });
    }

    final style = ButtonStyle(
      backgroundColor: WidgetStatePropertyAll<Color>(Colors.lightGreenAccent),
      foregroundColor: WidgetStatePropertyAll<Color>(Colors.blueAccent),
      overlayColor: WidgetStatePropertyAll<Color>(Colors.red), //pri nazhatii
      shadowColor: WidgetStatePropertyAll<Color>(Colors.pinkAccent),
      surfaceTintColor: WidgetStatePropertyAll<Color>(Colors.yellow),
      elevation: WidgetStatePropertyAll<double>(7), // visota tenei
      padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
        EdgeInsetsGeometry.all(0),
      ),
      minimumSize: WidgetStatePropertyAll<Size>(Size(100, 100)),
      // elevation: WidgetStatePropertyAll(22),
      // this.fixedSize,
      // this.maximumSize,
      // this.iconColor,
      // this.iconSize,
      // this.iconAlignment,
      // this.side,
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(50),
          side: BorderSide(color: Colors.black),
        ),
      ),
      // mouseCursor: WidgetStateProperty<MouseCursor>(mouseCursor ),
      // this.visualDensity,
      // this.tapTargetSize,
      // this.animationDuration,
      // this.enableFeedback,
      alignment: Alignment.topLeft, // ???
      // this.splashFactory,
      // this.backgroundBuilder,
      // this.foregroundBuilder,
    );
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$demoText'),
            ElevatedButton(
              clipBehavior: Clip.hardEdge, // prachet text kotoriy vilez
              style: style,
              onPressed: () {
                tabToFirst();
                setState(() {});
              },
              child: Row(
                children: [
                  Icon(Icons.ac_unit_outlined),
                  Text('ncn,mxc dkcn'),
                  Container(
                    color: Colors.lightBlue,
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
            ),
            OutlinedButton(
              style: style,
              onPressed: () {
                tabToSecond();
              },
              child: Text('OutlinedButton'),
            ),
            TextButton(
              style: style,
              onLongPress: () {
                print('long press on text b');
              },
              onPressed: () {
                tabToThirt();
                setState(() {});
              },
              child: Text('TextButton'),
            ),
            IconButton(
              // style: style,
              splashRadius: 300,
              enableFeedback: false,
              splashColor: Colors.purple,
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(40),
              onPressed: () {},
              icon: Icon(Icons.snooze),
            ),
            // Container(
            //   width: 300,
            //   height: 300,
            //   child: IconButton(
            //     splashRadius: 33,
            //     splashColor: Colors.yellow,
            //     alignment: Alignment.bottomRight,
            //     padding: EdgeInsets.all(40),
            //     onPressed: () {},
            //     icon: Icon(Icons.snooze),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
