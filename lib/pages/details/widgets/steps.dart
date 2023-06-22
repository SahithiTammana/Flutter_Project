import 'package:flutter/material.dart';
import 'package:flutter_project/helpers.dart';

class Steps extends StatelessWidget {
  const Steps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String steps = formatNumber(randNumberBetween(4000, 6000));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22),
      child: Column(
        children: [
          Text(
            steps,
            style: const TextStyle(
              fontSize: 33,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Text(
            'Total Steps',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
