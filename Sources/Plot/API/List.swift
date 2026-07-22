/**
*  Plot
*  Copyright (c) John Sundell 2021
*  MIT license, see LICENSE file for details
*/

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
