// Copyright 2025 International Digital Economy Academy
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

///|
pub impl[X : Eq] Eq for X? with op_equal(self, other) {
  match (self, other) {
    (None, None) => true
    (Some(x), Some(y)) => x == y
    _ => false
  }
}

///|
pub fn[X : Show] Option::to_string(self : X?) -> String {
  match self {
    None => "None"
    Some(x) => "Some(" + x.to_string() + ")"
  }
}

///|
/// Extract the value in `Some`.
/// 
/// If the value is `None`, it throws a panic.
pub fn[X] Option::unwrap(self : X?) -> X {
  match self {
    None => panic()
    Some(x) => x
  }
}
