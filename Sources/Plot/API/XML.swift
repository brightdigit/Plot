/**
*  Plot
*  Copyright (c) John Sundell 2021
*  MIT license, see LICENSE file for details
*/

public struct XML: DocumentFormat {
  private let document: Document<XML>

  /// Create an XML document with a collection of nodes that make
  /// up its elements and attributes. Since the core XML format
  /// is very free-form, you'll either define elements using the
  /// `.element()` APIs, or by creating your own context-bound
  /// components by extending the `Node` type.
  /// - parameter nodes: The root nodes of the document.
  public init(_ nodes: Node<XML.DocumentContext>...) {
    document = Document(elements: [
      .xml(.version(1.0), .encoding(.utf8)),
      Element(name: "", nodes: nodes),
    ])
  }
}

extension XML: NodeConvertible {
  /// The node representation of this document.
  public var node: Node<Self> { document.node }
}

extension XML {
  /// The root context of an XML document.
  public enum RootContext: XMLRootContext {}
  /// The context within an XML document's `<xml>` declaration.
  public enum DeclarationContext {}
  /// The user-facing root context of an XML document.
  public enum DocumentContext {}
}
