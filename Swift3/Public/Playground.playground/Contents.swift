//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let a = 3
let b = "\(a) + \(Double(a) * 0.5)"
print(b)

print(a)

let c = "\u{E9}"

let list = [Int](count:5, repeatedValue: 10)

let d = list.isEmpty

list.enumerate()