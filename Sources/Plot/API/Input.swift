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

/// Component used to render input controls using the `<input>` element.
public struct Input: InputComponent {
  /// The type of input to render. See `HTMLInputType` for more info.
  public var type: HTMLInputType
  /// The rendered element's name. Maps to the `name` attribute.
  public var name: String?
  /// The rendered element's value. Maps to the `value` attribute.
  public var value: String?
  /// Whether the input element should be considered required.
  public var isRequired: Bool
  /// Any placeholder to render within the input element.
  public var placeholder: String?
  /// Whether the input should be focused automatically.
  public var isAutoFocused = false

  @EnvironmentValue(.isAutoCompleteEnabled) private var isAutoCompleteEnabled

  /// The content and behavior of this component.
  public var body: Component {
    Node.input(
      .type(type),
      .unwrap(name, Attribute.name),
      .unwrap(value, Attribute.value),
      .required(isRequired),
      .unwrap(placeholder, Attribute.placeholder),
      .autofocus(isAutoFocused),
      .unwrap(isAutoCompleteEnabled, Attribute.autocomplete)
    )
  }

  /// Create a new input component instance.
  /// - parameters:
  ///   - type: The type of input to render. See `HTMLInputType` for more info.
  ///   - name: The rendered element's name. Maps to the `name` attribute.
  ///   - value: The rendered element's value. Maps to the `value` attribute.
  ///   - isRequired: Whether the input element should be considered required.
  ///   - placeholder: Any placeholder to render within the input element.
  public init(
    type: HTMLInputType,
    name: String? = nil,
    value: String? = nil,
    isRequired: Bool = false,
    placeholder: String? = nil
  ) {
    self.type = type
    self.name = name
    self.value = value
    self.isRequired = isRequired
    self.placeholder = placeholder
  }
}
