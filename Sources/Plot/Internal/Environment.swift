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

internal struct Environment {
  private var values = [String: Any]()

  internal subscript<T>(key: EnvironmentKey<T>) -> T? {
    get { values["\(key.identifier)"] as? T }
    set { values["\(key.identifier)"] = newValue }
  }
}

extension Environment {
  internal final class Reference {
    internal var value: Environment?
  }

  internal struct Override {
    private let closure: (inout Environment) -> Void

    internal init<T>(key: EnvironmentKey<T>, value: T) {
      closure = { $0[key] = value }
    }

    internal func apply(to environment: inout Environment) {
      closure(&environment)
    }
  }
}
