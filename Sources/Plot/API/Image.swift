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

/// Component used to render an `<img>` element for displaying an image.
public struct Image: Component {
  /// The URL of the image to render.
  public var url: URLRepresentable
  /// An alternative text that describes the image in case it couldn't be
  /// loaded, or if the user is using a screen reader.
  public var description: String

  /// The content and behavior of this component.
  public var body: Component {
    Node<HTML.BodyContext>.img(.src(url), .alt(description))
  }

  /// Create a new image instance.
  /// - parameters:
  ///   - url: The URL of the image to render.
  ///   - description: An alternative text that describes the image in case
  ///     it couldn't be loaded, or if the user is using a screen reader.
  public init(
    url: URLRepresentable,
    description: String
  ) {
    self.url = url
    self.description = description
  }

  /// Create a new decorative image that doesn't have a description.
  /// - parameter url: The URL of the image to render.
  public init(_ url: URLRepresentable) {
    self.init(url: url, description: "")
  }
}
