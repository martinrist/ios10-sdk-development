import UIKit

// Structs are lightweight containers for propertiew
// Less like OO programming, more like FP

struct IOSDevice {
    var name : String
    var screenHeight : Double
    var screenWidth : Double
    
    // Structs can have computed properties just like objects
    var screenArea : Double {
        return screenWidth * screenHeight
    }

    // No need for initialisers - one is generated that takes in all the non-Optional propeties
}

// It's possible to extend existing structs (and classes0 with new computed properties
extension IOSDevice {
    var dimensions : (height: Double, width: Double) {
        return (screenHeight, screenWidth)
    }
}

let iPhone7 = IOSDevice(name: "iPhone7", screenHeight: 138.1, screenWidth: 67.0)

iPhone7.screenArea
iPhone7.dimensions


// Note that we can provide an extension for any class, even one we haven't defined
extension Int {
    func addOne() -> Int {
        return self + 1
    }
}

41.addOne()

// Here, we extend the IOSDevice struct to conform to CustomStringConvertible

extension IOSDevice : CustomStringConvertible {
    var description: String {
        return "\(name), \(screenHeight) x \(screenWidth)"
    }
}

iPhone7
