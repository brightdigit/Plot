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

extension Node where Context == PodcastFeed.ItemContext {
  /// Add an audio enclosure to the item, which defines where a podcast player
  /// can fetch the audio associated with the episode that the item represents.
  /// - Parameters:
  ///   - url: The URL of the audio file.
  ///   - byteSize: The size of the audio file in bytes.
  ///   - type: The MIME type of the audio (default: "audio/mpeg", or MP3).
  ///   - title: The title of the episode.
  /// - Returns: The created node.
  public static func audio(
    url: URLRepresentable,
    byteSize: Int,
    type: String = "audio/mpeg",
    title: String
  ) -> Node {
    .group(
      .enclosure(
        .url(url),
        .length(byteSize),
        .type(type)
      ),
      .mediaContent(
        .url(url),
        .length(byteSize),
        .type(type),
        .isDefault(true),
        .medium(.audio),
        .title(title)
      )
    )
  }
}
