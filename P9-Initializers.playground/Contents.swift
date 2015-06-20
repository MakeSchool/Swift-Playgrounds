/*:
# Initializers
We have seen a couple of designated initializers in the Classes tutorial. In this tutorial, we will go more in depth and cover designated, convenience, required, and failable  initializers.
*/

/*:
## Designated Initializers
Let's start with designated initializers.
*/

class Human {
    // weight in pounds
    var pounds : Double
    
    init(pounds : Double) {
        self.pounds = pounds
    }
    
    // weight in kilo grams
    init(kgs : Double) {
        self.pounds = kgs * 2.2046
    }
}

let mike = Human(pounds: 150)
let john = Human(kgs: 60)

mike.pounds
john.pounds

/*:
Using the second initializer, we are able to make it easier for a person who is more familiar with kilograms to use the class.

What if we subclass `Human`? Can we still use the initializers?
*/

class SuperHuman: Human {
    // Some super human
}

let hero = SuperHuman(kgs: 100)
let superhero = SuperHuman(pounds: 250)

/*:
Even though we haven't written the initializers in `SuperHuman`, it inherited them from `Human`.

What if we want to subclass `Human` but want to add more parameters to the initializers?
*/

class AmazingHuman: Human {
    var name : String
    
    init(name: String, pounds: Double) {
        self.name = name
        super.init(pounds: pounds)
    }
    
    init(name: String, kgs: Double) {
        self.name = name
        super.init(kgs: kgs)
    }
}

/*:
Notice how we are assigning

    self.name = name

before calling

    super.init

That is because Swift will give you an error if you call `super.init` before assigning all the properties in the class that are not optional.

Try to switch

    self.name = name
    super.init(kgs: kgs)

to

    super.init(kgs: kgs)
    self.name = name

and see what Swift will tell you.

__Make sure you undo this last edit before continuing__.
*/

/*:
### Optionals With Initializers
Let's try using an optional with an initializer.
*/

class CoolHuman: Human {
    var talent : String
    var otherTalent : String?
    
    init(talent : String, otherTalent : String, pounds : Double) {
        // non-optionals must be set before calling super.init
        self.talent = talent
        
        super.init(pounds: pounds)
        
        // optionals can be set after calling super.init
        self.otherTalent = otherTalent
    }
}

let cool = CoolHuman(talent: "just cool", otherTalent: "more talent", pounds: 0)

/*:
We still had to assign `talent` before calling `super.init` since it's a non-optional. However, since `otherTalent` is an optional, we were able to assign it after calling `super.init`.
*/
/*:
## Convenience Initializers
When using multiple initializers, it would be nice to have a way to link them all together. To do that, we can use Convenience Initializers.
*/

class Room {
    var area = 0.0
    var info : String?
    
    // designated initializer
    init(area : Double) {
        self.area = area
        let areaAsString = area.description
        self.info = "I'm a nice room. My area is \(areaAsString)"
    }
    
    // convenience initializer
    convenience init(width : Double, height : Double) {
        self.init(area: width * height)
    }
    
    // convenience initializer
    convenience init(height : Double, base : Double) {
        self.init(area: (height * base) / 2 )
    }
}

/*:
Instead of repeating:

    self.area = area
    let areaAsString = area.description
    self.info = "I'm a nice room. My area is \(areaAsString)"

two more times, we used convenience initializers to make it easier to create new instances of `Room` without having to repeat the code that we have already written in our designated initializer.

__Note: A convenience initializer must call a designated initializer within the current class by using `self.init`. You can not call `super.init` within a convenience initializer.__
*/

/*:
## Required Initializers
Add the word `required` before an initializer if you want every subclass to implement it.
*/

class Fox {
    var age : Int
    
    required init(age : Int) {
        self.age = age
    }
}

class AmazingFox: Fox {
    // We would get an error if we didn't add this required initializer
    required init(age: Int) {
        super.init(age: age)
    }
}

/*:
Every subclass of `Fox` must implement

    required init(age : Int)
*/

/*:
## Failable Initializers
Failable initializers set requirements for the parameters passed into an initializer.
*/

class Cow {
    var age: Int?
    
    init?(age: Int) {
        if age < 0 {
            return nil
        }
        
        self.age = age
    }
}

let niceCow = Cow(age: 20)
let oddCow = Cow(age: -5)

niceCow
oddCow

/*:
Notice how `oddCow` is `nil` because the passed in age is less than zero.

Note that a Failable initializer returns an optional value; therefor, both `niceCow` and `oddCow` are optional values. You can check this by holding down the "option" key on your keyboard and clicking on `niceCow` or `oddCow` above.
*/

/*:
### Initializers For Structs
All the initializers covered in this tutorial apply to both classes and structs.
*/

/*:
For more details on what we covered in this tutorial, please visit [Apple's Initialization guide.](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Initialization.html)
*/
