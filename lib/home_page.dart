import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isAnimating = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(seconds: 2000000000));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.network(
              'https://assets1.lottiefiles.com/packages/lf20_ti4y5deu.json',
              width: 350,
              height: 350,
              controller: _controller, onLoaded: (composition) {
            _controller.duration = composition.duration;
            // _controller.forward();
          }),
          Lottie.network(
              'https://assets1.lottiefiles.com/packages/lf20_ti4y5deu.json',
              width: 350,
              height: 350,
              controller: _controller, onLoaded: (composition) {
            _controller.duration = composition.duration;
            // _controller.forward();
          }),
          TextButton(
              onPressed: () {
                if (_controller.isAnimating) {
                  _controller.stop();
                  setState(() {
                    isAnimating = false;
                  });
                } else {
                  _controller.repeat();
                  setState(() {
                    isAnimating = true;
                  });
                }
              },
              child: Text(isAnimating ? 'Stop' : 'Play'))
        ],
      ),
    );
  }
}
