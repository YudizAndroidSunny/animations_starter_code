import 'package:flutter/material.dart';

class LoginScreenAnimation extends StatefulWidget {
  const LoginScreenAnimation({super.key});

  @override
  State<LoginScreenAnimation> createState() => _LoginScreenAnimationState();
}

class _LoginScreenAnimationState extends State<LoginScreenAnimation>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _animationFirstFieldController;
  late AnimationController _animationSecondFieldController;
  late AnimationController _animationButtonController;
  late Animation<double> _logoAnimation;
  late Animation<Offset> _firstTextFieldAnimation;
  late Animation<Offset> _secondTextFieldAnimation;
  late Animation<Offset> _buttonAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animationFirstFieldController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animationSecondFieldController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animationButtonController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    /// Logo Animation
    _logoAnimation =
        Tween<double>(begin: 0, end: 1).animate(_animationController);

    _animationController.forward();

    _logoAnimation.addListener(() {
      if(_logoAnimation.isCompleted){
        _animationFirstFieldController.forward();
      }
    });

    /// Field Animation
    _firstTextFieldAnimation =
        Tween<Offset>(begin: const Offset(2, 0), end: Offset.zero).animate(
            CurvedAnimation(
                parent: _animationFirstFieldController, curve: Curves.easeOutCirc));

    _firstTextFieldAnimation.addListener(() {
      if(_firstTextFieldAnimation.isCompleted){
        _animationSecondFieldController.forward();
      }
    });

    _secondTextFieldAnimation =
        Tween<Offset>(begin: const Offset(2, 0), end: Offset.zero).animate(
            CurvedAnimation(
                parent: _animationSecondFieldController, curve: Curves.easeOutCirc));

    _secondTextFieldAnimation.addListener(() {
      if(_secondTextFieldAnimation.isCompleted){
        _animationButtonController.forward();
      }
    });

    /// Button Animation
    _buttonAnimation =
        Tween<Offset>(begin: const Offset(4, 0), end: Offset.zero).animate(
            CurvedAnimation(
                parent: _animationButtonController, curve: Curves.easeOutCirc));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _logoAnimation,
              child: const FlutterLogo(
                size: 100.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SlideTransition(
                    position: _firstTextFieldAnimation,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Username',
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  SlideTransition(
                    position: _secondTextFieldAnimation,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                      obscureText: true,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  SlideTransition(
                    position: _buttonAnimation,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Login'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
