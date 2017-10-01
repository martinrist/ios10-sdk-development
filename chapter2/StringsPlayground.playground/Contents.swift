import UIKit

var str = "Hello, playground"

// String concatentation just uses the `+` operator
str = str + "!!"

// Strings are Unicode, so can contain Emoji
str += "🤘"

// In fact, Unicode support extends to identifiers
var 🐼 = "panda"
🐼 += "!!"

// String interpolation uses \()
let book = "📘"
let phone = "📱"
let sentence = "This is a \(book) about \(phone) apps."

// To specify Unicode characters, use \u{xxx}
// we can use combining accents, resulting in a single character
let accentedE = "e\u{301}"
accentedE.characters.count

// Strings have a `characters` property that let us treat the string contents as an array
sentence.characters.count

// We can find the index of a Character in a String using `indexOf`
// but note the presence of the `Optional`
let bookChar : Character = "📘"
"book is at index \(sentence.characters.index(of: bookChar)) in sentence"
