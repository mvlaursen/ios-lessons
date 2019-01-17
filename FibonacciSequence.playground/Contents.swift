import Foundation

struct Fibonacci {
    let count: UInt
    
    init(count: UInt) {
        self.count = count
    }
}

extension Fibonacci: Sequence {
    struct FibonacciIterator: IteratorProtocol {
        typealias Element = UInt
        
        let count: UInt
        var index: UInt = 0
        var term0: UInt = 1
        var term1: UInt = 1
        
        init(fibonacci: Fibonacci) {
            self.count = fibonacci.count
        }
        
        mutating func next() -> UInt? {
            if index < count {
                if index > 1 {
                    if UInt.max - term1 > term0 {
                        let temp = term1
                        term1 = term0 + term1
                        term0 = temp
                    } else {
                        return nil
                    }
                }
                index += 1
                return term1
            } else {
                return nil
            }
        }
    }
    
    typealias Iterator = FibonacciIterator
    
    func makeIterator() -> Fibonacci.FibonacciIterator {
        return FibonacciIterator(fibonacci: self)
    }
}

let fib = Fibonacci(count: 99)
for (i, f) in fib.enumerated() {
    print("\(i): \(f)")
}
