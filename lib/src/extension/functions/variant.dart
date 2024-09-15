// New module by STER.Black for angular-package.

// Use of this source code is governed by an
// MIT-style license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:collection';
import 'package:collection/collection.dart';

import '../../callable.dart';
import '../../module/built_in.dart';
import '../../value.dart';


/*
 * Sass Extension Class for Variant
 */
class SassExtensionVariant {
  static var functions = _functions;
  static var global = _global;
  static var name = "variant";

  final _is = function("is", r"$value", (arguments) {
    return SassBoolean(false);
  });
}

// Initialize.
var sassExtensionVariant = SassExtensionVariant();

var _functions = <Callable>[
  sassExtensionVariant._is,
]; 

var _global = [
  sassExtensionVariant._is.withDeprecationWarning('string').withName("is-var"),
];


/// The global definitions of Sass list functions.
final variantGlobal = UnmodifiableListView([
  ...SassExtensionVariant.global
]);

/// The Sass list module.
final variantModule = BuiltInModule(SassExtensionVariant.name, functions: <Callable>[
  ...SassExtensionVariant.functions
]);


/// Like [BuiltInCallable.function], but always sets the URL to `sass:list`.
BuiltInCallable function(
        String name, String arguments, Value callback(List<Value> arguments)) =>
    BuiltInCallable.function(name, arguments, callback, url: "sass:variant");
