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

open class GeneratorIterator {
    public let handlers: [(AnyObject?)->AnyObject]
    
    public init(handlers: [(AnyObject?)->AnyObject]) {
        self.handlers = handlers
    }
}

extension GeneratorIterator: Collection {
    public var startIndex: Int {
        return 0
    }
    
    public var endIndex: Int {
        return handlers.count - 1
    }
    
    public func index(after i: Int) -> Int {
        return i + 1
    }
    
    public subscript (position: Int) -> (AnyObject)->AnyObject {
        return handlers[position]
    }
}

extension GeneratorIterator: BidirectionalCollection {
    public func index(before i: Int) -> Int {
        return i - 1
    }
}

extension GeneratorIterator: RandomAccessCollection {}
