import 'package:estate/constant.dart';
import 'package:estate/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  @override
  Widget build(BuildContext context) {
    Size cz = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          logo,
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          const Expanded(
            child: SizedBox(),
          ),
          Expanded(
            flex: 6,
            child: SizedBox(
              height: cz.height,
              width: cz.width,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: cz.width / 15,
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: cz.width / 12,
                            ),
                            children: [
                              TextSpan(
                                text: 'Looking',
                                style: TextStyle(
                                  color: Color(tealColor),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ' for an',
                                style: TextStyle(
                                  color: Color(orangeColor),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(
                                text: '\nelegant house? this is the place.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Welcome friends, are you looking \nfor us?\nCongratulations, you have found us',
                          style: TextStyle(
                            color: Colors.grey,
                            letterSpacing: 1,
                            fontSize: cz.width / 25,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: cz.width / 3,
                          height: cz.height / 20,
                          child: TextButton(
                            onPressed: () => Navigator.pushAndRemoveUntil(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      Homepage(),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    const begin = Offset(1.0, 0.0);
                                    const end = Offset.zero;
                                    const curve = Curves.easeInOut;
                                    var tween = Tween(begin: begin, end: end)
                                        .chain(CurveTween(curve: curve));
                                    var offsetAnimation =
                                        animation.drive(tween);
                                    return SlideTransition(
                                      position: offsetAnimation,
                                      child: child,
                                    );
                                  },
                                  transitionDuration: const Duration(
                                    seconds: 1,
                                  )),
                              (route) => false,
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Color(tealColor),
                              foregroundColor: Colors.white,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Next'),
                                Icon(Icons.arrow_forward),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: LottieBuilder.asset(
              buyhouse,
            ),
          ),
        ],
      )),
    );
  }
}
