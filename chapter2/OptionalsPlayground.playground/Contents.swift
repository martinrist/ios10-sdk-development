import UIKit

let sizeInMm = [
    "iPhone 7": 138.1,
    "iPhone 7 Plus": 158.1,
    "iPad Air 2" : 240.0,
    "iPad Pro": 305.7]

// Picking out the values actually returns an `Optional<Double>`
let size7 = sizeInMm["iPhone 7"]
type(of: size7)

// If the value isn't available, we get back `nil`
let size100 = sizeInMm["iPhone 100"]
type(of: size100)

// The 'force-unwrap' operator `!` will unwrap the value from the Optional
size7!
type(of: size7!)

// If we force-unwrap an Optional containing `nil` we get a runtime error!
// "fatal error: unexpectedly found nil while unwrapping an Optional value"
//size100!

// We *could* keep doing this, but lots of nested nil checks is ugly
if size100 == nil {
    print ("nil found")
}

// We can use `if let` to combine nil-checking and assignment
if let size = size7 {
    // `size` has block scope and can be the same name as the Optional it unwraps
    // Note that `size` is a normal `Double` here, not an `Optional<Double>`
    type(of: size)
    print (size)
}

if let size = size100 {
    // This won't run, because size100 == nil
    type(of: size)
    print (size)
}

// A common idiom is to combine an `if let` unwrapping with a conditional on the unwrapped value
if let size7 = size7, size7 > 100.0 {
    size7
}

