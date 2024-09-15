// Extension by STER.Black for angular-package.

// Use of this source code is governed by an
// MIT-style license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.
import '../callable.dart';
import '../value.dart';
import '../exception.dart';
import 'helpers/helpers.dart';
import 'extension_core.dart';

/*
 * Sass Extension Class for List
 */
class SassExtensionList {
  static ListSeparator isSeparator(String separator) =>
    switch (separator) {
      "auto"  => ListSeparator.undecided,
      "space" => ListSeparator.space,
      "comma" => ListSeparator.comma,
      "slash" => ListSeparator.slash,
      _ => throw SassScriptException(
          '\$separator: Must be "space", "comma", "slash", or "auto".')
    };

  static var functions = _functions;
  static var global = _global;

  final first = function("first", r"$list", (arguments) => arguments[0].asList[0]);
  final from = function(
    "from",
    r"$list, $n",
    (arguments) {
      List<Value> newList = [];
      for (int i = arguments[0].sassIndexToListIndex(arguments[1]); i < arguments[0].asList.length; i++) {
        newList.add(arguments[0].asList[i]);
      }
      return SassList(newList, arguments[0].separator);
    }
  );

  final last = function(
    "last",
    r"$list",
    (arguments) => arguments[0].asList.last
  );

  final reversed = function(
    "reversed",
    r"$list",
    (arguments) => SassList(
      arguments[0].asList.reversed.toList(),
      arguments[0].separator
    )
  );

  final setBracketed = function(
    "set-bracketed",
    r"$list, $bracketed",
    (arguments) => SassList(
      arguments[0].asList.reversed.toList(),
      arguments[0].separator,
      brackets: arguments[1].isTruthy
    )
  );

  final setSeparator = function(
    "set-separator",
    r"$list, $separator",
    (arguments) => SassList(
      arguments[0].asList.reversed.toList(),
      SassExtensionList.isSeparator(
        SassExtensionCore.getText(arguments[1], "separator")
      )
    )
  );

  final toggleBracketed = function(
    "toggle-bracketed",
    r"$list",
    (arguments) => SassList(
      arguments[0].asList.reversed.toList(),
      arguments[0].separator,
      brackets: arguments[0].hasBrackets ? false : true
    )
  );

}

// Initialize.
SassExtensionList sassExtensionList = SassExtensionList();

var _functions = <Callable>[
  sassExtensionList.first,
  sassExtensionList.from,
  sassExtensionList.last,
  sassExtensionList.reversed,
  sassExtensionList.setBracketed,
  sassExtensionList.setSeparator,
  sassExtensionList.toggleBracketed,
]; 

var _global = [
  sassExtensionList.first.withDeprecationWarning('list'),
  sassExtensionList.from.withDeprecationWarning('list'),
  sassExtensionList.last.withDeprecationWarning('list'),
  sassExtensionList.reversed.withDeprecationWarning('list'),
  sassExtensionList.setBracketed.withDeprecationWarning('list'),
  sassExtensionList.setSeparator.withDeprecationWarning('list'),
  sassExtensionList.toggleBracketed.withDeprecationWarning('list')
];

