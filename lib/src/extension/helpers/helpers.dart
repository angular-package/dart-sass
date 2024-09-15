import '../../callable.dart';
import '../../value.dart';

/// Like [BuiltInCallable.function], but always sets the URL to `sass:map`.
BuiltInCallable function(
        String name, String arguments, Value callback(List<Value> arguments)) =>
    BuiltInCallable.function(name, arguments, callback); // , url: "sass:map"
    
Value modify(SassMap map, Iterable<Value> keys, Value modify(Value old),
    {bool addNesting = true}) {
  var keyIterator = keys.iterator;
  SassMap modifyNestedMap(SassMap map) {
    var mutableMap = Map.of(map.contents);
    var key = keyIterator.current;

    if (!keyIterator.moveNext()) {
      mutableMap[key] = modify(mutableMap[key] ?? sassNull);
      return SassMap(mutableMap);
    }

    var nestedMap = mutableMap[key]?.tryMap();
    if (nestedMap == null && !addNesting) return SassMap(mutableMap);

    mutableMap[key] = modifyNestedMap(nestedMap ?? const SassMap.empty());
    return SassMap(mutableMap);
  }

  return keyIterator.moveNext() ? modifyNestedMap(map) : modify(map);
}
