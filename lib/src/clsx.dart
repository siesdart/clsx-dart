// This file contains the core logic for the Dart implementation of clsx.
// It mirrors the functionality of the popular JavaScript utility for
// constructing className strings conditionally.

/// Constructs a string of CSS class names based on provided arguments.
///
/// This function takes a list of arguments which can include:
/// - Strings: These are directly added to the resulting class string.
/// - Lists: These are recursively processed by `clsx`.
/// - Maps: Keys are added as class names if their corresponding boolean value
/// is true.
/// - Null values are ignored.
///
/// Example:
/// ```dart
/// clsx(['foo', {'bar': true, 'baz': false}, ['qux', null]])
/// // Returns: 'foo bar qux'
/// ```
String clsx(List<dynamic> args) {
  final classes = <String>[];
  for (final arg in args) {
    if (arg == null) continue;
    if (arg is String && arg.isNotEmpty) {
      classes.add(arg);
    } else if (arg is List) {
      final nested = clsx(arg);
      if (nested.isNotEmpty) {
        classes.add(nested);
      }
    } else if (arg is Map<String, bool>) {
      for (final entry in arg.entries) {
        if (entry.value) {
          classes.add(entry.key);
        }
      }
    }
  }
  return classes.join(' ');
}
