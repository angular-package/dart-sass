// New module by STER.Black for angular-package.

// Use of this source code is governed by an
// MIT-style license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:collection';
import 'package:collection/collection.dart';

import '../../callable.dart';
import '../../module/built_in.dart';
import '../../value.dart';
// import '../helpers/helpers.dart';

/*
 * Sass Extension Class for Var
 */
class SassExtensionVar {
  static var functions = _functions;
  static var global = _global;
  static var name = "var";

  final _is = function("is", r"$value", (arguments) {
    var indexOf = arguments[0].assertString("string").text.indexOf("var(--");
    if (indexOf > -1) {
      return SassBoolean(
        switch (arguments[0]) {
          SassString() => true,
        _  => false
        });
    } else {
      return SassBoolean(false);
    }
  });
}

// Initialize.
var sassExtensionVar = SassExtensionVar();

var _functions = <Callable>[
  sassExtensionVar._is,
]; 

var _global = [
  sassExtensionVar._is.withDeprecationWarning('string').withName("is-var"),
];


/// The global definitions of Sass list functions.
final varGlobal = UnmodifiableListView([
  ...SassExtensionVar.global
]);

/// The Sass list module.
final varModule = BuiltInModule(SassExtensionVar.name, functions: <Callable>[
  ...SassExtensionVar.functions
]);


/// Like [BuiltInCallable.function], but always sets the URL to `sass:list`.
BuiltInCallable function(
        String name, String arguments, Value callback(List<Value> arguments)) =>
    BuiltInCallable.function(name, arguments, callback, url: "sass:var");
