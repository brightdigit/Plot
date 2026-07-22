/**
*  Plot
*  Copyright (c) John Sundell 2021
*  MIT license, see LICENSE file for details
*/

public protocol HTMLSourceListContext: HTMLContext {
  /// The context within the element's `<source>` child elements.
  associatedtype SourceContext
}
