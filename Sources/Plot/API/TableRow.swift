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

/// Component that represents a row within a table.
///
/// You typically only use this component to create the content for a `Table`
/// component, although it can also be used by itself, as long as it's wrapped
/// within an appropriate parent element (such as `<table>` or `<tbody>`).
///
/// Any component that appears within the row's `content` closure that isn't
/// either a `TableCell` (for standard/footer rows) or `TableHeaderCell` (for
/// header rows) is automatically wrapped into such a component instance.
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
