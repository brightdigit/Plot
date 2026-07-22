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

/// Convenience type that can be used to create an `Input` component
/// for submitting an HTML form.
public struct SubmitButton: Component {
  /// The name of the component's element. Maps to the `name` attribute.
  public var name: String?
  /// The title of the button. Maps to the `value` attribute.
  public var title: String

  /// The content and behavior of this component.
  public var body: Component {
    Input(type: .submit, name: name, value: title)
  }

  /// Create a new submit button.
  /// - parameters:
  ///   - name: The name of the component's element. Maps to the `name` attribute.
  ///   - title: The title of the button. Maps to the `value` attribute.
  public init(name: String? = nil, title: String) {
    self.name = name
    self.title = title
  }

  /// Create a new submit button without a name
  /// - parameter title: The title of the button. Maps to the `value` attribute.
  public init(_ title: String) {
    self.init(title: title)
  }
}
