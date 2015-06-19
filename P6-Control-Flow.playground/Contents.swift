/*:
# Control Flow
In this tutorial, we'll cover how to use the following statments in Swift: `if`, `for`, `while`, `switch`.

## `if` statments
A simple `if` statment in Swift looks like the following:
*/

let isHuman = true

if isHuman {
    println("I'm a human")
} else {
    println("Non human")
}

//: Note that parentheses are optional for `if` statments in Swift.

/*:
## `for` Loops
There are two types of `for` loops in Swift. Apple explains the two as:
* The `for-in` loop performs a set of statements for each item in a sequence.
* The `for` loop performs a set of statements until a specific condition is met, typically by incrementing a counter each time the loop ends.
*/

//: ### `for-in`

let cities = ["New York", "Paris", "London", "Shanghai"]

for city in cities {
    println("I live in \(city)")
}

/*:
The `for-in` loop is similar to a Python `for` loop or a Java `enhanced for` loop.

We can also use a `for-in` with a range of numbers:
*/

for index in 1...3 {
    println("I can count to \(index)")
}

/*:
### `for`
You can also define for loops in the following format:
*/

for var index = 0; index < 3; index++ {
    println("I can count to \(index)")
}
/*:
This looks more like a standard Java for loop.
The format is as follows:

for initialization; condition; increment {
statements
}
*/

/*:
## `while` Loops
A `while` loop keeps running as long as its condition is `true`.
*/

var result = 1

while result < 60 {
    result *= 5
}

println(result)

/*:
`result` will be updated as follows: 1, 5, 25, 50, 125. Notice that the loop ran 4 times, but it stopped once `result` became more than 60.

The format for `while` loops is:

while condition {
statements
}
*/

/*:
## `switch` statement
A switch statement allows you to define what happens for specific values of a variable.
Here, we decide what to do based on what `grade` is. We could do the same thing with lots of `if` statements, but the `switch` syntax is more compact and easier to read.
*/

let grade = "A"

switch grade {
case "A":
    println("Excellent grade")
case "B":
    println("Good grade")
case "C":
    println("Passing grade")
default:
    println("Unknown grade")
}
/*:
Two important things you should keep in mind when using `switch` in Swift:
* You don't need to add a `break` statment after every condition. (Yay!)
* The `default` case is like an `else` case that would run if non of the previous conditions are met. Every `switch` statment must have a `default` case.
*/

/*:
For more details on what we covered here, please visit [Apple's control flow guide.](https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/ControlFlow.html#//apple_ref/doc/uid/TP40014097-CH9-ID120)
*/
