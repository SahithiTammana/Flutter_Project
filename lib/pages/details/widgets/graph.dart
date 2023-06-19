import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class Graph extends StatelessWidget {
  const Graph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:SizedBox(
        width: double.infinity,
        child: GraphArea(),
      ),
    );
  }
}


class GraphArea extends StatefulWidget {
  const GraphArea({super.key});

  @override
  State<GraphArea> createState() => _GraphAreaState();
}

class _GraphAreaState extends State<GraphArea> {
  List<DataPoint> data = [
    DataPoint(day: 1, steps: Random().nextInt(100)),
    DataPoint(day: 2, steps: Random().nextInt(100)),
    DataPoint(day: 3, steps: Random().nextInt(100)),
    DataPoint(day: 4, steps: Random().nextInt(100)),
    DataPoint(day: 5, steps: Random().nextInt(100)),
    DataPoint(day: 6, steps: Random().nextInt(100)),
    DataPoint(day: 7, steps: Random().nextInt(100)),
    DataPoint(day: 8, steps: Random().nextInt(100)),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GraphPainter(data: data),
    );
  }
}

class GraphPainter extends CustomPainter {

  final List<DataPoint> data;

  GraphPainter({required this.data});


  @override
  void paint(Canvas canvas, Size size) {
  
    var xSpacing = size.width / (data.length-1);

    var maxSteps = data
      .fold<DataPoint>(data[0], (p, c) => p.steps > c.steps ? p : c)
      .steps;

    print(xSpacing);
    print(maxSteps);

    var yRatio = size.height / maxSteps;
    var curveOffset = xSpacing * 0.3;

    List<Offset> offsets = [];

    var cx =0.0;
    for(int i=0;i<data.length;i++){

      var y = size.height -(data[i].steps*yRatio);

      offsets.add(Offset(cx, y));
      cx += xSpacing;
    }


    Paint linePaint = Paint()
      ..color = Color(0xff30c3f9)
      ..style = PaintingStyle.stroke
      ..strokeWidth=4.0;


    Paint shadowPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..maskFilter = ui.MaskFilter.blur(ui.BlurStyle.solid, 3)
      ..strokeWidth=4.0;  

    Paint fillPaint = Paint()
      ..shader = ui.Gradient.linear(
        Offset(size.width / 2,0), 
        Offset(size.width / 2, size.height), 
        [
          Color(0xff30c3f9),
          Colors.white,
        ]
      )
      ..color = Colors.blue
      ..style = PaintingStyle.fill;  
    
    Path linePath = Path();

    Offset cOffset = offsets[0];

    linePath.moveTo(cOffset.dx,cOffset.dy);

    for(int i = 1; i < offsets.length; i++){
      var x = offsets[i].dx;
      var y = offsets[i].dy;
      var c1x = cOffset.dx + curveOffset;
      var c1y = cOffset.dy;
      var c2x = x - curveOffset;
      var c2y = y;

      linePath.cubicTo(c1x, c1y, c2x, c2y, x ,y);
      cOffset = offsets[i];
    }
    
    Path fillPath = Path.from(linePath);
    fillPath.lineTo(size.width, size.height);
    fillPath.lineTo(0, size.height);

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(linePath, shadowPaint);
    canvas.drawPath(linePath, linePaint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


class DataPoint{
  final int day;
  final int steps;

  DataPoint({
    required this.day,
    required this.steps,
  });
}