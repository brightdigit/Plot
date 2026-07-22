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

import Foundation

/// A representation of an element within a document, such as an HTML or XML tag.
/// You normally don't construct `Element` values manually, but rather use Plot's
/// various DSL APIs to create them, for example by creating a `<body>` tag using
/// `.body()`, or a `<p>` tag using `.p()`.
public struct Element<Context>: AnyElement {
  /// The name of the element
  public var name: String
  /// How the element is closed, for example if it's self-closing or if it can
  /// contain child elements.
  public var closingMode: ClosingMode = .standard

  internal var nodes: [AnyNode]
  internal var paddingCharacter: Character?
}

extension Element {
  /// Convenience shorthand for `ElementClosingMode`.
  public typealias ClosingMode = ElementClosingMode

  /// Create a custom element with a given name and array of child nodes.
  /// - Parameters:
  ///   - name: The name of the element to create.
  ///   - nodes: The nodes (child elements + attributes) to add to the element.
  /// - Returns: The created element.
  public static func named(_ name: String, nodes: [Node<Any>]) -> Element {
    Element(name: name, nodes: nodes)
  }

  /// Create a custom self-closed element with a given name and array of attributes.
  /// - Parameters:
  ///   - name: The name of the element to create.
  ///   - attributes: The attributes to add to the element.
  /// - Returns: The created element.
  public static func selfClosed(
    named name: String,
    attributes: [Attribute<Any>]
  ) -> Element {
    Element(name: name, closingMode: .selfClosing, nodes: attributes.map(\.node))
  }
}

extension Element: NodeConvertible {
  /// The node representation of this element.
  public var node: Node<Context> { .element(self) }
}

extension Element: Component where Context == Any {
  /// The content and behavior of this component.
  public var body: Component { node }

  /// Create a new element with the given values.
  public init(
    name: String,
    @ComponentBuilder content: @escaping ContentProvider
  ) {
    self.init(name: name, nodes: [Node<Any>.component(content())])
  }
}
