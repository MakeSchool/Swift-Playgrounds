/*:
# Welcome to Swift!
This is the first in a series of short tutorials designed to get you up to speed with Swift-specific topics. You all have seen at least one programming language before, so these tutorials are going to focus on things that are new or special to Swift. We love Swift and hope you will too!
*/

/*:
# Variables
Variables associate a name to a value. Here's how you would declare a variable in Swift:
*/

var height = 6

/*:
We just declared a variable called `height` and set its initial value to `6`. Let's try changing that value.
*/

height = 10

height

/*:
If you look at the right side of your screen, you will see the value of `height` has changed to 10. As long as you define a variable with the keyword `var`, you can change its value later on.
*/

/*:
# Constants
Unlike variables, constants can not be changed. You can declare a constant using the word `let`:
*/

let pi = 3.14 // Mmm, pi.

/*:
Suppose we want to try to bend the rules of mathematics and change the value of pi. Try changing `pi` by uncommenting the following line. You can uncomment it by deleting the `//`
*/

// pi = 2

/*:
Notice that you get an error on that line. This is because you cannot change the value of a constant. Clicking on the error sign would show you the following:
`Cannot assign to 'let' value 'pi'`

If you've declared a variable using `let`, you will not be able to change its value later on.

To get rid of the error, comment it again by adding `//` to the beginning of that line.
*/


/*:
## Naming Variables and Constants
When naming variables and constants, most Swift programmers use a convention called CamelCase. Here's how you can follow it:
*/

// Correct
var yourHeight = 5
let upcomingAppVersion = 1.1

// Wrong
var YourHeight = 6
let Upcomingappversion = 1.1


/*:
The rules are as follows:
* Start the first word in the variable name with a lowercase letter.
* Start any subsequent word with an uppercase letter.
*/


/*:
For more details on what we covered in this tutorial, please visit [Apple's Variables and Constants guide.](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID310)
*/
