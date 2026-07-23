/**
*  Plot
*  Copyright (c) John Sundell 2021
*  MIT license, see LICENSE file for details
*/

internal protocol AnyNode {
  func render(into renderer: inout Renderer)
}
