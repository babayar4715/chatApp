import 'package:flutter/cupertino.dart';

class AnimationLogo extends StatefulWidget {
  const AnimationLogo({
    super.key,
    this.size = 63,
    // there are if we do not give a size then  there are it would be size of the widget 63
    // while we want to give size another from 63 we can give it in a place
  });

  final double size;

  // there are we give double for a size that there are we can be give a size with a little of numbers that be well

  @override
  State<AnimationLogo> createState() => _AnimationLogoState();
}

class _AnimationLogoState extends State<AnimationLogo>
    with SingleTickerProviderStateMixin {
  // this mixin is used for animation that we can be use it to animate a photo that we have pbulish in a login and flah pages

  late AnimationController controller;
  // also we have a animation controller that we can be able to controll the animation
  late Animation animation;
  // and there are "late" it is to use for late this widget that wait for a some time that i would be give
  // a proporty then
  @override
  void initState() {
    super.initState();

    // init state as a we know it is used for stuffs to come at first that it is on ui

    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    // there we have animation controller that this animation can be used for animate the flash light
    // there are also we have a Duration that this anmation can be continued for a tme that there are have show

    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);

    controller.forward();

    animation.addStatusListener((status) {
      setState(() {});
      print(status);
    });

    controller.addListener(() {
      setState(() {});
      print(animation.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "Logo",
      child: SizedBox(
        height: controller.value * widget.size,
        child: Image.asset("assets/logo.png"),
      ),
    );
  }
}
