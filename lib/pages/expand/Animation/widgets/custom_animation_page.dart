import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/element/widgets/element_title_view.dart';

class CustomAnimationPage extends StatefulWidget {
  @override
  _CustomAnimationPageState createState() => _CustomAnimationPageState();
}

class _CustomAnimationPageState extends State<CustomAnimationPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ElementTitleView('自定义动画'),
          CustomAnimationWidgets(),
          ElementTitleView('自定义动画'),
        ],
      ),
    );
  }
}

class CustomAnimationWidgets extends StatefulWidget {
  @override
  _CustomAnimationWidgetsState createState() => _CustomAnimationWidgetsState();
}

class _CustomAnimationWidgetsState extends State<CustomAnimationWidgets>  with TickerProviderStateMixin{
  AnimationController _sizeController;
  AnimationController _colorController;
  Animation<double> _sizeAnimation;
  Animation<Color> _colorAnimation;
  @override
  void initState() {
    super.initState();
    _sizeController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 2000))
      ..addListener(() {
        setState(() {});
      });

    _sizeAnimation = _sizeController
        .drive(CurveTween(curve: Curves.linear))
        .drive(Tween(begin: 100.0, end: 200.0));

    _colorController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 1000))
      ..addListener(() {
        setState(() {});
      });

    _colorAnimation = _colorController
        .drive(CurveTween(curve: Curves.bounceIn))
        .drive(ColorTween(begin: Colors.blue, end: Colors.red));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          _sizeController.forward();
          _colorController.forward();
        },
        child: Container(
          height: _sizeAnimation.value,
          width: _sizeAnimation.value,
          color: _colorAnimation.value,
          alignment: Alignment.center,
          child: Text(
            '点我变化',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _sizeController.dispose();
    _colorController.dispose();
  }
}