import 'dart:math';

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
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth=3.0;
    
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