import 'package:flutter/material.dart';

class LoaderWidget extends StatefulWidget {
  const LoaderWidget({Key? key}) : super(key: key);

  @override
  State<LoaderWidget> createState() => _LoaderWidgetState();
}

class _LoaderWidgetState extends State<LoaderWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(seconds: 1),
      lowerBound: 0.3,
    );
    _controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Size logoSize = Size(100, 100);
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: _controller.value,
          child: child,
        );
      },
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: logoSize.width,
            height: logoSize.height,
            child: Center(
              child: Text(
                'M',
                style: Theme.of(context).textTheme.headline2?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontFamily: 'robotoMedium',
                      fontWeight: FontWeight.bold,
                      height: 0.6,
                    ),
              ),
            ),
          ),
          SizedBox(
            width: logoSize.width,
            height: logoSize.height,
            child: Center(
              child: Text(
                'M',
                style: Theme.of(context).textTheme.headline2?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                      fontFamily: 'robotoMedium',
                      fontWeight: FontWeight.bold,
                      height: 1.4,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
