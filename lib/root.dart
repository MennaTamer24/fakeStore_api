import 'package:fake_api_app/features/products/view/home.dart';
import 'package:flutter/material.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    final PageController pageController = PageController(
      initialPage: currentIndex,
    );
    final List<Widget> pages = [
      Home(),
      Container(color: Colors.green),
      Container(color: Colors.blue),
    ];
    return Scaffold(
      body: PageView(
        onPageChanged: (value) {
          setState(() => currentIndex = value);
        },
        controller: pageController,
        children: pages,
      ),
    );
  }
}
