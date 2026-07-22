/**
 *  Plot
 *
 *  Copyright (c) 2021 John Sundell. Licensed under the MIT license, as follows:
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

internal final class ElementRenderingBuffer {
  internal var containsChildElements = false

  private let element: AnyElement
  private let indentation: Indentation?
  private var body = ""
  private var attributes = [AnyAttribute]()
  private var attributeIndexes = [String: Int]()

  internal init(element: AnyElement, indentation: Indentation?) {
    self.element = element
    self.indentation = indentation
  }

  internal func add(_ attribute: AnyAttribute) {
    if let existingIndex = attributeIndexes[attribute.name] {
      if attribute.replaceExisting {
        attributes[existingIndex].value = attribute.value
      } else if let newValue = attribute.nonEmptyValue {
        if let existingValue = attributes[existingIndex].nonEmptyValue {
          attributes[existingIndex].value = existingValue + " " + newValue
        } else {
          attributes[existingIndex].value = newValue
        }
      }
    } else {
      attributeIndexes[attribute.name] = attributes.count
      attributes.append(attribute)
    }
  }

  internal func add(_ text: String, isPlainText: Bool) {
    if !isPlainText, indentation != nil {
      body.append("\n")
    }

    body.append(text)
  }

  // This assembles an element's opening/closing tags across several independent
  // conditions; splitting it would risk changing the rendered output.
  // swiftlint:disable:next cyclomatic_complexity
  internal func flush() -> String {
    guard !element.name.isEmpty else {
      return body
    }

    let whitespace = indentation?.string ?? ""
    let padding = element.paddingCharacter.map(String.init) ?? ""
    var openingTag = "\(whitespace)<\(padding)\(element.name)"

    for attribute in attributes {
      let string = attribute.render()

      if !string.isEmpty {
        openingTag.append(" " + string)
      }
    }

    let openingTagSuffix = padding + ">"

    switch element.closingMode {
    case .standard,
      .selfClosing where containsChildElements:
      var string = openingTag + openingTagSuffix + body

      if indentation != nil && containsChildElements {
        string.append("\n\(whitespace)")
      }

      return string + "</\(element.name)>"
    case .neverClosed:
      return openingTag + openingTagSuffix + body
    case .selfClosing:
      return openingTag + "/" + openingTagSuffix
    }
  }
}
