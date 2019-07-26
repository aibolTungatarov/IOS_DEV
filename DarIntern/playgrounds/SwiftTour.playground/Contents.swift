import UIKit

var shoppingList = ["catfish", "water", "tulips"]
shoppingList[1] = "bottle of water"
var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"

let emptyArray = [String]()
let emptyDictionary = [String: Float]()

let vegetable = "red pepper"

switch vegetable {
    case "celery":
        print("Add some raisins and make ants on a log.")
    case "cucumber", "watercress":
        print("That would make a good tea sandwich.")
    case let x where x.hasPrefix("red"):
        print("Is it a spicy \(x)?")
    default:
        print("Everything tastes good in soup.")
}


var total = 0
for i in 0..<4 {
    total += i
}
print(total)
// Prints "6"


func greet(labelA person: String, labelB day: String) -> String {
    return "Hello \(person), today is \(day)."
}


func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()

var numbers = [20, 19, 7, 12]

numbers = numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})

numbers = numbers.map({ (number: Int) -> Int in
    return (number % 2 != 0) ? 0 : number
})

let sortedNumbers = numbers.sorted { $0 < $1 }
print(sortedNumbers)
// Prints "[20, 19, 12, 7]"


protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}


class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription
