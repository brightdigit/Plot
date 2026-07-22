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

/// A representation of a document, which is the root element for all formats
/// that can be expressed using Plot. For example, an HTML document will have
/// the type `Document<HTML>`, and an RSS feed `Document<RSS>`.
///
/// You normally don't have to interact with this type directly, unless you want
/// to define your own custom document format, since the built-in formats (such
/// as `HTML`, `RSS` and `XML`) completely wrap this type. To create custom
/// `Document` values, use the `.custom` static factory methods.
public struct Document<Format: DocumentFormat> {
  /// The root elements that make up this document. See `Element` for more info.
  public var elements: [Element<Format.RootContext>]
}

extension Document {
  /// Create a `Document` value using a custom `DocumentFormat` type, with a list
  /// of elements that make up the root of the document.
  /// - parameter elements: The new document's root elements
  /// - Returns: The resulting document.
  public static func custom(_ elements: Element<Format.RootContext>...) -> Self {
    Document(elements: elements)
  }

  /// Create a `Document` value using an explicitly passed custom `DocumentFormat`
  /// type, with a list of elements that make up the root of the document.
  /// - Parameters:
  ///   - format: The `DocumentFormat` type to bind the document to.
  ///   - elements: The new document's root elements
  /// - Returns: The resulting document.
  public static func custom(
    withFormat format: Format.Type,
    elements: [Element<Format.RootContext>] = []
  ) -> Self {
    Document(elements: elements)
  }
}

extension Document: NodeConvertible {
  /// The node representation of this document.
  public var node: Node<Format> { .document(self) }
}
