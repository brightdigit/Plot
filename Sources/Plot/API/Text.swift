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

/// Component used to render either plain or styled text.
///
/// All special characters that can't be rendered as-is within an HTML
/// document are automatically escaped when using this component.
/// To render raw, non-escaped HTML strings, use `Node.raw`.
public struct Text: Component {
  /// The content and behavior of this component.
  public var body: Component { node }
  private var node: Node<HTML.BodyContext>

  /// Initialize a `Text` instance using a string
  /// - parameter string: The string of text that should be rendered.
  public init(_ string: String) {
    self.init(node: .text(string))
  }

  private init(node: Node<HTML.BodyContext>) {
    self.node = node
  }

  /// Concatenate two pieces of text.
  /// - Returns: The combined text.
  public static func + (lhs: Text, rhs: Text) -> Text {
    Text(node: .group(lhs.node, rhs.node))
  }

  /// Turn this text bold by wrapping it in a `<b>` element.
  public func bold() -> Text {
    Text(node: .b(node))
  }

  /// Turn this text italic by wrapping it in an `<em>` element.
  public func italic() -> Text {
    Text(node: .em(node))
  }

  /// Underline this text by wrapping it in a `<u>` element.
  public func underlined() -> Text {
    Text(node: .u(node))
  }

  /// Apply strikethrough styling to this text by wrapping it
  /// in an `<s>` element.
  public func strikethrough() -> Text {
    Text(node: .s(node))
  }

  /// Add a line break after this text, using the `<br>` element.
  public func addLineBreak() -> Text {
    Text(node: .group(node, .br()))
  }
}
