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

/// A representation of an XML document. Create an instance of this
/// type to build a web page using Plot's type-safe DSL, and then
/// call the `render()` method to turn it into an XML string.
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
