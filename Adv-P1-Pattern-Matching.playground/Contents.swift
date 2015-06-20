import UIKit
//: # Pattern Matching in Switch-Case Statements
//:
//: In this playground, we'll look at some of the more powerful features of switch-case blocks in Swift.
//:
//: ### Multiple Values Per Case
//:
//: You can provide a comma-separated list of matching values inside a single `case` clause, allowing you to write certain blocks more compactly than with one value per case:

let letter: Character = "b"

switch letter {
case "a", "e", "i", "o", "u":
    println("\(letter) is a vowel in English")
case "y":
    println("\(letter) is sometimes a vowel in English")
default:
    println("\(letter) is not a vowel in English")
}

//: ### Range Matching
//:
//: You can also use Swift range syntax to write compact switch-case statements when the set of values you want to match is contiguous:

let myNumber = 256

switch abs(myNumber) {
case 0..<10:
    println("\(myNumber) has one digit")
case 10..<100:
    println("\(myNumber) has two digits")
case 100..<1000:
    println("\(myNumber) has three digits")
default:
    println("\(myNumber) has more than three digits")
}

//: ### Matching Tuples
//: 
//: Before moving on, let's define an enum that expresses directions in two dimensions:

enum Direction {
    case Up
    case Down
    case Left
    case Right
}

//: Now we can define a velocity tuple that expresses a direction combined with a speed:

let velocity = (Direction.Right, 15.0)

//: We can switch on the direction component of the velocity by writing case statements that check against each of the enum values. We ignore the speed component by using the **underscore identifier** (`_`)

switch velocity {
case (.Up, _):
    println("Moving up")
case (.Down, _):
    println("Moving down")
case (.Left, _):
    println("Moving left")
case (.Right, _):
    println("Moving right")
}

//: ### Value Binding 
//:
//: We can also **bind** the value of the speed component by using the `let` keyword. This allows us to use the value of the speed inside each case statement:

switch velocity {
case (.Up, let speed):
    println("Moving up at speed \(speed)")
case (.Down, let speed):
    println("Moving down at speed \(speed)")
case (.Left, let speed):
    println("Moving left at speed \(speed)")
case (.Right, let speed):
    println("Moving right at speed \(speed)")
}

//: ### Guard Expressions
//:
//: Finally, we can add further conditional statements to each case with the `where` keyword. This allows us to match even more selectively against certain values. In the example below, we expand the case clause for moving right by checking the speed against a threshold and printing different messages if we're moving quickly or slowly:

switch velocity {
case (.Up, let speed):
    println("Moving up at speed \(speed)")
case (.Down, let speed):
    println("Moving down at speed \(speed)")
case (.Left, let speed):
    println("Moving left at speed \(speed)")
case (.Right, let speed) where speed <= 10:
    println("Moving right slowly")
case (.Right, let speed) where speed > 10:
    println("Moving right quickly")
default:
    break
}

//: ### Recap
//:
//: In this playground we've seen some advanced and powerful uses of switch-case statements. You learned how to match against more than one value at a time with lists and ranges, and how to individually switch on the components of tuples, including how to value bind other tuple components and constrain your matches with guard expressions. You may not use these features often, but they're a powerful tool in your Swift toolbox.
