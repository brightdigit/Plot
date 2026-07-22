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

/// Component used to render a `<form>` element for user-submittable data.
public struct Form: Component {
  /// The URL that the form's data should be submitted to.
  public var url: URLRepresentable
  /// The HTTP request method that should be used when submitting the form.
  public var method: HTMLFormMethod?
  /// The way that the form's data should be encoded when submitted.
  public var contentType: HTMLFormContentType?
  /// Whether the browser should validate the form before submission.
  public var enableValidation: Bool
  /// A closure that provides the form's child components.
  @ComponentBuilder public var content: ContentProvider

  /// The content and behavior of this component.
  public var body: Component {
    Node.form(
      .action(url),
      .unwrap(method, Node.method),
      .unwrap(contentType, Node.enctype),
      .novalidate(!enableValidation),
      .component(content())
    )
  }

  /// Create a new form instance.
  /// - parameters:
  ///   - url: The URL that the form's data should be submitted to.
  ///   - method: The HTTP request method that should be used when submitting the form.
  ///   - contentType: The way that the form's data should be encoded when submitted.
  ///   - enableValidation: Whether the browser should validate the form before submission.
  ///   - content: A closure that provides the form's child components.
  public init(
    url: URLRepresentable,
    method: HTMLFormMethod? = nil,
    contentType: HTMLFormContentType? = nil,
    enableValidation: Bool = true,
    @ComponentBuilder content: @escaping ContentProvider
  ) {
    self.url = url
    self.method = method
    self.contentType = contentType
    self.enableValidation = enableValidation
    self.content = content
  }
}
