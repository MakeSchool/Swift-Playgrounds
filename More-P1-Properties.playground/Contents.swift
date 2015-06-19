import UIKit

/*:
Let's talk properties! Properties associate values with the class/structure they belong to. There are 2 types of properties: stored properties and computed properties. Stored properties store values for the instance of the class/structure. On the other hand, computed properties have no actual values, but their values are computed on the spot when they are accessed. We will discuss the 2 types of properties in more detail.
*/

/*:
Let's start with stored properties! A class/structure can have both variable or constant stored properties. Each stored property can have a default value, and if the property is a variable, its value can change in the future. Let's look at some examples:
*/
class SomeClass {
    let a: Int
    var b: String
    
    init(a: Int, b: String) {
        self.a = a
        self.b = b
    }
}

/*:
It is important to understand that properties cannot be left without a value unless they are optionals (where their default value is nil). Try uncommenting the init function and see what kind of error you get. The compiler gives an error because when an object of SomeClass is created, the values of a and b will not be be set to anything. For that reason, you need an initializer that will set their values or you have to give default values to the properties.
*/

/*:
Let's look at a code that uses this class:
*/
var item = SomeClass(a: 10, b: "Swift rocks!")

/*:
In order to access the properties of the object, you use dot notation:
*/
println(item.b)


/*:
Let's now take a look at computed properties. In the class below, num is a stored property becuse it actually stores an integer, but take a look at str property. It does not store any values. It only creates a string whenever it is accessed. Make sure you understand the syntax: for a computed property, you do not say "= 50" for example. You instead, open a block "{ }" and inside there, you add "get { }", and in that block you will return a value for the computed property.
*/
class SomeClass2 {
    var num: Int = 50
    var str: String {
        get {
           return "Swift rocks \(num) times!"
        }
    }
}

/*:
Notice, there are no custom initializers. That is becuase num has a default value, and computed properties do not need to be initialized. As a result, the class is already initialized and ready to go. There is no need to add an init function.
*/
var item2 = SomeClass2()

/*:
What is happening when you write "item2.str"? Since str is a computed property, the program calls its get block, and uses the returned value as the property's value.
*/
println(item2.str)

/*:
Notice how we change only the num property, but the value of str also changes based on that. That is because str's value is computed when it is accessed, based on the value of num.
*/
item2.num = 100
println(item2.str)

/*:
Now let's look at what more you can do with properties. It is possible to observe when a property's value changes, so as a class, you can act accordingly. As you can see below, there are 2 blocks you can add to each property, willSet and didSet. willSet is called just before the new value is stored and didSet is called right after the new value is set.

In willSet, self.num still contains the old value. In order to access the new value, you use newValue variable. In didSet, self.num contains the new value. In order to access the old value, you use oldValue variable.
*/
class SomeClass3 {
    var num: Int = 50 {
        willSet {
            if newValue > self.num {
                
            }
        }
        
        didSet {
            if self.num == oldValue {
                self.num * 2
            }
        }
    }
    
    var str: String {
        get {
            return "Swift rocks \(num) times!"
        }
    }
}

/*:
Notice that during initialization, the willSet/diSet blocks are not called.
*/
let item3 = SomeClass3()
item3.num = 60












