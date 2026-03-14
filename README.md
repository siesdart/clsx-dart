# clsx for dart

[![Build](https://img.shields.io/github/actions/workflow/status/siesdart/clsx-dart/build.yml)](https://github.com/siesdart/clsx-dart/actions/workflows/build.yml)
[![Pub](https://img.shields.io/pub/v/clsx-dart)](https://pub.dev/packages/clsx-dart)
[![License](https://img.shields.io/github/license/siesdart/clsx-dart?color=blue)](https://github.com/siesdart/clsx-dart/blob/main/LICENSE)
![GitHub stars](https://img.shields.io/github/stars/siesdart/clsx-dart?style=flat&label=stars&labelColor=333940&color=8957e5&logo=github)
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)

An unofficial Dart port of the popular JavaScript utility [`clsx`](https://github.com/lukeed/clsx) for constructing className strings conditionally.

## Features

This Dart package replicates the core functionality of the JavaScript [`clsx`](https://github.com/lukeed/clsx) library, allowing you to:

- Conditionally join strings as CSS class names.
- Support nested lists and maps for dynamic class application.
- Ignore null or empty values.

## Usage

Here's a simple example of how to use `clsx` in Dart:

```dart
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

  print(buttonClasses); // Output: 'btn active extra-class another-class'
}
```

## Additional information

This package is an unofficial port of the JavaScript `clsx` library developed by [Luke Edwards](https://lukeed.com/). The goal is to provide a similar, convenient utility for Dart developers.

For more information about the original JavaScript library, please refer to [its repository](https://github.com/lukeed/clsx). Contributions, bug reports, and feature requests for this Dart port are welcome. Please file issues on the project's repository.
