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

/// Component used to render a link/anchor using an `<a>` element.
public struct Link: Component {
  /// The URL that the link should point to.
  public var url: URLRepresentable
  /// A closure that provides the components that should make up the link's label.
  @ComponentBuilder public var label: ContentProvider

  @EnvironmentValue(.linkRelationship) private var relationship
  @EnvironmentValue(.linkTarget) private var target

  /// The content and behavior of this component.
  public var body: Component {
    Node.a(
      .href(url),
      .unwrap(relationship, Node.rel),
      .unwrap(target, Node.target),
      .component(label())
    )
  }

  /// Create a new link instance.
  /// - parameters:
  ///   - url: The URL that the link should point to.
  ///   - label: A closure that provides the components that should make up
  ///     the link's label.
  public init(
    url: URLRepresentable,
    @ComponentBuilder label: @escaping ContentProvider
  ) {
    self.url = url
    self.label = label
  }

  /// Create a new link instance.
  /// - parameters:
  ///   - label: The link's text-based label.
  ///   - url: The URL that the link should point to.
  public init(_ label: String, url: URLRepresentable) {
    self.init(url: url) {
      Node<HTML.BodyContext>.text(label)
    }
  }
}
