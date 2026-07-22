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

/// Protocol adopted by types that can be converted into renderable nodes.
///
/// You typically don't conform to this protocol yourself within your own code.
/// Instead, Plot will automatically convert the elements, components and
/// attributes that you create using its DSL into nodes that are then rendered.
public protocol NodeConvertible: Renderable {
  /// The context of the node that this type can be converted into.
  associatedtype Context
  /// Convert this instance into a renderable node. See `Node` for more info.
  var node: Node<Context> { get }
}

extension NodeConvertible {
  /// Render this value into a string.
  /// - Returns: The rendered string.
  public func render(indentedBy indentationKind: Indentation.Kind?) -> String {
    Renderer.render(node, indentedBy: indentationKind)
  }
}

extension Array: Renderable, NodeConvertible where Element: NodeConvertible {
  /// The node representation of this sequence.
  public var node: Node<Element.Context> { .group(map(\.node)) }
}
