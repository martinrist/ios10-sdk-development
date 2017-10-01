import UIKit

//
// for loops
//

// We can iterate through the values in a collection using `for .. in`
let models = ["iPhone 7", "iPhone 7 Plus", "iPad Air 2", "iPad mini", "iPad Pro"]
for model in models {
    // `print` prints to the debug window
    print ("model: \(model)")
}

// To use a loop index, use the range operator `..<`
for i in 0 ..< models.count {
    print ("model at index \(i): \(models[i])")
}

// Alternatively use `enumerated` to return a sequence of pairs that we can then destructure
for (i, model) in models.enumerated() {
    print ("(\(i), \(model))")
}


//
// Conditionals
//

let sizeInMm = [
    "iPhone 7": 138.1,
    "iPhone 7 Plus": 158.1,
    "iPad Air 2": 240.0,
    "iPad Pro": 305.7]

// Standard form of the if-then-else structure is as expected
let model = "iPhone 7"
if sizeInMm[model] != nil {
    // Ignore the ! on the end of sizeInMm[model] for now - it's to resolve the Optional
    print ("size of \(model) is \(sizeInMm[model]!)")
} else {
    print ("couldn't find \(model)")
}

// We need braces around the clauses, even if they're a single line, unlike Java / C
//if (1>2)
//    print ("1 > 2")

// There's also a `guard` statement that is like the opposite of `if`
// They're typically used to perform early returns to bail out
// which we can't do in Playgrounds


//
// switch
//

// switches must be exhaustive, so we may need a `default` branch
// matched cases do not fall through, so we don't need breaks
switch model {
case "iPhone 7 Plus":
    print ("It's a 7 Plus")
case "iPhone 8":
    print ("Just released")
default:
    print ("It's something else")
}

