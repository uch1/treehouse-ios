// Error and Memory
// Throwing closures allow us to throw errors but we can't mark all of them as throwing.
extension Int {
    func apply(_ value: Int, operation: (Int, Int) throws -> Int) rethrows -> Int {
        return try operation(self, value)
        //return operation(self, value)
//        do {
//            return try operation(self, value)
//        } catch {
//            fatalError()
//        }
    }
}

enum MathError: Error {
    case divideByZero
}

do {
    try 10.apply(0) {
        if $1 == 0 {
            throw MathError.divideByZero
        } else {
            return $0 / $1
        }
    }
} catch MathError.divideByZero {
    print("Error")
}

10.apply(12) { $0 + $1 }
10.apply(0) { $0 / $1 }

// Memory Consideration
class NetworkSessionManager {
    
    typealias CompletionHandler = () -> Void
    
    var completionHandler: [CompletionHandler] = []
    
    func dataTask(with handler: @escaping CompletionHandler) {
        completionHandler.append(handler)
    }
}

// Reference Cycles

class Fibonacci {
    var value: Int
    
    init(value: Int) {
        self.value = value
    }
    
    lazy var fibonacci: () -> Int = {
        // Some temporary variables
        var a = 0
        var b = 2
        
        // Add up numbers to the desired iteration.
        for _ in 0..<self.value {
            let temp = a
            a = b
            b = temp + a
        }
        return a
    }
    
    deinit {
        print("\(value) is being deinitialized. Memory deallocated")
    }
}

let f = Fibonacci(value: 7)
f.fibonacci()



























































