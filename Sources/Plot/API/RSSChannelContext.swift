/**
*  Plot
*  Copyright (c) John Sundell 2021
*  MIT license, see LICENSE file for details
*/

public protocol RSSChannelContext {
  /// The channel's item context.
  associatedtype ItemContext: RSSItemContext
}
