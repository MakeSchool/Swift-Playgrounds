import UIKit
//: ## Generics
//:
//: We call code **generic** when it can operate on more than one type. In Swift, writing generic code is supported at a deep level by the language. In this Playground, we'll look at various aspects of generic support in Swift.

//: ### The Generics You Already Know
//: 
//: Whenever you use Swift's standard container types (such as `Array` and `Dictionary`), you are using generics. These collections allow you to store particular kinds of objects in a type-safe way by declaring the contained type when you create the container:

var myIntArray = [Int]()

//: So you can add new `Int` elements to the array:

myIntArray.append(4)
myIntArray.append(2)
myIntArray.append(5)
myIntArray.append(3)

//: ...but you can't add a `String`:

//myIntArray.append("Hi") // "Cannot invoke 'append' with an argument list of type '(String)'"

//: Constraining a collection to a particular type is a good way to avoid a whole class of bugs, and allows you
//: to be certain that it only contains elements of the declared type.

//: ### Generic Functions
//: 
//: When writing generic functions, you use angle brackets to contain the declaration of which types the function operates on. The names (such as the `T` in the function definition below) are _placeholders_: not actual types, but stand-ins for the types that will be substituted when the function is invoked.
//:
//: You can specify a series of constraints on these placeholder types, which further narrows the functions applicability. For example, in the function below, we will need to compare objects to one another with the `<` operator, which requires that they conform to the `Comparable` protocol.
//: 
//: Here is the definition of a generic function that finds the maximum value contained in an array of type `T`, a placeholder for any type that conforms to `Comparable`:

func maximumElement<T: Comparable>(array: [T]) -> T? {
    var maximum = array.first
    for element in array {
        if element > maximum {
            maximum = element
        }
    }
    return maximum
}

//: We can pass in the array of `Ints` we built earlier to see this function in action:

maximumElement(myIntArray)

//: Now let's try something slightly different:

let words = [ "coconut", "apple", "banana" ]
maximumElement(words)

//: As you can see, this function can operate on an array of `Strings` just as easily as it can operate on an array of `Ints`. This is because it can be applied to arrays containing any type that is `Comparable`, and `Strings` are comparable. "Coconut" is the greatest string in the array because it comes last in lexical (dictionary) order.

//: ### Writing a Generic Class
//: 
//: It is also possible to write your own **generic classes*. In the listing below, we build a simple **linked list**, a data type that represents a collection of objects as a sequence of nodes, each one containing a data member and a link to the node that follows it.
//:
//: Note that the generic parameters of the class are included in a pair of angle brackets that follow the function name. In this case, we want them to conform to `Printable`, since we will define a custom `description` function that formats the list elements as a comma-separated string.

class List<T: Printable> {
    var value: T
    var next: List<T>?

    init(val: T) {
        value = val
    }

    func append(newValue: T) -> List<T> {
        var tail: List<T>? = self
        while (tail?.next != nil) {
            tail = tail?.next
        }

        let newNode = List(val: newValue)
        tail!.next = newNode
        return newNode
    }
}

//: Now let's build a list of `Ints`:

let head = List(val: 1)
head.append(2)
head.append(3)

//: Notice how we don't need to tell Swift which type we want to be contained in the list nodes; it's _inferred_ from the fact that we provide an `Int` (1) to the initializer. This collection is thereafter constrained to only contain `Int`s, and attempting to add a `String` is a compile-time error:

//head.append("Hi") // "Cannot invoke 'append' with argument list of type '(String)'"

//: We can also use the `description` function (defined at the end of this Playground) implicitly by printing the list with `println`:

println("\(head)")

//: ### Recap
//: 
//: In this playground, you've gotten a taste of what generics are and how to create your own generic functions and classes. Generics are one of the most powerful features of Swift, and we've just scratched the surface here. In your own apps, you will probably start out using only the generic types provided by the Swift library, but as you go forward, you will find occasions to generalize your code by parameterizing it on the types that it operates on, and that's what generics in Swift are all about!

//: ----

/// This extension provides a custom description implementation that
/// produces a comma-separated list of its values
extension List : Printable {
    var description: String {
        get {
            var desc = String()
            var current:List<T>? = self
            while (current != nil) {
                if !desc.isEmpty {
                    desc += ", "
                }
                desc += current!.value.description
                current = current!.next
            }
            return desc
        }
    }
}
