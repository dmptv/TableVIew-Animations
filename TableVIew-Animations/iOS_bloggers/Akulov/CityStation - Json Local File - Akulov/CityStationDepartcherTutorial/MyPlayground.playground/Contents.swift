//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class MyClass {
    
    static let singlton = MyClass()
    
    static var s = "Static string"
    
    class func staticZen() -> String {
        return "Static Zen"
    }
    
    
    var v: String = "My string"
    
    func zen() -> String {
        return "Zen"
    }
}

MyClass.singlton.zen()

MyClass.s = "1"
MyClass.s

MyClass.staticZen()



var mc = MyClass()

mc.v = "My new string"
mc.zen()




































