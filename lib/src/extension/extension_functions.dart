// Extension by STER.Black for angular-package.

// Use of this source code is governed by an
// MIT-style license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import '../functions/var.dart' as _var;
import '../functions/variant.dart' as _variant;

final globalFunctions = [
  ..._var.varGlobal,
  ..._variant.variantGlobal
];

final coreModules = [
  _var.varModule,
  _variant.variantModule,
];
