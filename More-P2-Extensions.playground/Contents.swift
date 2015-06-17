import UIKit

/*:
Extensions are a very powerful tools for extending a class or a structure. Extensions allow addition of new properties or methods without the need to actually subclass. In fact, it works even with structures, which cannot be subclassed.

When you write an extension for a class/structure, the user of that class/structure does not really see a difference in that class/structure, she only sees extra functionalities added. Let's use an example to explain this:
*/

/*:
String is a class provided by Swift to us. Let's extend it:
*/
extension String {
    var hashtag: String {
        get {
            return "#\(self)"
        }
    }
    
    func doubleString() -> String {
        return self + self
    }
}

/*:
Notice how in the code below, we simply created a variable of type String. However, str object has the "hashtag" property. This property is not part of String clss, but through the power of extensions, we were able to add the hashtag computed property to String class without actually modifying the String class or subclassing it. Isn't that cool?!
*/
let str = "Swift"
println(str.hashtag)
println(str.doubleString())

/*:
You can add computed properties, methods, new initializers, and so much more using extensions. There are some limitations though. For example, you cannot add stored properties!

Uncomment storeProperty below and see what kind of error you get.
*/
extension String {
    //var storedProperty = 90
}





