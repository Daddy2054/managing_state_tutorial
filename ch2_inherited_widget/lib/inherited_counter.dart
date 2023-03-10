import 'package:ch2_inherited_widget/main.dart';
import 'package:flutter/material.dart';

class MyInheritedWidget extends InheritedWidget {
  final MyCounterInheritedWidgetState data;

  MyInheritedWidget({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => child != oldWidget;
  }


class MyCounterInheritedWidget extends StatefulWidget {
  final Widget child;
  const MyCounterInheritedWidget({Key? key, required this.child}) : super(key: key);

  static MyCounterInheritedWidgetState of(BuildContext context) {
  final MyCounterInheritedWidgetState? result=  context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!.data;
  assert(result != null, 'No counter found in context');
  return result!;
}

@override

State<MyCounterInheritedWidget> createState() {
  return MyCounterInheritedWidgetState();
}
}

class MyCounterInheritedWidgetState extends State<MyCounterInheritedWidget> {
  int _counterValue = 0;

  int get counterValue => _counterValue;

  void incrementCounter() {
    setState(() {
      _counterValue++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      data: this,
      child: widget.child,
    );
  }
}

