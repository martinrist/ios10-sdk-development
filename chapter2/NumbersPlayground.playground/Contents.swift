//: Playground - noun: a place where people can play

import UIKit

// let is constant, so we can't mutate it
let foo = 1
//foo += 1

// var creates a variable which can be changed
var bar = 1
bar += 1

// Type inference when `bar` was declared makes it an `Int`
// so we can't assign a `Double` literal to it
type(of: bar)
//bar = 0.5

// To get round this, we can declare the type explicitly at declaration time
var baz : Double = 0
baz = 0.5

// Swift doesn't have casting, so you can't do this
let myInt = 1
//let myDouble : Double = myInt

// Instead you have to create a new Double using the initialiser
// note the lack of the `new` operator
let myDouble = Double(myInt)
