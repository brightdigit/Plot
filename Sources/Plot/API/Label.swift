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

/// Component used to wrap another component within a `<label>` element, which
/// is typically used to add interactive labels to inputs within a form.
public struct Label: Component {
  /// The text that the label should display.
  public var text: Text
  /// A closure that provides the label's child components.
  @ComponentBuilder public var content: ContentProvider

  /// The content and behavior of this component.
  public var body: Component {
    Node.label(.component(text), .component(content()))
  }

  /// Create a new label instance.
  /// - parameters:
  ///   - text: The text that the label should display.
  ///   - content: A closure that provides the label's child components.
  public init(
    _ text: Text,
    @ComponentBuilder content: @escaping ContentProvider
  ) {
    self.text = text
    self.content = content
  }

  /// Create a new label instance.
  /// - parameters:
  ///   - text: The text that the label should display.
  ///   - content: A closure that provides the label's child components.
  public init(
    _ text: String,
    @ComponentBuilder content: @escaping ContentProvider
  ) {
    self.init(Text(text), content: content)
  }
}
