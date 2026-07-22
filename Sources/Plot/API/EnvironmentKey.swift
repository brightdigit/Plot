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

/// Type used to define an environment key, which can be used to pass a given
/// value downward through a component/node hierarchy until its overridden by
/// another value for the same key. You can place values into the environment
/// using the `environmentValue` modifier, and you can then retrieve those
/// values within any component using the `EnvironmentValue` property wrapper.
public struct EnvironmentKey<Value> {
  internal let identifier: StaticString
  internal let defaultValue: Value

  /// Initialize a key with an explicit identifier and a default value.
  /// - Parameters:
  ///   - identifier: The identifier that the key should have. Must
  ///     be a static string that's defined using a compile time literal.
  ///   - defaultValue: The default value that should be provided
  ///     to components when no parent component assigned a value for this key.
  public init(identifier: StaticString, defaultValue: Value) {
    self.identifier = identifier
    self.defaultValue = defaultValue
  }
}

extension EnvironmentKey {
  /// Initialize a key with an inferred identifier and a default value. The
  /// key's identifier will be computed based on the name of the property or
  /// function that created it.
  /// - Parameters:
  ///   - defaultValue: The default value that should be provided
  ///     to components when no parent component assigned a value for this key.
  ///   - autoIdentifier: This parameter will be filled in by the
  ///     compiler based on the name of the call site's enclosing function/property.
  public init(defaultValue: Value, autoIdentifier: StaticString = #function) {
    self.init(identifier: autoIdentifier, defaultValue: defaultValue)
  }
}

extension EnvironmentKey {
  /// Initialize a key with an explicit identifier.
  /// - parameter identifier: The identifier that the key should have. Must
  ///   be a static string that's defined using a compile time literal.
  public init<T>(identifier: StaticString) where Value == T? {
    self.init(identifier: identifier, defaultValue: nil)
  }

  /// Initialize a key with an inferred identifier. The key's identifier will
  /// be computed based on the name of the property or function that created it.
  /// - parameter autoIdentifier: This parameter will be filled in by the
  ///   compiler based on the name of the call site's enclosing function/property.
  public init<T>(autoIdentifier: StaticString = #function) where Value == T? {
    self.init(identifier: autoIdentifier, defaultValue: nil)
  }
}

extension EnvironmentKey where Value == HTMLAnchorRelationship? {
  /// Key used to define a relationship for `Link` components. The default is `nil`
  /// (that is, no explicitly defined relationship). See the `linkRelationship`
  /// modifier for more information.
  public static var linkRelationship: Self { .init() }
}

extension EnvironmentKey where Value == HTMLAnchorTarget? {
  /// Key used to define a target for `Link` components. The default is `nil`
  /// (that is, no explicitly defined target). See the `linkTarget` modifier
  /// for more information.
  public static var linkTarget: Self { .init() }
}

extension EnvironmentKey where Value == HTMLListStyle {
  /// Key used to define a style for `List` components. The default value uses
  /// the `unordered` style (which produces `<ul>` elements). See the `listStyle`
  /// modifier for more information.
  public static var listStyle: Self { .init(defaultValue: .unordered) }
}

extension EnvironmentKey where Value == Bool? {
  /// Key used to define whether autocomplete should be enabled for `Input`
  /// components. The default is `nil` (that is, no explicitly defined value).
  /// See the `autoComplete` modifier for more information.
  public static var isAutoCompleteEnabled: Self { .init() }
}
