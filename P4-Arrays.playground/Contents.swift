import UIKit

/*:
# Arrays

Time to dive into arrays! In case you do not know what an array is, an array is an ordered list of items of the same type.
Let's look at some examples!
*/

let groceryList: [String] = ["eggs", "milk"]

/*:
This is how you declare and initalize an array. The array type is defined as [<type of items in array>], like above where the type of groceryList is defined as [String]. For that reason, groceryList is an array of Strings. There are languages where you can have an array of objects with different types, but in Swift, you have to specify the type of the objects that will be stored in the array, and all objects in the array have to be of that type.
*/

/*:
As you learned before in the section on type inference, Swift is smart enough to realize that your variable is an array and it's of type [String].
*/
let groceryListWithInferredType = ["eggs", "milk"]

/*:
To initialize an empty array:
*/
let emptyArray = [String]()

/*:
In many cases, it is important to find out the number of items in your array. You can find the number of items easily by looking at the array's `count` property.
*/
let numberOfItems = groceryList.count
println("the grocery list contains \(numberOfItems) items.")

//: Notice that, just like Java's .length property, this is not a property, not a method.

/*:
Sometimes you just want to know whether the array is empty or not:
*/
if groceryList.isEmpty {
    println("The grocery list is empty!")
} else {
    println("The grocery list is not empty!")
}

/*:
If you notice, the above variables are defined with the let keyword, which makes these arrays immutable (unchangeable). You cannot change these arrays at all in any way, so they stay as they are throughout the program.

Uncomment the line below to see what happens when you try to add an item to the immutable array.
*/
//groceryList.append("bread")

/*:
It says `Immutable value of type '[String]' only has mutating members named 'append'
As you can see, `.count` and `.isEmpty` work with immutable arrays without any problems. Let's now define a mutable array to see what features are available when working with mutable arrays:
*/
var mutableGroceryList = ["eggs", "milk"]

/*:
To add an item to the end of the array, you can use the append method:
*/
mutableGroceryList.append("yogurt")

/*:
If you want to add an item to somewhere in the middle of the array, you can specify the index at which you want to insert an item and all the items that follow the newly added item will shift.

Notice how after adding "chips", "yogurt" is shifted to the next index.
*/
mutableGroceryList.insert("chips", atIndex: 2)

/*:
To combine 2 mutable arrays together:
*/
mutableGroceryList += ["cheese", "ice cream"]

/*:
To retrieve values from the array, subscript syntax is used, where you pass in the index of the item you are trying to retrieve. Keep in mind that arrays are zero-indexed (i.e. first item's index is 0, second item's index is 1, etc.)
*/
var item = mutableGroceryList[0]

/*:
Challenge: try to retrieve last item in the array
*/

/*:
Of course, you have the ability to remove an item. This will return the removed item.
*/
let removedItem = mutableGroceryList.removeAtIndex(0)











