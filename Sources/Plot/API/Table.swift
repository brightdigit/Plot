/**
*  Plot
*  Copyright (c) John Sundell 2021
*  MIT license, see LICENSE file for details
*/

public struct Table: Component {
  /// The table's caption. See `TableCaption` for more information.
  public var caption: TableCaption?
  /// The `TableRow` that makes up the table's header.
  public var header: TableRow?
  /// The `TableRow` that makes up the table's footer.
  public var footer: TableRow?
  /// A closure that provides the table's main rows.
  @ComponentBuilder public var rows: ContentProvider

  /// The content and behavior of this component.
  public var body: Component {
    let rowWrapper = shouldWrapRowsInTableBody ? Node.tbody : Node.group

    return Node.table(
      .unwrap(caption, Node.component),
      .unwrap(header) {
        .thead($0.convertToHeaderNode())
      },
      rowWrapper(
        .forEach(rows()) { row in
          row.wrapped(
            using: ElementWrapper(
              wrappingElementName: "tr",
              body: TableRow.init
            )
          )
          .convertToNode()
        }
      ),
      .unwrap(footer) {
        .tfoot(.component($0))
      }
    )
  }

  private var shouldWrapRowsInTableBody: Bool {
    caption != nil || header != nil || footer != nil
  }

  /// Create a new table instance.
  /// - parameters:
  ///   - caption: The table's caption. See `TableCaption` for more information.
  ///   - header: The `TableRow` that makes up the table's header.
  ///   - footer: The `TableRow` that makes up the table's footer.
  ///   - rows: A closure that provides the table's main rows.
  public init(
    caption: TableCaption? = nil,
    header: TableRow? = nil,
    footer: TableRow? = nil,
    @ComponentBuilder rows: @escaping ContentProvider
  ) {
    self.caption = caption
    self.header = header
    self.footer = footer
    self.rows = rows
  }
}
