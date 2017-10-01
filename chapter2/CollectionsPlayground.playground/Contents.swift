//: Playground - noun: a place where people can play

import UIKit

//
// Arrays
//

// Array literals are denotes by square braces
var models = ["iPhone SE", "iPhone 6S", "iPhone 7"]

// They are generic - of type `Array<String>`
type(of: models)

// We can insert elements, but note that the collection is mutable, because of var
models.insert("iPhone 7 Plus", at: 0)
models

// If we'd declared with `let`, all the mutating methods would have caused an error
let fixedStrings = ["One", "Two", "Three"]
//fixedStrings.insert("foo", at: 1)

// There's a simpler way to declare the type of an array
var numbers : [Int] = [1, 2, 3, 4, 5]

// Index-based access just uses the familiar square-brace syntax
models[0]

// We can remove using removeAtIndex or removeLast
models.remove(at: 0)
models


//
// Sets
//

// To declare and initialise a set, either create it then use `insert`
var set = Set<String>()
set.insert("iPhone 7")
set

// or use Array literal syntax, but excplitily declare the type
var set2 : Set = [1, 2, 3]

// Note that inserting duplicates has no effect, as we can see from the return value
set2.insert(1)
set2

// Set operations can be used
var firstSet : Set = ["A", "B", "C"]
var secondSet : Set = ["C", "D", "E", "F"]

firstSet.intersection(secondSet)
firstSet.union(secondSet)
firstSet.symmetricDifference(secondSet)


//
// Dictionaries
//

// Dictionary literals are square-brace delimited, but each key / value
// pair is colon-separated

let sizeInMm = [
    "iPhone 7": 138.1,
    "iPhone 7 Plus": 158.1,
    "iPad Air 2" : 240.0,
    "iPad Pro": 305.7]
type(of: sizeInMm)

// value access is by sqaure-brace:
sizeInMm["iPhone 7"]

// `nil` is returned if the key is not found
sizeInMm["foo"]


















