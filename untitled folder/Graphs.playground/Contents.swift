import UIKit

//// Set the number
//let n = 32.0
//
//// Get the power n^2
//let pwr = pow(n,2)
//
//print(pwr)

@dynamicCallable
struct RandomNumberGenerator {
    func dynamicallyCall(withArguments args: [Int]) -> Double {
        let numberOfZeroes = Double(args[0])
        let maximum = pow(10, numberOfZeroes)
        return Double.random(in: 0...maximum)
    }
}

let random = RandomNumberGenerator()
let result = random(1)

let raw = #"You can create "raw"\"plain" strings in Swift 5."#
print(raw)
let track = "Nothing Else Matters"
print(#"My favorite tune\song is \#(track)."#)

let multiline = #"""
You can create """raw"""\"""plain""" strings
on multiple lines
in Swift 5.
"""#
print(multiline)

let hashtag = #"You can use the Swift "hashtag" #swift in Swift 5."#
print(hashtag)



let id = "ID10"
var digits = 0
//id.forEach { digits += Int(String($0)) != nil ? 1 : 0 }
//similar
id.forEach{ digits += $0.isNumber ? 1 : 0}
print("Id  \(digits) digits.")


