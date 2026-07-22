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

extension Node where Context: RSSFeedContext {
  /// Define the RSS version that this feed is using.
  /// - parameter version: The RSS version to use.
  /// - Returns: The created node.
  public static func version(_ version: Double) -> Node {
    .attribute(named: "version", value: String(version))
  }

  /// Add a namespace to this RSS feed.
  /// - Parameters:
  ///   - name: The name of the namespace to add.
  ///   - url: The URL of the namespace's definition.
  /// - Returns: The created node.
  public static func namespace(_ name: String, _ url: URLRepresentable) -> Node {
    .attribute(named: "xmlns:\(name)", value: url.string)
  }
}

extension Node where Context == RSS.GUIDContext {
  /// Declare whether this GUID is a permalink or not.
  /// - parameter bool: Whether this GUID is a permalink to its item.
  /// - Returns: The created node.
  public static func isPermaLink(_ bool: Bool) -> Node {
    .attribute(named: "isPermaLink", value: String(bool))
  }
}
