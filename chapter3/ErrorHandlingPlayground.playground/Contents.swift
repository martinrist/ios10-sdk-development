import UIKit

if let myURL = URL(string: "http://apple.com") {
    
    // Code that can throw exceptions needs to be wrapped in a `do .. catch` block
    do {
        // This `Data` initialiser can throw, so needs to be marked with `try`
        let myData = try Data(contentsOf: myURL, options: [])
        if let myString = String(data: myData, encoding: .utf8) {
            print (myString)
        }
    // `let .. as` binds the the thrown type to a variable that's in scope for the exception handler block
    } catch let nserror as NSError {
        print ("NSError: \(nserror)")
    } catch {
        print ("No idea what happened here \(error)")
    }
}
