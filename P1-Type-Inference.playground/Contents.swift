/*:
# Types
If you want to store a certain type of a value (like a String or an Int) in a variable, you can do it as follows:
*/

var population : Int = 20

/*:
From now on, `population` will always be an Integer (shortened as `Int`). Let's test it out by trying to set `population` to a decimal number. 

Uncomment the following line to see the error:
*/

// population = 15.343234

/*:
The error says:
`Cannot assign value of type 'Double' to a value of type 'Int'.` A `Double` is a number that can have decimal points. We told Swift we were going to give it an Integer, and instead we gave it a Double. Swift is sad.

__Note: Make sure you comment the line again before continuing.__
*/

/*:
# Type Inference

In Swift, specifying the type of your value is optional. Swift can automatically infer, or guess, the type of value you're assigning to your variable. It's a pretty smart language.
*/

var humans = 10

/*:
Even though we didn't use:

    var humans : Int

Swift automatically knows the type of our variable because we assigned it to `10`, which is clearly an integer value. Let's try assigning a decimal number to `humans`. Remove the comment in the line below to see the error:
*/

// humans = 6.4342

/*:
Silly programmer! You can't have four tenths of a person! Because Swift automatically inferred that `humans` is an `Int` when we first defined it, Swift won't let us assign a `Double` to it. No partial humans here.

__Note: Make sure you comment the line above again before continuing.__
*/

/*:
To check the type that Swift has inferred, hold down the "option" key on your keyboard while clicking on `pi` or `count` below:
*/

let pi = 3.14
var count = 5

/*:
For more details on what we covered in this tutorial, please visit [Apple's Type Inference guide.](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID322)
*/
