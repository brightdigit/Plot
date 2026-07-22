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

/// Property wrapper that can be used to read a value from the environment.
///
/// You can annotate any `Component` property with the `@EnvironmentValue` attribute
/// to have its value be determined by the environment. Environment values are always
/// associated with an `EnvironmentKey`, and are passed downwards through a component/node
/// hierarchy until overridden by another value.
@propertyWrapper public struct EnvironmentValue<Value>: AnyEnvironmentValue {
  /// The underlying value of the wrapped property.
  public var wrappedValue: Value { environment.value?[key] ?? key.defaultValue }

  internal let environment = Environment.Reference()
  private let key: EnvironmentKey<Value>

  /// Initialize an instance of this wrapper with the `EnvironmentKey` that should
  /// be used to determine its property's value.
  /// - parameter key: The environment key to use to read this property's value.
  public init(_ key: EnvironmentKey<Value>) {
    self.key = key
  }
}
