/*:
# Classes and Structures
Classes and Structures will be the building blocks of your apps.
*/
/*:
## Classes

Classes are generally used for code that you might want to use multiple times. For example, let's say you need a way to keep track of vehicles in your app. You'd create a class named `Vehicle` with the following properties:
* The number of `wheels` that the vehicle has, with `4` as the default value.
* The vehicle's `color`, with `"black"` as the default value.
*/
class Vehicle  {
    var wheels = 4
    var color = "black"
}
/*:
Notice that unlike variable names, class names should start with an Uppercase letter.

Defining our `Vehicle` class allows us to specify the capabilities of every vehicle we have in our app. To create a new vehicle, let's create an instance of our `Vehicle` class.
*/
let myCar = Vehicle()

//: You can access the properties of `myCar` as follows;

myCar.wheels
myCar.color

//: Note: You can see the values of the properties on the right side of your screen.
//: Let's try changing `myCar`'s color:

myCar.color = "red"
myCar.color

/*:
### Subclasses
Let's say that in your app, there are multiple types of vehicles. For example, we might have cars, motorcycles and boats. To structure your app well, you'd define a subclass of `Vehicle` called `Car`. A subclass inherits all the properties of its parent class, meaning that `Car` will have a `color` and `wheels` from the moment it's born. To make our `Car` class even better, let's add a new property to it called `type`.
*/
/*:
Before we start coding, we should keep in mind that even though every `Car` must have a `type`, there is no logical default value for `type`. For example, the  `Car`'s `type` could be a sedan, coupe, van etc. To deal with this problem, we are going to add an initializer. An initializer allows you to pass in some parameters that might be necessary to create an instance of that class.
*/
class Car: Vehicle {
    // 1
    let type : String
    
    //2
    init(type: String) {
        // 3
        self.type = type
    }
}
/*:
There are a few things worth mentioning about the previous code:
1. Since each `Car` will always have one type that will never be changed, `type` is created as a constant using `let`.
2. Using `init`, we create an initializer that takes in a `String` called `type`.
3. To set `type` from #1 to the passed-in `type` from #2, we use `self.type`. `self` refers to the current instance of `Car`.
*/
let taxi = Car(type: "sedan")

taxi.type
taxi.color
taxi.wheels
/*:
Notice how even though we didn't define `color` and `wheels` within `Car`, they were inherited from `Vehicle`.

Since we definitly don't want our `taxi`'s `color` to be black, let's define a new class called `Taxi` that has `color` as yellow by default and "sedan" as the default type. Additionally, let's add the following to our `Taxi` class:
* A `fare` property.
* A method called `getInfo` that describes our `Taxi`

*/

class Taxi: Car {
    var fare : Int
    
    init(fare : Int) {
        self.fare = fare
        super.init(type: "sedan")
        self.color = "yellow"
    }
    
    func getInfo() -> String {
        return "I have \(wheels) wheels and I charge $\(fare) per mile."
    }
}

/*:
* Notice how we are calling `super.init`. `super` refers to the superclass, which in this case is `Car`. Using `super.init`, we are able to access the initializer that we created for `Car`.

* Since `fare` is not an optional, we have to set it in `init` before we call `super.init`. We will go more in details into optionals as properties in a tutorial made specifically to explain Properties.
*/

let coolTaxi = Taxi(fare: 30)

coolTaxi.fare
coolTaxi.color
coolTaxi.type
coolTaxi.wheels

coolTaxi.getInfo()

//: Let's try changing `fare` and `wheels`.

coolTaxi.fare = 5
coolTaxi.wheels = 6


coolTaxi.getInfo()

/*:
Notice that `getInfo()` returns the value of `fare` at the moment the function is called, so it returns the updated `fare`.
*/

let otherTaxi = Taxi(fare: 100)

otherTaxi.getInfo()

/*:
Even though `otherTaxi` and `coolTaxi` both belong to the class `Taxi`, their properties are stored differently. For example, changing `otherTaxi.color` does not change `coolTaxi.color`.
*/

otherTaxi.color = "red"

otherTaxi.color
coolTaxi.color

coolTaxi.color = "pink"

otherTaxi.color
coolTaxi.color


/*:
## Structures
We can use structures to group related information and properties. For example, let's define a struct (short for structure) that can hold the size of a car.
*/

struct Size {
    var width = 50
    var height = 100
}

/*:
To use our struct, let's define two new subclasses of `Car` called `HybridCar` and `ElectricCar.
*/

class HybridCar: Car {
    var size = Size()
}

class ElectricCar: Car {
    var size = Size()
}

let hybrid = HybridCar(type: "sedan")
let electric = ElectricCar(type: "sedan")

hybrid.size.height = 50
electric.size.height = 80

hybrid.size.height
electric.size.height

/*:
Notice how every instance of a struct saves its parameters separately. For example, changing `hybrid.size.height` doesn't change `electric.size.height`
*/
/*:
What if we want a stuct to hold some values that are not unique to an instance, but are universal to whereever we access that struct from?
*/

struct Regulations {
    static var speedLimit = 60
}

class Motorcycle: Vehicle {
    var speed = 0
    
    func withinSpeedLimit() -> Bool {
        return Regulations.speedLimit > speed
    }
}

class Boat: Vehicle {
    var speed = 0
    
    func withinSpeedLimit() -> Bool {
        return Regulations.speedLimit > speed
    }
}

let motorcycle = Motorcycle()
let boat = Boat()

motorcycle.speed = 70
boat.speed = 50

motorcycle.withinSpeedLimit()
boat.withinSpeedLimit()

//: Let's try changing `Regulations.speedLimit`

Regulations.speedLimit = 100

motorcycle.withinSpeedLimit()
boat.withinSpeedLimit()

/*:
Using the keyword `static` for the property enables us to access it from any place in our code without initializing `Regulations`.
*/
/*:
### Classes vs. Structs
There are major differences between classes and structs, but one very important one is the following:
* A class is passed as a reference.
* A struct is passed as a value.

Let's see what that means.
*/

// Classes

var coolBoat = Boat()
var someBoat = coolBoat

someBoat.speed

coolBoat.speed = 99

someBoat.speed

/*:
The reason `someBoat.speed` was changed when we changed `coolBoat.speed` is that `someBoat` and `coolBoat` are actually both pointing at the same object. The reason this is happening is because when we set `someBoat` to `coolBoat`, Swift is not copying the object itself to someBoat. Swift is copying a reference to the object and setting it to `someBoat`; therefor, both variables are poiting to the same object because they hold the same reference.
*/

// Structs

var coolSize = Size()
var someSize = coolSize

someSize.height

coolSize.height = 20

someSize.height

/*:
Notice how `someSize.height` wasn't changed when we changed `coolSize.height`. When it comes to structs, Swift copies the instance and passes it as a new value to the variable instead of just referencing to it.
*/

/*:
For more details on what we covered here, please visit [Apple's Classes and Structures guide.](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/ClassesAndStructures.html)
*/
