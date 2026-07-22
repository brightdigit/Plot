/**
 *  Plot
 *
 *  Copyright (c) 2021 John Sundell. Licensed under the MIT license, as follows:
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

/// Result builder used to combine all of the `Component` expressions that appear
/// within a given attributed scope into a single `ComponentGroup`.
///
/// You can annotate any function or closure with the `@ComponentBuilder` attribute
/// to have its contents be processed by this builder. Note that you never have to
/// call any of the methods defined within this type directly. Instead, the Swift
/// compiler will automatically map your expressions to calls into this builder type.
@resultBuilder public enum ComponentBuilder {
  /// Build a `ComponentGroup` from a list of components.
  /// - parameter components: The components that should be included in the group.
  /// - Returns: The resulting component group.
  public static func buildBlock(_ components: Component...) -> ComponentGroup {
    ComponentGroup(members: components)
  }

  /// Build a flattened `ComponentGroup` from an array of component groups.
  /// - parameter groups: The component groups to flatten into a single group.
  /// - Returns: The resulting component group.
  public static func buildArray(_ groups: [ComponentGroup]) -> ComponentGroup {
    ComponentGroup(members: groups.flatMap { $0 })
  }

  /// Pick the first `ComponentGroup` within a conditional statement.
  /// - parameter component: The component to pick.
  /// - Returns: The resulting component group.
  public static func buildEither(first component: ComponentGroup) -> ComponentGroup {
    component
  }

  /// Pick the second `ComponentGroup` within a conditional statement.
  /// - parameter component: The component to pick.
  /// - Returns: The resulting component group.
  public static func buildEither(second component: ComponentGroup) -> ComponentGroup {
    component
  }

  /// Build a `ComponentGroup` from an optional group.
  /// - parameter component: The optional to transform into a concrete group.
  /// - Returns: The resulting component group.
  public static func buildOptional(_ component: ComponentGroup?) -> ComponentGroup {
    component ?? ComponentGroup(members: [])
  }
}
