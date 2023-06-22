import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      color: const Color.fromARGB(255, 230, 228, 228),
      child: IconTheme(
        data: const IconThemeData(color: Color.fromARGB(255, 97, 98, 101)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(
              Icons.add_chart,
            ),
            const Icon(Icons.search),
            Transform.translate(
              offset: const Offset(0, -10),
              child: GestureDetector(
                onTap: () {
                  // Navigator.of(context).pushReplacementNamed('/');
                },
                child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          colors: [
                            Color(0xff92e2ff),
                            Color.fromARGB(255, 60, 184, 229),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            offset: Offset(3, 3),
                            blurRadius: 3,
                          )
                        ]),
                    child: const Icon(
                      Icons.home,
                      color: Color.fromARGB(255, 73, 70, 70),
                      size: 30,
                    )),
              ),
            ),
            const Icon(Icons.date_range),
            GestureDetector(
                onTap: () {
                  // Navigator.of(context).pushNamed('/details');
                },
                child: const Icon(Icons.settings)),
          ],
        ),
      ),
    );
  }
}
