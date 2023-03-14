import 'package:flutter/cupertino.dart';

class AnimationLogo extends StatefulWidget {
  const AnimationLogo({
    super.key,
    this.size = 63,
    // there are if we do not give a size then  there are it would be size of the widget 63
    // while we want to give size another from 63 we can give it in a place
  });

  final double size;

  @override
  State<AnimationLogo> createState() => _AnimationLogoState();
}

class _AnimationLogoState extends State<AnimationLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

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
