/**
*  Plot
*  Copyright (c) John Sundell 2021
*  MIT license, see LICENSE file for details
*/

public protocol RSSBasedDocumentFormat: DocumentFormat where RootContext: RSSRootContext {
  /// The context of the document's feed
  associatedtype FeedContext: RSSFeedContext
}
