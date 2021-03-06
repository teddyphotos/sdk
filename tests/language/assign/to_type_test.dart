// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Verify that an attempt to assign to a class, enum, typedef, or type
// parameter produces a compile error.

class C<T> {
  f() {
    T = Null;
//  ^
// [analyzer] STATIC_WARNING.ASSIGNMENT_TO_TYPE
// [cfe] Setter not found: 'T'.
  }
}

class D {}

enum E { e0 }

typedef void F();

main() {
  new C<D>().f();
  D = Null;
//^
// [analyzer] STATIC_WARNING.ASSIGNMENT_TO_TYPE
// [cfe] Setter not found: 'D'.
  E = Null;
//^
// [analyzer] STATIC_WARNING.ASSIGNMENT_TO_TYPE
// [cfe] Setter not found: 'E'.
  F = Null;
//^
// [analyzer] STATIC_WARNING.ASSIGNMENT_TO_TYPE
// [cfe] Setter not found: 'F'.
}
