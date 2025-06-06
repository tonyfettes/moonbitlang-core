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
///
/// Creates an iterator over the elements of a fixed-size array, providing
/// sequential access to each element.
///
/// Parameters:
///
/// * `array` : The fixed-size array to iterate over.
///
/// Returns an iterator that yields each element of the array in order from first
/// to last.
///
/// Example:
///
/// ```moonbit
/// test "FixedArray::iter" {
///   let arr = FixedArray::make(3, 42)
///   let mut sum = 0
///   arr.iter().each(fn(x) { sum = sum + x })
///   inspect(sum, content="126")
/// }
/// ```
#intrinsic("%iter.from_array")
pub fn[T] FixedArray::iter(self : FixedArray[T]) -> Iter[T] {
  Iter::new(fn(yield_) {
    for v in self {
      guard yield_(v) is IterContinue else { break IterEnd }

    } else {
      IterContinue
    }
  })
}

///|
/// Returns an iterator that yields both indices and values from the fixed array.
/// The iterator provides pairs of `(index, value)` where indices start from 0
/// and increment sequentially.
///
/// Parameters:
///
/// * `array` : The fixed array to iterate over.
///
/// Returns an iterator of type `Iter2[Int, T]` that yields tuples of indices and
/// values from the array.
///
/// Example:
///
/// ```moonbit
/// test "FixedArray::iter2" {
///   let arr = FixedArray::make(3, 10)
///   let mut sum = 0
///   arr.iter2().each(fn(i, x) { sum = sum + i + x })
///   inspect(sum, content="33") // (0 + 10) + (1 + 10) + (2 + 10) = 33
/// }
/// ```
pub fn[T] FixedArray::iter2(self : FixedArray[T]) -> Iter2[Int, T] {
  Iter2::new(fn(yield_) {
    for i, v in self {
      guard yield_(i, v) is IterContinue else { break IterEnd }

    } else {
      IterContinue
    }
  })
}

///|
/// Returns an empty fixed-size array of the specified type.
///
/// Parameters:
///
/// * `X` : The type parameter specifying the element type of the array.
///
/// Returns an empty fixed-size array of type `FixedArray[X]`.
///
/// Example:
///
/// ```moonbit
/// test "FixedArray::default" {
///   let arr : FixedArray[Int] = FixedArray::default()
///   inspect(arr.length(), content="0")
///   inspect(arr.is_empty(), content="true")
/// }
/// ```
pub impl[X] Default for FixedArray[X] with default() {
  []
}

///|
/// Fill the array with a given value.
///
/// # Example
/// ```
/// let fa : FixedArray[Int] = [0, 0, 0, 0, 0]
/// fa.fill(3)
/// assert_eq(fa[0], 3)
/// ```
pub fn[T] FixedArray::fill(self : FixedArray[T], value : T) -> Unit {
  for i in 0..<self.length() {
    self[i] = value
  }
}

///|
/// Tests whether the FixedArray contains no elements.
///
/// Parameters:
///
/// * `FixedArray` : The FixedArray to check.
///
/// Returns `true` if the FixedArray has no elements, `false` otherwise.
///
/// Example:
///
/// ```moonbit
/// test "FixedArray::is_empty" {
///   let empty : FixedArray[Int] = []
///   inspect(empty.is_empty(), content="true")
///   let non_empty = [1, 2, 3]
///   inspect(non_empty.is_empty(), content="false")
/// }
/// ```
pub fn[T] FixedArray::is_empty(self : FixedArray[T]) -> Bool {
  self.length() == 0
}
