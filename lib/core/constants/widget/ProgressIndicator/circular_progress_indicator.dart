import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CircularProgressIndicatorWidget extends StatelessWidget {
  const CircularProgressIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: context.colorScheme.background,
      valueColor: AlwaysStoppedAnimation<Color>(context.colorScheme.primary),
    );
  }
}
