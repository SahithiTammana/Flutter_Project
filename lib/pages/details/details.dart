import 'package:flutter/material.dart';
import 'package:flutter_project/pages/details/widgets/appbar.dart';
import 'package:flutter_project/pages/details/widgets/dates.dart';
import 'package:flutter_project/pages/details/widgets/graph.dart';
import 'package:flutter_project/pages/details/widgets/info.dart';
import 'package:flutter_project/pages/details/widgets/stats.dart';
import 'package:flutter_project/pages/details/widgets/steps.dart';
import 'package:flutter_project/widgets/bottom_navigation.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBar: AppBar()),
      body: Column(
        children: [
          Dates(),
          Steps(),
          Graph(),
          Info(),
          Stats(),
          BottomNavigation(),
        ],
      ),
    );
  }
}

