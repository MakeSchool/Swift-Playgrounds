import UIKit

//: ## Optionals in Swift
//:
//: ### Introduction to Optionals
//:
//: Sometimes, it's useful to express the fact that a variable may contain a value or no value at all. Swift allows us to do this with **optionals**. Optionals contain **either** a value **or** `nil` (meaning "no value").
//:
//: Some languages, such as Objective-C, allow a variable to contain `nil` without its type expressly indicating that a value may be absent. Swift is much more strict about when variables can lack a value, and this is very helpful in avoiding bugs where we think we have a value when in fact we don't. Functions can return an optional to indicate when the operation has failed or they have no value to give back to you.
//:
//: Syntactically, we express the fact that a value is of optional type by appending a question mark (?) to the type name. For example, here is how we declare a variable of type "optional `Int`":

var maybeAnInt: Int? = 15

//: Here, we have expressly given the variable a value of 15, but we could just as easily have assigned it `nil`:

maybeAnInt = nil

//: Now `maybeAnInt` is `nil`, which is to say it has _no value_.

//: ### Unwrapping an Optional
//:
//: We can test whether an optional has a value by comparing it to `nil`. If it is not equal to `nil`, it contains a value. We can then safely use **force unwrapping** to get its value. Force unwrapping is done by putting an exclamation point (!) after the name of the variable we want to unwrap. This assures Swift that the optional contains a value and that it is therefore safe to read. Here, we test whether `maybeAnInt` has a value, and conditionally print its value after force-unwrapping it.

if maybeAnInt != nil {
    println("maybeAnInt contains a value, and it is \(maybeAnInt!)")
} else {
    println("maybeAnInt does not contain a value")
}

//: Try changing the value of `maybeAnInt` above. Notice that the message that gets printed depends on whether or not it contains a value.

//: ### Optional Binding
//:
//: A more compact way of testing and acting on an optional value is **optional binding**, where we test for the presence of an object and give its value a new name in a narrower scope. Here, we "bind" the value of `maybeAnInt` (if present) to a new constant named `definitelyAnInt` and print it:

if let definitelyAnInt = maybeAnInt {
    println("maybeAnInt contains a value, and it is \(definitelyAnInt)")
} else {
    println("maybeAnInt does not contain a value")
}

//: Try changing the value of `maybeAnInt` again, and again take note that if it contains a value, the message indicates this and the local variable `definitelyAnInt` has the same value.

//: ### Implicitly Unwrapped Optionals
//:
//: Sometimes we want to indicate that an optional will always have a value when we need to read it. For example, this happens when we separate the declaration of an optional from the first time we set its value. To support this scenario, we can declare a variable as an **implicitly unwrapped optional**. Implicitly unwrapped optionals are declared by placing an exclamation point (!) after the type to indicate that they **can** contain `nil`, but must always have a value when they are read:

var alwaysAString: String! = nil

//: Notice that we initially assign `nil` to this implicitly unwrapped optional `String`. If we were to try to use it at this point, we would trigger a runtime error:

//let stringLength = count(alwaysAString)

//: Try uncommenting the line above and seeing what happens. You will probably notice that the remainder of the Playground can no longer be evaluated. This is because the underlying process crashes when it attempts to access the variable. That's why we have to ensure that we never read an implicitly-unwrapped optional before setting its value.

//: Let's assign a value so the variable is no longer `nil`:

alwaysAString = "Now I have a value!"

//: Now, when we print this string, it is implicitly unwrapped to the `String` value it contains:

println(alwaysAString)

//: The important takeaway here is that declaring a variable as implicitly unwrapped allows Swift to _automatically_ unwrap the value whenever it is used. This is the inverse of the usual situation: normally, we use the `!` to force-unwrap a value once we're sure it contains a value. With implicitly unwrapped optionals, we assert from the moment we declare the variable that it will _never_ be `nil` when it is used. That can save us a lot of typing (and visual clutter!) for variables that are accessed frequently.

//: ### Calling Methods on Optionals
//:
//: In order to call methods on optionals, you must first give Swift something that is non-optional, either through an implicitly unwrapped optional or by force unwrapping the optional where the method is called. Calling a method directly on an optional is a compile-time error:

//let intDescription = maybeAnInt.description // Value of optional type 'Int?' not unwrapped!

//: _Note_: There is a technique called **optional chaining** that allows you to conditionally call method and access properties of optionals. [Read more here if you are interested](https://developer.apple.com/library/prerelease/mac/documentation/Swift/Conceptual/Swift_Programming_Language/OptionalChaining.html ).

//: ### Recap
//:
//: In this Playground we have looked at some of the capabilities of optionals in Swift. Optionals are a fundamental part of Swift that allow us to be very clear about when variables contain values and when they do not. All of the rules associated with optionals can be confusing at first, but you will quickly gain an intuition by putting your knowledge into practice. The compiler will try to help you along the way, reminding you when you make mistakes.
