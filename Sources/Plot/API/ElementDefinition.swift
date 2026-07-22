/**
 *  Plot
 *
 *  Copyright (c) 2021 John Sundell. Licensed under the MIT license, as follows:
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

import Foundation

/// Protocol used to make it possible to use a `Node`-based element with
/// the `ElementComponent` type. You typically don't have to conform to
/// this protocol yourself, unless you want to add first-class component
/// support for an HTML `Node` that Plot doesn't yet map to natively.
public protocol ElementDefinition {
  /// The context that the element's content nodes should all have.
  associatedtype InputContext
  /// The context that the element's own node should have.
  associatedtype OutputContext
  /// A closure that can be used to wrap a list of nodes into an element node.
  static var wrapper: @Sendable (Node<InputContext>...) -> Node<OutputContext> { get }
}
