/**
*  Plot
*  Copyright (c) John Sundell 2021
*  MIT license, see LICENSE file for details
*/

public struct Label: Component {
  /// The text that the label should display.
  public var text: Text
  /// A closure that provides the label's child components.
  @ComponentBuilder public var content: ContentProvider

  /// The content and behavior of this component.
  public var body: Component {
    Node.label(.component(text), .component(content()))
  }

  /// Create a new label instance.
  /// - parameters:
  ///   - text: The text that the label should display.
  ///   - content: A closure that provides the label's child components.
  public init(
    _ text: Text,
    @ComponentBuilder content: @escaping ContentProvider
  ) {
    self.text = text
    self.content = content
  }

  /// Create a new label instance.
  /// - parameters:
  ///   - text: The text that the label should display.
  ///   - content: A closure that provides the label's child components.
  public init(
    _ text: String,
    @ComponentBuilder content: @escaping ContentProvider
  ) {
    self.init(Text(text), content: content)
  }
}
