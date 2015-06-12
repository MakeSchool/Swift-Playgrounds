import UIKit

/*:
Time to dive into arrays! In case you do not know what an array is, an array is an ordered list of items of the same type.

Let's look at some examples!
*/


/*:
This is how you declare and initalize an array. The array type is defined as [<type of items in array>], just like below where the type of groceryList is defined as [String]. For that reason, groceryList is an array of Strings.
*/
let groceryList: [String] = ["eggs", "milk"]

/*:
As you learned before about type inference, Swift is smart enough to realize that you're variable is an array and of a specific item type.
*/
let groceryListWithInferredType = ["eggs", "milk"]

/*:
To initialize an empty array:
*/
let emptyArray = [String]()

/*:
In many cases, it is important to find out the number of items in your array. You can find the number of items easily by looking at the array's count property.
*/
let numberOfItems = groceryList.count
println("the grocery list contains \(numberOfItems) items.")

/*:
Sometimes you just want to know whether the array is empty or not:
*/
if groceryList.isEmpty {
    println("The grocery list is empty!")
} else {
    println("The grocery list is not empty!")
}

/*:
If you notice, the above variables are defined with the let keyword, which makes these arrays immutable (i.e. you cannot change them).

Uncomment the line below to see what happens when you try to add an item to the immutable array.
*/
//groceryList.append("bread")

/*:
As you can see, the above features work with immuatble arrays without any problems. Let's now define a mutable array to see what features are available when working with mutable arrays:
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
To combine 2 arrays together:
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











