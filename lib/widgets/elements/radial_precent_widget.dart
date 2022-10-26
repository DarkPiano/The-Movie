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
          child: RadialPercentWidget(
            percent: 0.72,
            fillColor: Colors.black,
            lineColor: Colors.green,
            freeColor: Colors.grey,
            lineWidget: 5,
            child: Text(
              '72%',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RadialPercentWidget extends StatelessWidget {
  final Widget child;

  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidget;

  const RadialPercentWidget({
    Key? key,
    required this.child,
    required this.percent,
    required this.fillColor,
    required this.lineColor,
    required this.freeColor,
    required this.lineWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
            painter: MyPainter(
          percent: percent,
          fillColor: fillColor,
          lineColor: lineColor,
          freeColor: freeColor,
          lineWidget: lineWidget,
        )),
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: Center(
            child: child,
          ),
        ),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidget;

  MyPainter({
    required this.percent,
    required this.fillColor,
    required this.lineColor,
    required this.freeColor,
    required this.lineWidget,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint();
    backgroundPaint.color = fillColor;
    backgroundPaint.style = PaintingStyle.fill;
    canvas.drawOval(Offset.zero & size, backgroundPaint);

    final filedPaint = Paint();
    filedPaint.color = freeColor;
    filedPaint.style = PaintingStyle.stroke;
    filedPaint.strokeWidth = lineWidget;
    canvas.drawArc(
      Offset(5.5, 5.5) & Size(size.width - 11, size.height - 11),
      pi * 2 * percent - (pi / 2),
      pi * 2 * (1.0 - percent),
      false,
      filedPaint,
    );

    final feelPaint = Paint();
    feelPaint.color = lineColor;
    feelPaint.style = PaintingStyle.stroke;
    feelPaint.strokeWidth = lineWidget;
    feelPaint.strokeCap = StrokeCap.round;
    canvas.drawArc(
      Offset(5.5, 5.5) & Size(size.width - 11, size.height - 11),
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
