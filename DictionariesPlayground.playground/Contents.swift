import UIKit

/*:
A Dictionary is collection data structure which stores multiple values, where each value has a unique key associated with it. Unlike arrays, dictionaries do not keep the values in any order. Dictionaries are helpful in a situation where you want to quickly look up a value based on its unique key.
*/

/*:
Let's jump right in and define a dictionary variable. As you can see, the type of a dictionary depends on the type of its key and the type of its value. The general dictionary type is defined as [<key type> : <value type>]. In the example below, the key is a String as well as the value. the key represents the name of the city, and the value represents the country the city is in.

Just like arrays, the type of the dictionary can be inferred, so "[String : String]" is not necessary.
*/
var cities: [String :  String] = ["New York City" : "USA", "Paris" : "France", "London" : "UK"]

/*:
To count the number of key-value items, you can use the count property just like arrays. "isEmpty" works as well.
*/
println("The dictionary contains \(cities.count) items.")

/*:
You can add a new key-value pair like this:
*/
cities["San Francisco"] = "USA"

/*:
You can also the change the value that a key is associated with in the same manner:
*/
cities["San Francisco"] = "United States of America"

/*:
When trying to retrieve a value for a key, there is a possibility that key-value pair does not exist, so you have to make sure you check for this case. As a result, it is best to use optional binding to retrieve a value from the dictionary:
*/
if let country = cities["London"] {
    println("London is in \(country).")
}
else {
    println("The dictionary does not contain London as a key.")
}

/*:
You can remove a key-value pair simply by setting the key's value to nil:
*/
cities["London"] = nil
println(cities) //does not contain "London" anymore

/*:
To empty the dictionary:
*/
cities = [:]

/*:
To define a new empty dictionary:
*/
var dictionary = [String : Int]()

/*:
Notice how the type of the values is Int. The value type can be any type you want. The key can also be any type you want, however, the key has to be a type that provides a value for its hashValue property. This is out of the scope of this tutorial, and there are rarely any situations that you will need a custom type to be the key type for a dictionary.
*/





