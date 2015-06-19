import UIKit

/*:
Coming from other languages, you are probably familiar with enums. Let's look at how they can be used in Swift:
*/

/*:
Here is the syntax for enumerations:
*/
enum Directions {
    case North
    case South
    case East
    case West
}

/*:
Enumerations can be used as normal variables:
*/
var direction = Directions.East

/*:
After the initialization, direction's type is Directions. For that reason, whenever you change its value again, you can use a shorter dot syntax:
*/
direction = .South

/*:
You can use enums in switch-case like this:

Notice that we did not add a default case. That is because we have covered all the possible values direction can take (i.e. North, South, East, West)
*/
switch direction {
case .North:
    println("North")
case .South:
    println("South")
case .East:
    println("East")
case .West:
    println("West")
}

/*:
Unlike some languages, Swift lets you store associated values of any type along with the enum value. Look at the enum below. Let's say you are getting an array of strings from a server. However, sometimes server requests fail. For that reason, you can represent a server response as an enum, where if the server request succeeds, you use the Data case with the array that server sent as an associated value with that case. On the other hand, if an error occurs, you can represent the error message as a string, associated with the Error case.
*/

enum ServerResponse {
    case Data([String])
    case Error(String)
}

var successResponse = ServerResponse.Data(["one", "two", "three"])
var failResponse = ServerResponse.Error("Failed to connect to the server!")

/*:
You can continue to use switch-case with enums and access their associated value:
*/
switch successResponse {
case .Data(let arr):
    println(arr)
case .Error(let errorMessage):
    println(errorMessage)
}

/*:
In comparison to associated values, enums can have raw values that are associated with a case. In order to use raw values, you have to tell the enum what type the cases can hold as raw value. For example, in the example below, we wrote ": Int" after the enum name to declare that any case in this enum will hold a raw value of type Int.
*/

enum Binary: Int {
    case Zero = 0
    case One = 1
}

/*:
You can access raw value of an enum case using ".rawValue"
*/
var zero = Binary.Zero
var rawVal = zero.rawValue











