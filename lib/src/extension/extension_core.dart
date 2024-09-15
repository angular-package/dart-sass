// Extension by STER.Black for angular-package.

// Use of this source code is governed by an
// MIT-style license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import '../value.dart';

class SassExtensionCore {
  static String getText(Value value, String name) {
    return value.assertString(name).text;
  }
}
