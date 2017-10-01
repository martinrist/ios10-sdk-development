import UIKit

// Enumerations can have multiple cases
enum ScreenType {
    case none
    // some cases can have extra 'associated values'
    case retina (screenHeight: Double, screenWidth: Double)
}

// We can use this enumerated type as a normal type in struct defs
struct IOSDevice {
    var name : String
    var screenType : ScreenType
}


let iPhone7 = IOSDevice(name: "iPhone 7", screenType: ScreenType.retina(screenHeight: 138.1, screenWidth: 67.0))

let appleTV4thGen = IOSDevice(name: "Apple Tv (4th Gen)", screenType: ScreenType.none)

extension IOSDevice : CustomStringConvertible {
    var description : String {
        var screenDescription : String
        
        // When working with enumerated types and associated values we need to switch on the type
        switch screenType {
        case .none:
            screenDescription = "No screen"
        
        // Here, `let` binds the associated values
        case .retina(let screenHeight, let screenWidth):
            screenDescription = "Retina screen \(screenHeight) x \(screenWidth)"
        }
        return "\(name): \(screenDescription)"
    }
}
