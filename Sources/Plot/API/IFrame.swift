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

/// Component used to render an `<iframe>` element for an embedded page.
public struct IFrame: Component {
  /// The URL of the page to embed.
  public var url: URLRepresentable
  /// Whether a border should be added around the element.
  public var addBorder: Bool
  /// Whether the embedded page should be allowed to enter full screen mode.
  public var allowFullScreen: Bool
  /// What browser features that the embedded page should have access to.
  public var enabledFeatureNames: [String]

  /// The content and behavior of this component.
  public var body: Component {
    Node.iframe(
      .src(url),
      .frameborder(addBorder),
      .allowfullscreen(allowFullScreen),
      .allow(enabledFeatureNames.joined(separator: "; "))
    )
  }

  /// Create a new iframe instance.
  /// - parameters:
  ///   - url: The URL of the page to embed.
  ///   - addBorder: Whether a border should be added around the element.
  ///   - allowFullScreen: Whether the embedded page should be allowed to
  ///     enter full screen mode.
  ///   - enabledFeatureNames: What browser features that the embedded page
  ///     should have access to. Maps to the `allow` attribute.
  public init(
    url: URLRepresentable,
    addBorder: Bool,
    allowFullScreen: Bool,
    enabledFeatureNames: [String]
  ) {
    self.url = url
    self.addBorder = addBorder
    self.allowFullScreen = allowFullScreen
    self.enabledFeatureNames = enabledFeatureNames
  }
}
