/**
*  Plot
*  Copyright (c) John Sundell 2021
*  MIT license, see LICENSE file for details
*/

public struct TableRow: ComponentContainer {
  /// A closure that provides the components that the row should contain.
  @ComponentBuilder public var content: ContentProvider
  fileprivate var isHeader = false

  /// The content and behavior of this component.
  public var body: Component {
    Node.tr(
      .forEach(content()) {
        .component(wrap($0))
      }
    )
  }

  /// Create a new instance with the given content.
  public init(@ComponentBuilder content: @escaping ContentProvider) {
    self.content = content
  }

  internal func convertToHeaderNode() -> Node<HTML.TableContext> {
    var row = self
    row.isHeader = true
    return row.convertToNode()
  }

  private func wrap(_ component: Component) -> Component {
    if isHeader {
      return component.wrappedInElement(named: "th")
    }

    return component.wrappedInElement(named: "td")
  }
}
