// This file contains tests for the Dart port of the clsx function.
// The following diagnostics are ignored because they are intentional for the test cases:
// ignore_for_file: lines_longer_than_80_chars, inference_failure_on_collection_literal, prefer_if_elements_to_conditional_expressions, dead_code

import 'package:clsx/clsx.dart';
import 'package:test/test.dart';

void main() {
  group('clsx', () {
    test('strings', () {
      expect(clsx(['']), equals(''));
      expect(clsx(['foo']), equals('foo'));
      expect(clsx(['foo', 'bar']), equals('foo bar'));
      expect(
        clsx([true ? 'foo' : null, false ? 'bar' : null, 'baz']),
        equals('foo baz'),
      );
      expect(clsx([false ? 'foo' : null, 'bar', 'baz', '']), equals('bar baz'));
    });

    test('objects', () {
      expect(clsx([{}]), equals(''));
      expect(
        clsx([
          {'foo': true},
        ]),
        equals('foo'),
      );
      expect(
        clsx([
          {'foo': true, 'bar': false},
        ]),
        equals('foo'),
      );
      expect(
        clsx([
          {'foo': true, 'bar': true},
        ]),
        equals('foo bar'),
      );
      expect(
        clsx([
          {'foo': true, 'bar': false, 'baz': true},
        ]),
        equals('foo baz'),
      );
      expect(
        clsx([
          {'--foo': true, '--bar': true},
        ]),
        equals('--foo --bar'),
      );
    });

    test('objects (variadic)', () {
      expect(clsx([{}, {}]), equals(''));
      expect(
        clsx([
          {'foo': true},
          {'bar': true},
        ]),
        equals('foo bar'),
      );
      expect(
        clsx([
          {'foo': true},
          null,
          {'baz': true, 'bat': false},
        ]),
        equals('foo baz'),
      );
      expect(
        clsx([
          {'foo': true},
          {},
          {},
          {'bar': true},
          {'baz': false, 'bat': true},
        ]),
        equals('foo bar bat'),
      );
    });

    test('arrays', () {
      expect(clsx([[]]), equals(''));
      expect(
        clsx([
          ['foo'],
        ]),
        equals('foo'),
      );
      expect(
        clsx([
          ['foo', 'bar'],
        ]),
        equals('foo bar'),
      );
      expect(
        clsx([
          ['foo', null, 'baz'],
        ]),
        equals('foo baz'),
      );
    });

    test('arrays (nested)', () {
      expect(
        clsx([
          [[]],
        ]),
        equals(''),
      );
      expect(
        clsx([
          [
            [
              ['foo'],
            ],
          ],
        ]),
        equals('foo'),
      );
      expect(
        clsx([
          null,
          [
            [
              ['foo'],
            ],
          ],
        ]),
        equals('foo'),
      );
      expect(
        clsx([
          [
            'foo',
            [
              'bar',
              [
                '',
                [
                  ['baz'],
                ],
              ],
            ],
          ],
        ]),
        equals('foo bar baz'),
      );
    });

    test('arrays (variadic)', () {
      expect(clsx([[], []]), equals(''));
      expect(
        clsx([
          ['foo'],
          ['bar'],
        ]),
        equals('foo bar'),
      );
      expect(
        clsx([
          ['foo'],
          null,
          ['baz', ''],
          null,
          '',
          [],
        ]),
        equals('foo baz'),
      );
    });

    test('mixed', () {
      expect(
        clsx([
          'foo',
          {'bar': true, 'baz': false},
        ]),
        'foo bar',
      );
      expect(
        clsx([
          'foo',
          null,
          [
            'bar',
            {'baz': true},
          ],
        ]),
        'foo bar baz',
      );
    });
  });
}
