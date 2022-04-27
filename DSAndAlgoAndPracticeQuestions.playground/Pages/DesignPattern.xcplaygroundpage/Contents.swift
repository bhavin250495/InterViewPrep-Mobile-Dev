//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

protocol Dialog {
    func creatButton() -> Button
    func render()
}
extension Dialog {
    func render() {creatButton()}
}
class iOSDialog: Dialog {
     func creatButton() -> Button {
        return iOSButton()
    }
}
class macDialog: Dialog {
     func creatButton() -> Button {
        return macButton()
    }
}

protocol Button {
    func render()
    func onClick()
}

class iOSButton:Button {
    func render() {
        
    }
    func onClick() {
        
    }
}

class macButton:Button {
    func render() {
      
    }
    func onClick() {
        
    }
}


var dialo = macDialog()
dialo.render()
