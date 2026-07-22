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

/// A representation of a site map, a special XML format used by search
/// engines to index web sites. Create an instance of this type to build
/// a site map using Plot's type-safe DSL, and then call the `render()`
/// method to turn it into an XML string.
public struct SiteMap: DocumentFormat {
  private let document: Document<SiteMap>

  /// Create a site map with a collection of nodes that make up its
  /// elements and attributes. Use the `.url()` API to create a new
  /// URL definition within the site map.
  /// - parameter nodes: The root nodes of the document, which will
  /// be placed inside of a `<urlset>` element.
  public init(_ nodes: Node<SiteMap.URLSetContext>...) {
    document = Document(elements: [
      .xml(.version(1.0), .encoding(.utf8)),
      .urlset(.group(nodes)),
    ])
  }
}

extension SiteMap: NodeConvertible {
  /// The node representation of this document.
  public var node: Node<Self> { document.node }
}

extension SiteMap {
  /// The root context of a site map. Plot automatically creates
  /// all required elements within this context for you.
  public enum RootContext: XMLRootContext {}
  /// The context within a site map's `<urlset>` element.
  public enum URLSetContext {}
  /// The context within a site map's `<url>` element.
  public enum URLContext {}
}

extension SiteMap {
  internal static let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter
  }()
}
