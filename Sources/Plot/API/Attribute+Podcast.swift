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

extension Attribute where Context == PodcastFeed.EnclosureContext {
  /// Assign an URL from which the enclosure's file can be downloaded.
  /// - parameter url: The URL to assign.
  /// - Returns: The created attribute.
  public static func url(_ url: URLRepresentable) -> Attribute {
    Attribute(name: "url", value: url.string)
  }

  /// Assign a length to the enclosure, in terms of its file size.
  /// - parameter byteCount: The file's size in bytes.
  /// - Returns: The created attribute.
  public static func length(_ byteCount: Int) -> Attribute {
    Attribute(name: "length", value: String(byteCount))
  }

  /// Assign a MIME type to the enclosure.
  /// - parameter mimeType: The MIME type to assign.
  /// - Returns: The created attribute.
  public static func type(_ mimeType: String) -> Attribute {
    Attribute(name: "type", value: mimeType)
  }
}
