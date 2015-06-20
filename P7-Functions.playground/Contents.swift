import UIKit

/*:
# Functions
Programming is not powerful without functions. Functions are a block of code that perform a specific task. They are there to make code more organized, more readable, and more reusable. Let's dig in to see how it works!
*/
/*:
Here's how you declare a function with no parameters or return value.
*/
func doNothing() {
    
}
/*:
If you want to add a parameter, you guessed it - it goes within the parantheses.

Notice the parameter name comes first, followed by colon and type, just like normal variable declarations.
*/
func takesParam(name: String) {
    
}
/*:
Here's how you return a value back to the caller:
*/
func returnsSomething(name: String) -> String {
    return name + "!"
}
/*:
Try commenting out the code within the function. What happens?

The compiler gives an error, becuase the function is telling the caller that it will return a String, but the function never actually used the "return" keyword to send something back. The compiler prevents this code from running because it would eventually crash your program!
*/

/*:
In order to take more than one parameter, you simply separate the inputs with a comma:
*/
func difference(num1: Int, num2: Int) -> Int {
    return num1 - num2
}
/*:
Sometimes, you want a function to return more than one value back. However, in many programming languages, this is not possible and workaround strategies have been used. Well, no more! In Swift you can return multiple values back to the caller using tuples. A tuple is a data structure with a specific number of items as well as a specific sequence of those items. Let's look at a function that returns multiple items using a tuple.

In this function, we send in an array of integers as input, and expect 2 values to be returned. Notice the syntax: for the returned value, we have 2 items, first and last. They have their types declared, and they are wrapped inside parentheses. Furthermore, in order to return a tuple, the function simply wraps the items it wants to return inside parantheses.
*/
func firstLast(array: [Int]) -> (first: Int, last: Int) {
    var firstItem = array[0]
    var lastItem = array[array.count-1]
    return (firstItem, lastItem)
}
/*:
Let's see how a caller can use this function to receive 2 values back from the function. We're going to call the `firstLast` function and put the returned value (the tuple) in a variable called `result`.
*/
var numbers = [10, 30, 13, 5, 9]
let result = firstLast(numbers)

/*:
There are a few ways you can retrieve values from the tuple returned from the function:
*/
/*:
The function had defined a name for each item in the tuple, so you could simply use those names to get the values:
*/
let val1 = result.first
/*:
Also, since the items in the tuple are in a specific sequence, they can be accessed by their index. Note that, just like arrays, the first item is at index 0 not 1.
*/
let val2 = result.0
/*:
There is a totally different way to get back the values as well. You can define your own tuple items, and they will be bound to the values returned by the function. In the line below, item1 is bound to the value of the first item returned by the function. Note that they do not need to have their types defined. Why? because Swift is smart enough to realize that you are calling firstLast function which returns 2 integers, so as a programmer, you obviously wanted item1 and item2 to be integers as well. Cool, huh?
*/
let (item1, item2) = firstLast(numbers)
println(item1)
println(item2)
/*:
All right, time to talk about an advanced topic: internal and external parameter names. Coming from another programming language, you probably have not heard about such a thing, but no worries, once you understand why it is needed, you will be using it everywhere in your code.
*/
/*:
Let's first discuss the syntax. As you can see below, first you define the external name, followed by the internal name. The body of the function only sees the internal name and not the external name. Similarly, a caller will only see the external name and not the internal name.
*/
func someFunc(externalName internalName: Int) -> Int {
    return internalName + 10
}
/*:
When you define the external name for a parameter, you force the caller to use that name when they call the function:
*/
let res = someFunc(externalName: 40)
/*:
Try uncommenting the line below. What error do you get?
*/
//let res2 = someFunc(40)
/*:
Now, let's talk about why you would use external names. Look at the function below:
*/
func resize(width1: Int, height1: Int, width2: Int, height2: Int) {

}
/*:
Notice how this function is being called. The caller sends in 4 numbers, but it is confusing which number matches which parameter. This is how bugs are made! Imagine accidentally switching two of these numbers, and everything falls apart.
*/
resize(20, 30, 100, 400)
/*:
This is where external names come in handy. You can force the caller to use the external names when calling the function to make it easier for them to see which value matches which parameter. Look at this modified version:
*/
func resize2(fromWidth width1: Int, fromHeight height1: Int, toWidth width2: Int, toHeight height2: Int) {
    
}
/*:
Look at how much more readable the line below is! If a programmer comes back later on to this code, she knows exactly what is happening. She does not have to go to look at the definition of the function to figure out what is happening on this line. Everything is explained right there in one line. It is obvious that the code is resizing (something) from width 20 to width 100 and from height 30 to height 400. This is all thanks to the power of internal/external parameter names!
*/
resize2(fromWidth: 20, fromHeight: 30, toWidth: 100, toHeight: 400)
/*:
Sometimes, you might not even need to define 2 names for a parameter. You can use one name for both. All you have to do is add # to the beginning of the name to tell Swift that you want to use one name for both internal and external names:
*/
func resize3(#fromWidth: Int, #fromHeight: Int, #toWidth: Int, #toHeight: Int) {
    
}










