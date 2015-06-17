//: ## Strings in Swift
//:
//: You're probably familiar with the idea of strings from other programming languages you know. Simply put, strings are sequences of characters. Most often, strings contain text that will be displayed to users of your app. In this playground, we will talk about how you can use strings in Swift.

import UIKit

//: ### String Literals
//: 
//: The simplest kind of string to create is the **string literal**. This is a string whose value is known at compile-time, and it is written as a sequence of characters surrounded by double quotes:

let greeting = "Hello, Make School!"

//: ### Putting Strings Together and Tearing Them Apart
//: 
//: You can glue (concatenate) strings together with the `+` operator:

let season = "summer"
let salutation = "Have a nice " + season + "!"

//: Also, if you want to join an array of strings together, you can use the `join` method of String to conjoin them with a delimiter of your choosing:

let beetles = " and ".join(["John", "Paul", "Ringo", "George"])

//: You can go in the opposite direction, too, with a method borrowed from NSString:

let brokenUpBeetles = beetles.componentsSeparatedByString(" and ")

//: ### Mutating Strings
//: 
//: When a string is assigned to a constant (with the `let` keyword), that string cannot be modified. So far, we have only created such **immutable** strings.
//: If we want to change a string in-place, perhaps by adding another string onto the end of it, we declare it as a variable (note the `var` keyword):

var mutableString = "Call me"
mutableString += " maybe"

//: The `+=` operator adds the second string to the first. It's shorthand for `mutableString = mutableString + " maybe"`.

//: ### String Interpolation
//: 
//: One of the most powerful features of Strings in Swift is **string interpolation**. Interpolation allows us to incorporate the values of variables by name when constructing a string. References are made by surrounding the variable name with `\(` and `\)`. Let's revisit one of the examples above using string interpolation:

let nextSeason = "fall"
let farewell = "See you in the \(nextSeason)"

//: But it doesn't stop there. In addition to variable names, you can include arbitrary expressions inside the interpolation segment:

let radius:Double = 3
let complexInterpolation = "The area of my circle is \(M_PI * radius * radius)"

//: ### Using `println` for Debugging
//:
//: Sometimes things go wrong in our programs. Sometimes you just want to see how a value is changing as your program executes. When we aren't in the context of a Playground, we don't have the benefit of the side pane showing us these intermediate values. At times like these, we need a way to print to Xcode's debug console. We can do this with Swift's `println` function. It takes a String and writes it to the debug area so we can see what's going on.

let answer = 42
println("The answer is \(answer)")

//: ### Indexing into Strings
//:
//: Unlike many other languages, Swift does not allow you to extract a single character from a string by indexing into it:

let barnResidents = "🐮🐔🐷🐴"
let position = 2
//let pig = barnResidents[position] // Nope! "Cannot subscript String with an Int" 😱

//: This is because characters in Swift Strings actually represent conceptual units called **extended grapheme clusters** that don't match one-to-one with the bytes used to encode the string. You don't need to worry about what a grapheme cluster is; what matters is that you can't use a plain old integer index.
//:
//: Instead, you need to use the `advance` function, which uses special knowledge about how Strings store characters to calculate a suitable index:

let index = advance(barnResidents.startIndex, position)
let realPig = barnResidents[index]

//: ### Iterating Over Strings
//: 
//: We can use a `for` loop to get each Character in sequence from a String:

for animal in barnResidents {
    let statusReport = "\(animal) is in the barn."
}

//: ### `String` is a Value Type
//: 
//: In Swift, strings follow the semantics of **value types**. That means that when you assign a string value to a variable, or pass a string value to a function, the destination gets its own "copy" of the string. If the new string is then modified, these changes have no effect on the original string. This is in contrast to **reference types**, where changing
//: 
//: The reason I put "copy" in quotes above is that, really, strings only **appear** to be copied when they are assigned. Behind the scenes, Swift is clever enough not to create an all-new instance of the string immediately. Only when a string is changed does Swift allocate the new memory for storing the modified string.

let tigersAndBears = "🐯🐯🐻🐻"
// After this line executes, `tigersAndMoreBears` points to exactly the same memory as `tigersAndBears`:
var tigersAndMoreBears = tigersAndBears
// After this line executes, the two strings point to two distinct areas in memory:
tigersAndMoreBears += "🐨🐨"

//: ### Conclusion
//:
//: In this playground, you've learned about some of the basic and intermediate operations you can perform on Strings in Swift: creating literals, concatenating strings together and splitting them apart, string interpolation, and indexing into strings. There are many more things you can do with Strings, so explore the Swift standard library, and remember that you can also use methods from Cocoa's `NSString` as well. There are some great utilities for manipulating strings in there!
