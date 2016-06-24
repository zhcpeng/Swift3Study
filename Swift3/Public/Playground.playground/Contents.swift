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

//list.enumerate()

let i = arc4random_uniform(100)

//fallthrough

enum Year : Int{
    case Spring = 1
    
}

let aa = Year.Spring

//let sss = aa.RawValue()
let ss = aa.rawValue





let sys = NSOperatingSystemVersion.init(majorVersion: 8, minorVersion: 4, patchVersion: 0)
let x = NSProcessInfo().isOperatingSystemAtLeastVersion(sys)


let s = NSProcessInfo()
s.hostName
s.physicalMemory





