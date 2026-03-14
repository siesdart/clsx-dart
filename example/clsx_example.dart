// This file contains an example of how to use the clsx function in Dart.
// ignore_for_file: avoid_print, prefer_final_locals, omit_local_variable_types

import 'package:clsx/clsx.dart';

void main() {
  String activeClass = 'active';
  bool isDisabled = false;

  final buttonClasses = clsx([
    'btn',
    activeClass,
    {'btn-disabled': isDisabled},
    ['extra-class', null],
    {'another-class': true},
  ]);

  print(buttonClasses);
}
