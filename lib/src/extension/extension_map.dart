// Extension by STER.Black for angular-package.

// Use of this source code is governed by an
// MIT-style license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.
import '../callable.dart';
import '../util/iterable.dart';
import '../value.dart';
import '../helpers/helpers.dart';

/*
 * Sass Extension Class for Map
 */
class SassExtensionMap {
  static var functions = _functions;
  static var global = _global;

  final _is = function("is", r"$value", (arguments) => SassBoolean(
    switch (arguments[0]) {
      SassMap() => true,
      _ => false
    })
  );

  final _pick = function("pick", r"$map, $key, $nested-key...", (arguments) {
    var map = arguments[0].assertMap("map");
    var keys = [arguments[1], ...arguments[2].asList];
    for (var key in keys.exceptLast) {
      var value = map.contents[key];
      if (value is! SassMap) return sassNull;
      map = value;
    }

    var picked = SassMap(<Value, Value>{
      keys.last: map.contents[keys.last] ?? sassNull
    });

    return picked.contents[keys.last] ?? sassNull;
  });

}

// Initialize.
var sassExtensionMap = SassExtensionMap();

var _functions = <Callable>[
  sassExtensionMap._is,
  sassExtensionMap._pick,
];

var _global = [
  sassExtensionMap._is.withDeprecationWarning('map').withName("is-map"),
  sassExtensionMap._pick.withDeprecationWarning('map').withName("map-pick"),
];
