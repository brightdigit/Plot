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

internal struct Renderer {
  internal private(set) var result = ""
  internal private(set) var deferredAttributes = [AnyAttribute]()

  private let indentation: Indentation?
  private var environment: Environment
  private var elementWrapper: ElementWrapper?
  private var elementBuffer: ElementRenderingBuffer?
  private var containsElement = false
}

extension Renderer {
  internal init(indentationKind: Indentation.Kind?) {
    self.indentation = indentationKind.map(Indentation.init)
    self.environment = Environment()
  }

  internal static func render(
    _ node: AnyNode,
    indentedBy indentationKind: Indentation.Kind?
  ) -> String {
    var renderer = Renderer(indentationKind: indentationKind)
    node.render(into: &renderer)
    return renderer.result
  }

  internal mutating func renderRawText(_ text: String) {
    renderRawText(text, isPlainText: true, wrapIfNeeded: true)
  }

  internal mutating func renderText(_ text: String) {
    renderRawText(text.escaped())
  }

  internal mutating func renderElement<T>(_ element: Element<T>) {
    if let wrapper = elementWrapper {
      guard element.name == wrapper.wrappingElementName else {
        if deferredAttributes.isEmpty {
          return renderComponent(
            wrapper.body(Node.element(element)),
            deferredAttributes: wrapper.deferredAttributes
          )
        } else {
          return renderComponent(
            wrapper.body(
              ModifiedComponent(
                base: Node.element(element),
                deferredAttributes: deferredAttributes
              )
            )
          )
        }
      }
    }

    let buffer = ElementRenderingBuffer(
      element: element,
      indentation: indentation
    )

    var renderer = Renderer(
      indentation: indentation?.indented(),
      environment: environment,
      elementBuffer: buffer
    )

    for node in element.nodes {
      node.render(into: &renderer)
    }

    deferredAttributes.forEach(buffer.add)
    elementBuffer?.containsChildElements = true
    containsElement = true

    renderRawText(
      buffer.flush(),
      isPlainText: false,
      wrapIfNeeded: false
    )
  }

  internal mutating func renderAttribute<T>(_ attribute: Attribute<T>) {
    if let elementBuffer = elementBuffer {
      elementBuffer.add(attribute)
    } else {
      result.append(attribute.render())
    }
  }

  internal mutating func renderComponent(
    _ component: Component,
    deferredAttributes: [AnyAttribute] = [],
    environmentOverrides: [Environment.Override] = [],
    elementWrapper: ElementWrapper? = nil
  ) {
    var environment = self.environment
    for environmentOverride in environmentOverrides {
      environmentOverride.apply(to: &environment)
    }

    if !(component is AnyNode || component is AnyElement) {
      let componentMirror = Mirror(reflecting: component)

      for property in componentMirror.children {
        if let environmentValue = property.value as? AnyEnvironmentValue {
          environmentValue.environment.value = environment
        }
      }
    }

    var renderer = Renderer(
      deferredAttributes: deferredAttributes,
      indentation: indentation,
      environment: environment,
      elementWrapper: elementWrapper
    )

    if let node = component as? AnyNode {
      node.render(into: &renderer)
    } else {
      renderer.renderComponent(
        component.body,
        deferredAttributes: deferredAttributes,
        elementWrapper: elementWrapper ?? self.elementWrapper
      )
    }

    renderRawText(
      renderer.result,
      isPlainText: !renderer.containsElement,
      wrapIfNeeded: false
    )

    containsElement = renderer.containsElement
  }
}

extension Renderer {
  fileprivate mutating func renderRawText(
    _ text: String,
    isPlainText: Bool,
    wrapIfNeeded: Bool
  ) {
    if wrapIfNeeded {
      if let wrapper = elementWrapper {
        return renderComponent(wrapper.body(Node<Any>.raw(text)))
      }
    }

    if let elementBuffer = elementBuffer {
      elementBuffer.add(text, isPlainText: isPlainText)
    } else {
      if indentation != nil && !result.isEmpty {
        result.append("\n")
      }

      result.append(text)
    }
  }
}
