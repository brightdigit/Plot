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

import Foundation

/// Type used to define a group of components
///
/// The `members` contained within a `ComponentGroup` act as one
/// unit when passed around, with the exception that any modifier
/// that is applied to a group will be applied to each member
/// individually. So, for example, applying the `class` modifier
/// to a group results in each element within that group getting
/// that class name assigned to it.
public struct ComponentGroup: Component {
  /// The group's members. Will be rendered in order.
  public var members: [Component]
  /// The content and behavior of this component.
  public var body: Component { Node.components(members) }

  /// Create a new group with a given set of member components.
  /// - parameter members: The components that should be included
  ///   within the group. Will be rendered in order.
  public init(members: [Component]) {
    self.members = members
  }
}

extension ComponentGroup: ComponentContainer {
  /// Create a new component group with the given content.
  public init(@ComponentBuilder content: () -> Self) {
    self = content()
  }
}

extension ComponentGroup: Sequence {
  /// Create an iterator over the group's components.
  /// - Returns: An iterator over the group's components.
  public func makeIterator() -> Array<Component>.Iterator {
    members.makeIterator()
  }
}
