import UIKit
//: ## Closures
//: 
//: Closures are like functions with a twist. They can refer to variables in their containing scope, which makes them way more powerful than normal functions. In Swift, closures pop up everywhere, so it will help to play with some examples to get familiar with them.
//: ### A Simple Example
//: 
//: Let's look at a simple closure:

func addOne(value: Int) -> Int {
    return value + 1
}

addOne(1)

//: "Wait!" you say. "That's just a plain old function!" And you're right. A global function is a named closure. The trivial closure above takes a value and adds one to it, returning the result.
//: ### Capture
//:
//: What distinguishes closures from functions is that closures **capture** variables from their surrounding environment. This means that you can refer to local variables from within a closure, and even if they have later gone out of scope, the closure still has access to them. Value types get copied when they are captured, while reference types are strongly referenced, meaning the closure prevents them from being deallocated until the closure itself is deallocated.
//: ### Nested Functions
//:
//: Let's look at a more sophisticated example of closures, one that actually takes advantage of a closure's ability to refer to variables in its containing scope. **Nested functions** are another instance of closures in Swift:

func fibonacciSequence(length: Int) -> [Int] {
    let initialElements = [0, 1]

    func sequence() -> [Int] {
        var elements = initialElements
        for (var i = elements.count; i < length; ++i) {
            elements.append(elements[i - 2] + elements[i - 1])
        }
        return elements
    }

    // This calls the closure, which has captured the initial sequence elements 
    // and will complete the sequence to the desired length
    return sequence()
}

//: The nested function (`sequence`) builds up a sequence by adding the last two elements in the sequence together and appending this new value to the elements array. The important thing to note here is that the nested function _captures_ both the local variable `initialElements` and the `length` parameter. The values of these two captured variables determine the values that wind up in the array returned by `sequence`, even though they aren't expressly passed as parameters to the closure.
//: Calling the `fibonacciSequence` outer function with the desired length of the sequence returns an array containing that many Fibonacci numbers:

fibonacciSequence(12)


//: Closure Expressions
//:
//: It's not necessary to name a closure if you return it or call it immediately. This allows us to write functions that return anonymous functions. Consider this function, which builds functions that extend a `String` by repeating its final character:

func extender(base: String) -> (Int) -> String {
    return { count in
        let lastCharacter = base[advance(base.endIndex, -1)]
        var extendedString = base
        for (var i = 1; i < count; ++i) {
            extendedString.append(lastCharacter)
        }
        return extendedString
    }
}

//: If those double arrows (`->`) are tripping you up, that's understandable. You may not have seen a function return a function before, and it's hard to read at first. Let's break it down a little further.
//: The function `extender` takes a `String` and returns a closure that captures that string and also takes an `Int` and returns a `String`. That's a mouthful, but it demonstrates the fact that closures in Swift can be created, passed around, and returned just like other types.
//: Let's make an extender that will add extra "y"s to the end of the string "Hey":
let heyExtender = extender("Hey")

//: Notice that the thing we get back is described as "(Function)". That's our closure. Let's call it with 5 as the total number of "y"s:

let extendedHey = heyExtender(5)

//: What's the advantage of returning a closure instead of just building the extended string directly in the `extender` function? Well, we can invoke the closure we get back multiple times with different parameters to build all the extended "hey"s we want:

heyExtender(8)
heyExtender(16)
heyExtender(32)

//: ### Trailing Closure Syntax
//: 
//: Many functions in the Swift standard library take closures as parameters. These closures may be used to help the function do its job, or they may be used as a callback to notify another object when the function has completed. Swift has special syntax for the rather common case that a closure is the final parameter in a function's parameter list. Let's take a look at an example.

let scores = [ 70, 93, 81, 55, 99, 77, 62 ]
sorted(scores, { (a, b) -> Bool in
    a < b // Sort ascending
})

//: The standard function `sorted` takes an array and returns a sorted array of the same type. It also takes a second parameter: a closure you can use to customize which object is ordered as the lesser of the pair of its parameters. Above, we wrote the closure in-line using closure expression syntax. But we can also move it outside the function call entirely, using **trailing closure syntax**:

sorted(scores) { (a, b) -> Bool in
    b < a // Sort descending this time
}

//: Note in the above case that the parentheses containing the parameter list are closed, and the opening brace for the closure comes afterward. This looks a little unusual at first, but you are likely to see this syntax often, so you will quickly grow accustomed to it.
//: ### Avoiding Retain Cycles
//:
//: So far, we've mostly been capturing value types in our closures. There is a pitfall to be aware of when capturing reference types: if an object has a reference to a closure, which in turn refers to the object itself (even just by accessing one of the object's properties), the object will never be released, leading to a memory leak. This type of circular reference is called a **strong reference cycle** (or "retain cycle").
//: The class below generates random numbers and keeps a running tally of the generated values. Inside the callback, notice that we have commented out the line `[unowned self] in`. The part in square brackets is called the **capture list**, and it tells the closure _not_ to hold onto a strong reference to `self`. With this line commented out, self will be strongly referenced by the closure, and the object itself will hold a strong reference to the closure, creating a strong reference cycle.

class RandomNumberAccumulator {

    typealias RandomNumberCallback = () -> ()

    var sum: UInt32
    var callback: RandomNumberCallback!

    init() {
        sum = 0
        self.callback = {
//            [unowned self] in // Omitting this causes self to be captured strongly by this block
            println("\(self.sum)")
        }
    }

    func generate() {
        self.sum += arc4random_uniform(100)
        callback()
    }
}

var rna = RandomNumberAccumulator()
rna.generate()
rna.generate()
rna.generate()
rna.generate()

//: Whenever a class holds a reference to a closure that refers back to the object, you should include a capture list that explicitly makes the reference to `self` an **unowned** reference. Otherwise, your app will leak memory.
//: ### Recap
//:
//: In this Playground, we've seen a few examples of closures, some trivial and some fairly advanced. You learned that closures have the special ability to "capture" variables from their surrounding scope, which allows them to operate on these values even after they leave their original scope. You learned that functions can have nested functions and that functions can return functions. Finally, you learned how to avoid strong reference cycles when an object needs to hold onto a reference to a closure that references the object.
