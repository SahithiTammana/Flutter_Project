import 'package:flutter/material.dart';
import 'package:flutter_project/pages/home/widgets/activity.dart';
import 'package:flutter_project/pages/home/widgets/current.dart';
import 'package:flutter_project/pages/home/widgets/header.dart';
import 'package:flutter_project/widgets/bottom_navigation.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          AppHeader(),
          CurrentPrograms(),
          RecentActivities(),
          BottomNavigation(),
        ],
      ),
    );
  }
}
