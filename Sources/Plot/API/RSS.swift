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

/// A representation of an RSS feed. Create an instance of this type
/// to build an RSS feed using Plot's type-safe DSL, and then call the
/// `render()` method to turn it into an RSS string.
public struct RSS: RSSBasedDocumentFormat {
  private let document: Document<RSS>

  /// Create an RSS feed with a collection of nodes that make up the
  /// items in the feed. Each item can be created using the `.item()`
  /// API.
  /// - parameter nodes: The nodes that make up the feed's items.
  ///   Will be placed within a `<channel>` element.
  public init(_ nodes: Node<ChannelContext>...) {
    document = .feed(.channel(.group(nodes)))
  }
}

extension RSS: NodeConvertible {
  /// The node representation of this document.
  public var node: Node<Self> { document.node }
}

extension RSS {
  /// The root context of an RSS feed. Plot automatically creates
  /// all required elements within this context for you.
  public enum RootContext: RSSRootContext {}
  /// The context within the top level of a podcast feed, within the
  /// `<rss>` element. Plot automatically creates all required elements
  /// within this context for you.
  public enum FeedContext: RSSFeedContext {
    /// The context type used within an RSS channel.
    public typealias ChannelContext = RSS.ChannelContext
  }
  /// The context within a feed's `<channel>` element, in which
  /// items can be defined.
  public enum ChannelContext: RSSChannelContext, RSSContentContext {
    /// The context type used within an RSS item.
    public typealias ItemContext = RSS.ItemContext
  }
  /// The context within an RSS feed's `<item>` elements.
  public enum ItemContext: RSSItemContext {}
  /// The context within an RSS item's `<guid>` element.
  public enum GUIDContext {}
}

extension RSS {
  internal static let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
  }()
}

extension Document where Format: RSSBasedDocumentFormat {
  internal static func feed(_ nodes: Node<Format.FeedContext>...) -> Document {
    Document(elements: [
      .xml(.version(1.0), .encoding(.utf8)),
      .rss(
        .version(2.0),
        .namespace("atom", "http://www.w3.org/2005/Atom"),
        .namespace("content", "http://purl.org/rss/1.0/modules/content/"),
        .group(nodes)
      ),
    ])
  }
}
