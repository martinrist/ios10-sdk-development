import UIKit
import AVFoundation

// A simple class definition
// : shows implementation of a protocol
class IOSDevice : CustomStringConvertible {
    
    // This is the implementation of `CustomStringConvertible`
    var description: String {
        return "\(name), \(screenHeight) x \(screenWidth)"
    }
    
    // Properties with types
    // Note that these implicitly have getters *and* setters, due to the use of `var`
    var name : String
    var screenHeight : Double
    var screenWidth : Double
    
    // `private` prevents this property being visible
    // `?` makes this an `Optional`
    private var audioPlayer : AVPlayer?
    
    // This is a 'computed' property
    var screenArea : Double {
        return screenWidth * screenHeight
    }
    
    // This computed property returns a tuple of the dimensions
    var dimensions : (height : Double, width: Double) {
        return (screenHeight, screenWidth)
    }

    // We need an initialiser, as the properties are not Optional
    // and do not have default values
    init(name: String, screenHeight: Double, screenWidth: Double) {
        // `self` refers to the object being initialised
        self.name = name
        self.screenWidth = screenWidth
        self.screenHeight = screenHeight
    }
    
    // This is an instance method
    // `fromURL` is the 'outer name' of the argument, as used by callers, whereas `url` is the corresponding 'inner name', used by the method implementation
    func playAudioFrom(fromURL url: URL) -> Void {
        audioPlayer = AVPlayer(url: url)
        audioPlayer!.play()
    }
    
    func stopAudio() -> Void {
        if let audioPlayer = audioPlayer {
            audioPlayer.pause()
        }
        audioPlayer = nil
    }
}

// This is how we create objects of type `IOSDevice`
// Notice the use of argument labels to make it clear which argument is which
let iPhone7 = IOSDevice(name: "iPhone 7", screenHeight: 138.1, screenWidth: 67.0)


// This isn't allowed, because `iPhone7` was decalred with a `let`
//iPhone7 = IOSDevice(name: "iPhone Seven", screenHeight: 138.1, screenWidth: 67.0)

// However, this *is* allowed, becauase the `name` property was declared with a `var`
iPhone7.name = "iPhone Seven"

// We can retrieve the computed property and it will calculate its value according to the definition in the property's `get` block
iPhone7.screenArea

// URL provides a 'failable initializer', which can return `nil` if there's an error.  Hence the use of `if let`
if let url = URL(string: "http://www.example.com") {
    iPhone7.playAudioFrom(fromURL: url)
}

iPhone7.dimensions


// Tuples don't have to have names
let t1 = (1, 2)

// But naming can make it easier
let t2 = (part1: 1, part2: 2)
// and we can refer to the parts by name
t2.part1
t2.part2

// Destructuring of tuples works as expected
let (a, b) = t2
a
b

let iPhone7Plus = IOSDevice(name: "iPhone7Plus", screenHeight: 158.1, screenWidth: 77.8)

let iPhoneSE = IOSDevice(name: "iPhone SE", screenHeight: 123.8, screenWidth: 58.6)

let iPhones = [iPhoneSE, iPhone7, iPhone7Plus]

// enumerated() returns a tuple of `(index, value)` which can be destructured for enumeration
for (index, phone) in iPhones.enumerated() {
    print ("\(index): \(phone)")
}
