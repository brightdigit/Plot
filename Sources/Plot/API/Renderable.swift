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

/// Protocol adopted by all types that can be rendered into a string.
///
/// You never have to conform to this protocol yourself, instead Plot
/// ships with multiple types that use this protocol, for example `Node`,
/// `Element` and `Document`.
public protocol Renderable {
  /// Render this object into a string, optionally with a certain kind of indentation.
  /// - parameter indentationKind: What kind of indentation that should be used
  ///   when rendering. Passing `nil` will result in a minified, unindented output string.
  /// - Returns: The resulting string.
  func render(indentedBy indentationKind: Indentation.Kind?) -> String
}

extension Renderable {
  /// Render this object into a minified string, without any indentation.
  public func render() -> String { render(indentedBy: nil) }
}
