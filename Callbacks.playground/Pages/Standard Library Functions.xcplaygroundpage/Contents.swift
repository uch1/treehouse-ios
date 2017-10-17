// Standard Library FunctionsLibrary

let values = [1,2,3,4,5]

var newArray = Array<Int>()

for number in values {
    newArray.append(number * 2)
}

//  HIGH ORDER FUNCTION: MAP
// The map function allows us to apply a transformation to each element in an array. Map is a declarative approach

//let doubledNumbers = values.map { $0 * 2 }
//
//extension Array {
//    func customMap<T>(_ transform: (Element) -> T) -> [T] {
//        var result = [T]()
//
//        for x in self {
//            result.append(transform(x))
//        }
//
//        return result
//    }
//}

//let integerValues = ["1","2","3","4","5"].customMap { Int($0) }
//
///***************/
//import Foundation
//
//struct Formatter {
//    static let formatter = DateFormatter()
//
//    static func date(from string: String) -> Date? {
//        formatter.dateFormat = "d MMM yy"
//        return formatter.date(from: string)
//    }
//}
//
//let dateStrings = ["20 Oct 1978", "11 Jan 1947", "28 Mar 2002"]
//
//let dates = dateStrings.customMap { Formatter.date(from: $0) }
//print(dates)

// HIGH ORDER FUNCTIONS: FLAT MAP
// Where map applied a transformation function to elements in an array, flatMap let's us do the same thing on a nested array.
struct Post {
    var content: String
    var tags: [String]
}

let blog = [
    Post(content: "Hello, world", tags: ["first", "programming"]),
    Post(content: "Just another short post", tags: ["general"])
]

let tags = blog.flatMap { $0.tags }

extension Array {
    func customFlatMap<T>(_ transform: (Element) -> [T]) -> [T] {
        var result = [T]()
        
        for x in self {
            result.append(contentsOf: transform(x))
        }
        return result
    }
}

// signature of  custom map(): func map<T>(_ transform: (Element) -> T) -> [T]
// signature of actual map(): func map<T>(_ transform: (Element) throws -> T) rethrows -> [T]

struct Account {
    let username: String
    let billingAddress: String?
}

let allUsers = [
    Account(username: "pasanpr", billingAddress: nil),
    Account(username: "benjakuben", billingAddress: "7108 Calderwood Drive"),
    Account(username: "uchenna12", billingAddress: nil),
    Account(username: "spiderman1", billingAddress: "7109 Calderwood Drive")
]

let validAddresses = allUsers.flatMap { $0.billingAddress}.count

// HIGH ORDER FUNCTIONS: FILTER
// The filter function allows us to easily narrow down an array of elements to values that match a predicate.
// filter function always have to return a boolean value
let evenNumbers = (1...100).filter { $0 % 2 == 0 }
print(evenNumbers)

extension Array {
    func customFilter(_ isIncluded: (Element) -> Bool) -> [Element] {
        var results = [Element]()
        
        for x in self where isIncluded(x) {
            results.append(x)
        }
        return results
    }
}

let somePUsers = allUsers.customFilter { $0.username.characters.first == "p" }
print(somePUsers)

let numbers = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

let oddValues = numbers.filter { $0 % 2 != 0 }
print(oddValues)

// HIGH ORDER FUNCTIONS: REDUCE

let scores = [10, 12, 11, 14, 56, 99]

let totalScore = scores.reduce( 0, { total, score in total + score })
//print(totalScore)

extension Array {
    func customReduce<Result>(_ initial: Result, _ nextPartialResult: (Result,
        Element) -> Result) -> Result {
        var result = initial
        
        for x in self {
            result = nextPartialResult(result, x)
        }
        return result
    }
}

let dataSet = (1...100).filter { $0 % 3 == 0 && $0 % 7 == 0}
let identifier = dataSet.reduce("", { string, number in string + "\(number)" })
identifier





















