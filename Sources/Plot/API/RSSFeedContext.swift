/**
*  Plot
*  Copyright (c) John Sundell 2021
*  MIT license, see LICENSE file for details
*/

public protocol RSSFeedContext {
  /// The feed's channel context.
  associatedtype ChannelContext: RSSChannelContext
}
