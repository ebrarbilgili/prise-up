import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class AlertDialogAtomic extends StatelessWidget {
  const AlertDialogAtomic({
    Key? key,
    required this.title,
    required this.children,
    required this.actions,
  }) : super(key: key);

  final Widget title;
  final List<Widget> children;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: context.normalBorderRadius),
      title: title,
      content: SingleChildScrollView(
        child: ListBody(children: children),
      ),
      actions: actions,
    );
  }
}
