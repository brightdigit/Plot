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

/// Convenience type that can be used to render a text-based `Input` component.
public struct TextField: InputComponent {
  /// The name of the text field's element. Maps to the `name` attribute.
  public var name: String?
  /// The text field's initial text value. Maps to the `value` attribute.
  public var text: String
  /// Any placeholder to render when the text field is empty.
  public var placeholder: String?
  /// Whether the text field should be required to fill in.
  public var isRequired: Bool
  /// Whether the browser should auto-focus the text field.
  public var isAutoFocused = false

  /// The content and behavior of this component.
  public var body: Component {
    Input(
      type: .text,
      name: name,
      value: text,
      isRequired: isRequired,
      placeholder: placeholder
    )
    .autoFocused(isAutoFocused)
  }

  /// Create a new text field.
  /// - parameters:
  ///   - name: The name of the text field's element. Maps to the `name` attribute.
  ///   - text: The text field's initial text value. Maps to the `value` attribute.
  ///   - placeholder: Any placeholder to render when the text field is empty.
  ///   - isRequired: Whether the text field should be required to fill in.
  public init(
    name: String? = nil,
    text: String = "",
    placeholder: String? = nil,
    isRequired: Bool = false
  ) {
    self.name = name
    self.text = text
    self.placeholder = placeholder
    self.isRequired = isRequired
  }
}
