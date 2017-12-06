//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

class TimerViewController: UIViewController {

    var timer: Timer?
    
    override func viewDidLoad() {
    
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(printTest), userInfo:nil, repeats:true)
        
    }
    
    func printTest() {
        print("OK")
    }
    
}