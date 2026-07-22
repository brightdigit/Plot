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

/// Component that can be used to render a user-editable text area
/// using the `<textarea>` element.
public struct TextArea: InputComponent {
  /// The initial text that the text area should contain.
  public var text: String
  /// The name of the component's element. Maps to the `name` attribute.
  public var name: String?
  /// The vertical size of the text area, measured in rows.
  /// Maps to the `rows` attribute.
  public var numberOfRows: Int?
  /// The horizontal size of the text area, measured in columns.
  /// Maps to the `cols` attribute.
  public var numberOfColumns: Int?
  /// Whether the text area should be required to fill in.
  public var isRequired: Bool
  /// Whether the browser should auto-focus the text field.
  public var isAutoFocused = false

  /// The content and behavior of this component.
  public var body: Component {
    Node.textarea(
      .text(text),
      .unwrap(name, Node.name),
      .unwrap(numberOfRows, Node.rows),
      .unwrap(numberOfColumns, Node.cols),
      .required(isRequired),
      .unwrap(isAutoFocused, Node.autofocus)
    )
  }

  /// Create a new text area.
  /// - parameters:
  ///   - text: The initial text that the text area should contain.
  ///   - name: The name of the component's element. Maps to the `name` attribute.
  ///   - numberOfRows: The vertical size of the text area, measured in rows.
  ///     Maps to the `rows` attribute.
  ///   - numberOfColumns: The horizontal size of the text area, measured in columns.
  ///     Maps to the `cols` attribute.
  ///   - isRequired: Whether the text area should be required to fill in.
  public init(
    text: String = "",
    name: String? = nil,
    numberOfRows: Int? = nil,
    numberOfColumns: Int? = nil,
    isRequired: Bool = false
  ) {
    self.text = text
    self.name = name
    self.numberOfRows = numberOfRows
    self.numberOfColumns = numberOfColumns
    self.isRequired = isRequired
  }
}
