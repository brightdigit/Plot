/**
 *  Plot
 *
 *  Copyright (c) 2019 John Sundell. Licensed under the MIT license, as follows:
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in all
 *  copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 *  SOFTWARE.
 */

extension Node {
  /// Conditionally create a given node if a boolean expression is `true`,
  /// optionally falling back to another node using the `else` argument.
  /// - Parameters:
  ///   - condition: The boolean condition to evaluate.
  ///   - node: The node to add if the condition is `true`.
  ///   - fallbackNode: An optional node to fall back to in case
  ///     the condition is `false`.
  /// - Returns: The created node.
  public static func `if`(
    _ condition: Bool,
    _ node: Node,
    else fallbackNode: Node? = nil
  ) -> Node {
    guard condition else {
      return fallbackNode ?? .empty
    }

    return node
  }

  /// Conditionally create a given node by unwrapping an optional, and then
  /// applying a transform to it. If the optional is `nil`, then no node will
  /// be created.
  /// - Parameters:
  ///   - optional: The optional value to unwrap.
  ///   - transform: The closure to use to transform the value into a node.
  ///   - fallbackNode: An optional node to fall back to in case
  ///     the passed `optional` is `nil`.
  /// - Returns: The created node.
  public static func unwrap<T>(
    _ optional: T?,
    _ transform: (T) throws -> Node,
    else fallbackNode: Node = .empty
  ) rethrows -> Node {
    try optional.map(transform) ?? fallbackNode
  }

  /// Transform any sequence of values into a group of nodes, by applying a
  /// transform to each element.
  /// - Parameters:
  ///   - sequence: The sequence to transform.
  ///   - transform: The closure to use to transform each element into a node.
  /// - Returns: The created node.
  public static func forEach<S: Sequence>(
    _ sequence: S,
    _ transform: (S.Element) throws -> Node
  ) rethrows -> Node {
    try .group(sequence.map(transform))
  }
}

extension Attribute {
  /// Conditionally create a given attribute by unwrapping an optional, and then
  /// applying a transform to it. If the optional is `nil`, then no attribute will
  /// be created.
  /// - Parameters:
  ///   - optional: The optional value to unwrap.
  ///   - transform: The closure to use to transform the value into an attribute.
  ///   - fallbackAttribute: An optional attribute to fall back to in case
  ///     the passed `optional` is `nil`.
  /// - Returns: The created node.
  public static func unwrap<T>(
    _ optional: T?,
    _ transform: (T) throws -> Self,
    else fallbackAttribute: Self = .empty
  ) rethrows -> Self {
    try optional.map(transform) ?? fallbackAttribute
  }
}
