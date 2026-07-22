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

extension Node where Context: DocumentFormat {
  internal static func document(_ document: Document<Context>) -> Node {
    Node { renderer in
      for element in document.elements {
        renderer.renderElement(element)
      }
    }
  }
}

extension Node where Context == Any {
  internal static func modifiedComponent(_ component: ModifiedComponent) -> Node {
    Node { renderer in
      renderer.renderComponent(
        component.base,
        deferredAttributes: component.deferredAttributes + renderer.deferredAttributes,
        environmentOverrides: component.environmentOverrides
      )
    }
  }

  internal static func components(_ components: [Component]) -> Node {
    Node { renderer in
      for component in components {
        renderer.renderComponent(
          component,
          deferredAttributes: renderer.deferredAttributes
        )
      }
    }
  }

  internal static func wrappingComponent(
    _ component: Component,
    using wrapper: ElementWrapper
  ) -> Node {
    Node { renderer in
      var wrapper = wrapper
      wrapper.deferredAttributes = renderer.deferredAttributes

      renderer.renderComponent(
        component,
        elementWrapper: wrapper
      )
    }
  }
}

extension Node: NodeConvertible {
  /// The node representation of this value.
  public var node: Self { self }

  /// Render this node into a string.
  /// - Returns: The rendered string.
  public func render(indentedBy indentationKind: Indentation.Kind?) -> String {
    Renderer.render(self, indentedBy: indentationKind)
  }
}

extension Node: Component {
  /// The content and behavior of this component.
  public var body: Component { self }
}

extension Node: ExpressibleByStringInterpolation {
  /// Create a node using the given string literal.
  public init(stringLiteral value: String) {
    self = .text(value)
  }
}

extension Node: AnyNode {
  internal func render(into renderer: inout Renderer) {
    rendering(&renderer)
  }
}
