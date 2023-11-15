import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'on_boarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Lottie.asset("assets/images/splash.json", controller: _controller,
            onLoaded: (conpose) {
          _controller
            ..duration = conpose.duration
            ..forward().then((value) => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                  OnboardingPage(pages: [ OnboardingPageModel(
                    title: 'Fast, Fluid and Secure',
                    description:
                    'Take control of your finances and budget like a pro in just a few taps',
                    image: 'assets/images/a.gif',
                    bgColor: Colors.indigo,
                  ),
                    OnboardingPageModel(
                      title: 'Based on cloud',
                      description: 'Simplify your money management with our powerful expense tracking tool anywhere.',
                      image: 'assets/images/b.gif',
                      bgColor: const Color(0xff1eb090),
                    ),
                    OnboardingPageModel(
                      title: 'Easy life',
                      description: 'Track every penny effortlessly with our intuitive expense tracker app.',
                      image: 'assets/images/c.gif',
                      bgColor: Colors.purple,
                    ),],),
                ),(route) => false));
        }),const SizedBox(height: 35),
        const Text(
          "Expense Tracker",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 28
          ),
        )
      ]),
    );
  }
}
