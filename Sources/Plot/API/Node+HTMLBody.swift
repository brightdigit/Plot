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

extension Node where Context: HTML.BodyContext {
  /// Add an `<a>` HTML element within the current context.
  /// - parameter nodes: The element's attributes and child elements.
  /// - Returns: The created node.
  public static func a(_ nodes: Node<HTML.AnchorContext>...) -> Node {
    .element(named: "a", nodes: nodes)
  }

  /// Add an `<abbr>` HTML element within the current context.
  /// - parameter nodes: The element's attributes and child elements.
  /// - Returns: The created node.
  public static func abbr(_ nodes: Node<HTML.BodyContext>...) -> Node {
    .element(named: "abbr", nodes: nodes)
  }

  /// Add an `<article>` HTML element within the current context.
  /// - parameter nodes: The element's attributes and child elements.
  /// - Returns: The created node.
  public static func article(_ nodes: Node<HTML.BodyContext>...) -> Node {
    .element(named: "article", nodes: nodes)
  }

  /// Add a `<aside>` HTML element within the current context.
  /// - parameter nodes: The element's attributes and child elements.
  /// - Returns: The created node.
  public static func aside(_ nodes: Node<HTML.BodyContext>...) -> Node {
    .element(named: "aside", nodes: nodes)
  }

  /// Add an `<audio>` HTML element within the current context.
  /// - parameter nodes: The element's attributes and child elements.
  /// - Returns: The created node.
  public static func audio(_ nodes: Node<HTML.AudioContext>...) -> Node {
    .element(named: "audio", nodes: nodes)
  }

  /// Add a `<b>` HTML element within the current context.
  /// - parameter nodes: The element's attributes and child elements.
  /// - Returns: The created node.
  public static func b(_ nodes: Node<HTML.BodyContext>...) -> Node {
    .element(named: "b", nodes: nodes)
  }

  /// Add a `<blockquote>` HTML element within the current context.
  /// - parameter nodes: The element's attributes and child elements.
  /// - Returns: The created node.
  public static func blockquote(_ nodes: Node<HTML.BodyContext>...) -> Node {
    .element(named: "blockquote", nodes: nodes)
  }

  /// Add a `<br/>` HTML element within the current context.
  public static func br() -> Node {
    .selfClosedElement(named: "br")
  }

  /// Add a `<button>` HTML element within the current context.
  /// - parameter nodes: The element's attributes and child elements.
  /// - Returns: The created node.
  public static func button(_ nodes: Node<HTML.ButtonContext>...) -> Node {
    .element(named: "button", nodes: nodes)
  }

  /// Add a `<code>` HTML element within the current context.
  /// - parameter nodes: The element's attributes and child elements.
  /// - Returns: The created node.
  public static func code(_ nodes: Node<HTML.BodyContext>...) -> Node {
    .element(named: "code", nodes: nodes)
  }

  /// Add a `<data>` HTML element within the current context.
  /// - parameter nodes: The element's attributes and child elements.
  /// - Returns: The created node.
  public static func data(_ nodes: Node<HTML.DataContext>...) -> Node {
    .element(named: "data", nodes: nodes)
  }

  /// Add a `<datalist>` HTML element within the current context.
  /// - parameter nodes: The element's attributes and child elements.
  /// - Returns: The created node.
  public static func datalist(_ nodes: Node<HTML.DataListContext>...) -> Node {
    .element(named: "datalist", nodes: nodes)
  }

  /// Add a `<del>` HTML element within the current context.
  /// - parameter nodes: The element's attributes and child elements.
  /// - Returns: The created node.
  public static func del(_ nodes: Node<HTML.BodyContext>...) -> Node {
    .element(named: "del", nodes: nodes)
  }

  /// Add a `<details>` HTML element within the current context.
  /// - parameter nodes: The element's attributes and child elements.
  /// - Returns: The created node.
  public static func details(_ nodes: Node<HTML.DetailsContext>...) -> Node {
    .element(named: "details", nodes: nodes)
  }

  /// Add a `<dl>` HTML element within the current context.
  /// - parameter nodes: The element's attributes and child elements.
  /// - Returns: The created node.
  public static func dl(_ nodes: Node<HTML.DescriptionListContext>...) -> Node {
    .element(named: "dl", nodes: nodes)
  }

  /// Add an `<em>` HTML element within the current context.
  /// - parameter nodes: The element's attributes and child elements.
  /// - Returns: The created node.
  public static func em(_ nodes: Node<HTML.BodyContext>...) -> Node {
    .element(named: "em", nodes: nodes)
  }

  /// Add an `<embed/>` HTML element within the current context.
  /// - parameter attributes: The element's attributes.
  /// - Returns: The created node.
  public static func embed(_ attributes: Attribute<HTML.EmbedContext>...) -> Node {
    .selfClosedElement(named: "embed", attributes: attributes)
  }

  /// Add a `<fieldset>` HTML element within the current context.
  /// - parameter nodes: The element's attributes and child elements.
  /// - Returns: The created node.
  public static func fieldset(_ nodes: Node<HTML.FormContext>...) -> Node {
    .element(named: "fieldset", nodes: nodes)
  }

  /// Add a `<form>` HTML element within the current context.
  /// - parameter nodes: The element's attributes and child elements.
  /// - Returns: The created node.
  public static func form(_ nodes: Node<HTML.FormContext>...) -> Node {
    .element(named: "form", nodes: nodes)
  }

  /// Add a `<footer>` HTML element within the current context.
  /// - parameter nodes: The element's attributes and child elements.
  /// - Returns: The created node.
  public static func footer(_ nodes: Node<HTML.BodyContext>...) -> Node {
    .element(named: "footer", nodes: nodes)
  }

  /// Add a `<h1>` HTML element within the current context.
  /// - parameter nodes: The element's attributes and child elements.
  /// - Returns: The created node.
  public static func h1(_ nodes: Node<HTML.BodyContext>...) -> Node {
    .element(named: "h1", nodes: nodes)
  }

  /// Add a `<h2>` HTML element within the current context.
  /// - parameter nodes: The element's attributes and child elements.
  /// - Returns: The created node.
  public static func h2(_ nodes: Node<HTML.BodyContext>...) -> Node {
    .element(named: "h2", nodes: nodes)
  }

  /// Add a `<h3>` HTML element within the current context.
  /// - parameter nodes: The element's attributes and child elements.
  /// - Returns: The created node.
  public static func h3(_ nodes: Node<HTML.BodyContext>...) -> Node {
    .element(named: "h3", nodes: nodes)
  }

  /// Add a `<h4>` HTML element within the current context.
  /// - parameter nodes: The element's attributes and child elements.
  /// - Returns: The created node.
  public static func h4(_ nodes: Node<HTML.BodyContext>...) -> Node {
    .element(named: "h4", nodes: nodes)
  }

  /// Add a `<h5>` HTML element within the current context.
  /// - parameter nodes: The element's attributes and child elements.
  /// - Returns: The created node.
  public static func h5(_ nodes: Node<HTML.BodyContext>...) -> Node {
    .element(named: "h5", nodes: nodes)
  }

  /// Add a `<h6>` HTML element within the current context.
  /// - parameter nodes: The element's attributes and child elements.
  /// - Returns: The created node.
  public static func h6(_ nodes: Node<HTML.BodyContext>...) -> Node {
    .element(named: "h6", nodes: nodes)
  }

  /// Add a `<header>` HTML element within the current context.
  /// - parameter nodes: The element's attributes and child elements.
  /// - Returns: The created node.
  public static func header(_ nodes: Node<HTML.BodyContext>...) -> Node {
    .element(named: "header", nodes: nodes)
  }
}
