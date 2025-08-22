import 'dart:math';

import 'package:flutter/material.dart';

class CircleProgresApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(border: Border.all(color: Colors.black87)),
          child: RadialPersentWidget(
            percentInDouble: 0.33,
            backCircleColor: Colors.black87,
            customChild: Padding(
              padding: const EdgeInsets.all(11.0),
              child: Text(
                '33%',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            lineWidth: 10,
            lowerArcColor: Colors.green,
            upperArcColor: Colors.yellow,
          ),
        ),
      ),
    );
  }
}

class RadialPersentWidget extends StatelessWidget {
  final Widget customChild;
  final double percentInDouble;
  final Color backCircleColor;
  final Color upperArcColor;
  final Color lowerArcColor;
  final double lineWidth;
  const RadialPersentWidget({
    super.key,
    required this.percentInDouble,
    required this.backCircleColor,
    required this.customChild,
    required this.lineWidth,
    required this.lowerArcColor,
    required this.upperArcColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
          painter: MyPainter(
            customChild: customChild,
            percentInDouble: percentInDouble,
            backCircleColor: backCircleColor,
            upperArcColor: upperArcColor,
            lowerArcColor: lowerArcColor,
            lineWidth: lineWidth,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(11),
          child: Center(child: customChild),
        ),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  final Widget customChild;
  final double percentInDouble;
  final Color backCircleColor;
  final Color upperArcColor;
  final Color lowerArcColor;
  final double lineWidth;

  MyPainter({
    required this.customChild,
    required this.backCircleColor,
    required this.percentInDouble,
    required this.upperArcColor,
    required this.lineWidth,
    required this.lowerArcColor,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Rect arcRect = calculateArcsRect(size);

    createBackCircle(canvas, size);
    createUpperArc(canvas, arcRect);
    createLowerArc(canvas, arcRect);
  }

  void createLowerArc(Canvas canvas, Rect arcRect) {
    final lowerArc = Paint();
    lowerArc.color = lowerArcColor;
    lowerArc.style = PaintingStyle.stroke;
    lowerArc.strokeWidth = lineWidth;
    lowerArc.strokeCap = StrokeCap.round;
    canvas.drawArc(
      arcRect,
      -pi / 2,
      (pi * 2) * percentInDouble,
      false,
      lowerArc,
    );
  }

  void createUpperArc(Canvas canvas, Rect arcRect) {
    final upperArc = Paint();
    upperArc.color = upperArcColor;
    upperArc.style = PaintingStyle.stroke;
    upperArc.strokeWidth = lineWidth;
    canvas.drawArc(
      arcRect,
      pi * 2 * percentInDouble - (pi / 2),
      (pi * 2) * (1.0 - percentInDouble),
      false,
      upperArc,
    );
  }

  void createBackCircle(Canvas canvas, Size size) {
    final backCircle = Paint();
    backCircle.color = backCircleColor;
    backCircle.style = PaintingStyle.fill;
    canvas.drawOval(Offset.zero & size, backCircle);
  }

  Rect calculateArcsRect(Size size) {
    final marginLine = 3;
    final offset = lineWidth / 2 + marginLine;
    final arcRect =
        Offset(offset, offset) &
        Size(size.width - offset * 2, size.height - offset * 2);
    return arcRect;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
