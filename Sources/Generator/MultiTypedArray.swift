// The MIT License (MIT)
//
// Copyright (c) 2017 Caleb Kleveter
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Foundation

class MultiTypedArray {
    private(set) var elements: [(Any, Any.Type)] = []
    
    func add<T>(_ element: T) {
        self.elements.append((element as Any, type(of: element)))
    }
    
    func type(at position: Int) -> Any.Type {
        return elements[position].1
    }
}


extension MultiTypedArray: Collection {
    var startIndex: Int {
        return 0
    }
    
    var endIndex: Int {
        return elements.count - 1
    }
    
    func index(after i: Int) -> Int {
        return i + 1
    }
    
    subscript (position: Int) -> Any {
        return elements[position].0
    }
}

extension MultiTypedArray: BidirectionalCollection {
    func index(before i: Int) -> Int {
        return i - 1
    }
}

extension MultiTypedArray: RandomAccessCollection {}

extension MultiTypedArray: CustomStringConvertible {
    var description: String {
        return "[" + elements.map({ element, type in return "\(element)"}).joined(separator: ", ") + "]"
    }
}
