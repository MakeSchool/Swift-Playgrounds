import UIKit

/*:
Protocols define a set of methods and properties. They do not implement anything, but they set rules that any class/structure that conforms to this protocol has to follow. Of course, everything is easier to understand with an exmaple, so let's begin!
*/

/*:
First, here is the syntax for defining a protocol:

Notice how the variables are defined. They are followed by either { get set } or { get }. This is required to tell the class/structure, which conforms to this protocol, make sure the given property allows for those functionalities. In the protocol below, str has to be settable and gettable. However, num has to be at least gettable, which means num can be just gettable or gettable and settable. Try removing the { get set } on str and see what error you get.

Other than the properties, SomeProtocol also forces the conforming class/structure to implement a function called someFunction.
*/

protocol SomeProtocol {
    var str: String { get set }
    var num: Int { get }
    
    func someFunction()
}

/*:
Here's another protocol:
*/
protocol AnotherProtocol {
    func anotherFunction(num: Int) -> Double
}

/*:
This is how a class/structure can conform to a protocol:

Notice that a class/structure can conform to more than one protocol. You can name all the protocols after the colon, separated by a comma.

Notice that once a class declares that it conforms to a certain protocol, it has to follow all the rules that the protocol imposes. Try commenting out the code within the class and see what error you get.
*/
class SomeClass: SomeProtocol, AnotherProtocol {
    var str: String = ""
    var num: Int = 10
    
    func someFunction() {
        
    }
    
    func anotherFunction(num: Int) -> Double {
        return 10.0 * Double(num)
    }
}

/*:
Let's define some more protocol and classes:
*/

protocol Playable {
    func play()
    func pause()
    func stop()
    func next()
}

struct CDPlayer: Playable {
    //some variables here ...
    
    func play() {
        //do something
    }
    
    func pause() {
        //do something
    }
    
    func stop() {
        //do something
    }
    
    func next() {
        //do something
    }
}

struct IPod: Playable {
    //some variables here ...
    
    func play() {
        //do something
    }
    
    func pause() {
        //do something
    }
    
    func stop() {
        //do something
    }
    
    func next() {
        //do something
    }
}

/*:
As you can see, both CDPlayer and IPod conform to Playable protocol. Both structs can play, pause, and go to next song.

Now, let's say Alex has 1 iPod and 2 CDPlayers. Alex wants to write a program where she keeps all her devices in an array, and when she wants, she can iterate through that array and make all of them stop playing. How would you help Alex write this program? CDPlayer and IPod are different structure types. There is no way to put those 2 structure types together. However, CDPlayer and IPod have something in common: they both are Playable! They both conform to the same protocol, so in some ways they are very similar. As a result, what Alex can do is make an array of not CDPlayers or IPods but an array of Playables. Let's take a look:
*/

let iPod = IPod()
let CDPlayer1 = CDPlayer()
let CDPlayer2 = CDPlayer()

let array: [Playable] = [iPod, CDPlayer1, CDPlayer2]

/*:
All Alex has to do now, is iterate through this array and perform stop on every item:
*/
for player in array {
    player.stop()
}














