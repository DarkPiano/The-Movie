import 'package:flutter/material.dart';
import 'dart:math';

class RadialPersentWdget extends StatelessWidget {
  const RadialPersentWdget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          child: RadialPercentWidget(),
        ),
      ),
    );
  }
}

class RadialPercentWidget extends StatelessWidget {
  const RadialPercentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(painter: MyPainter()),
      ],
    );
  }
}


class MyPainter extends CustomPainter {
  final double percent = 0.72;
  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint();
    backgroundPaint.color = Colors.black;
    backgroundPaint.style = PaintingStyle.fill;
    canvas.drawOval(Offset.zero & size, backgroundPaint);

    final filedPaint = Paint();
    filedPaint.color = Colors.red;
    filedPaint.style = PaintingStyle.stroke;
    filedPaint.strokeWidth = 5;
    canvas.drawArc(
      Offset(5.5, 5.5) & Size(size.width - 11, size.height- 11),
      pi * 2 * percent - (pi / 2),
      pi * 2 * (1.0 - percent),
      false,
      filedPaint,
    );

    final feelPaint = Paint();
    feelPaint.color = Colors.green;
    feelPaint.style = PaintingStyle.stroke;
    feelPaint.strokeWidth = 5;
    feelPaint.strokeCap = StrokeCap.round;
    canvas.drawArc(
      Offset(5.5, 5.5) & Size(size.width - 11, size.height- 11),
      -pi / 2,
      pi * 2 * percent,
      false,
      feelPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
