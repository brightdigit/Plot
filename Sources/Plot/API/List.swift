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

/// Component used to render a list of items, for example using a `<ul>` or
/// `<ol>` element.
///
/// How a list is rendered is determined by its `ListStyle`, which defaults
/// to `.unordered`, and can be customized using the `listStyle` modifier.
/// By default, any non-`ListItem` component that appears within a list is
/// automatically wrapped into a `ListItem`, as to always produce semantically
/// valid HTML.
public struct List<Items: Sequence>: Component {
  /// The items that the list should render.
  public var items: Items
  /// A closure that transforms the list's items into renderable components.
  public var content: (Items.Element) -> Component

  @EnvironmentValue(.listStyle) private var style

  /// The content and behavior of this component.
  public var body: Component {
    Element(name: style.elementName) {
      for item in items {
        style.itemWrapper(content(item))
      }
    }
  }

  /// Create a new list with a given set of items.
  /// - parameters:
  ///   - items: The items that the list should render.
  ///   - content: A closure that transforms the list's items into renderable components.
  public init(
    _ items: Items,
    content: @escaping (Items.Element) -> Component
  ) {
    self.items = items
    self.content = content
  }

  /// Create a new list that renders a sequence of strings, each as its own item.
  /// - parameter items: The strings that the list should render.
  public init(_ items: Items) where Items.Element == String {
    self.init(items) { Text($0) }
  }
}

extension List: ComponentContainer where Items == ComponentGroup {
  /// Create a new instance with the given content.
  public init(@ComponentBuilder content: @escaping ContentProvider) {
    self.init(content()) { $0 }
  }
}
