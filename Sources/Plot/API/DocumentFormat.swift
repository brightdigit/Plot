/**
*  Plot
*  Copyright (c) John Sundell 2021
*  MIT license, see LICENSE file for details
*/

public protocol DocumentFormat {
  /// The root context of the document, which all top-level elements are
  /// bound to. Each document format is free to define any number of contexts
  /// in order to limit where an element or attribute may be placed.
  associatedtype RootContext
}
