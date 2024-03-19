//
//  task2_2.swift
//  Multythreading
//
//  Created by Dmitry Pavlov on 20.03.24.
//

import UIKit

class task2_2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let demonThread = ThreadDemon()
        let angelThread = ThreadAngel()
        
        // 1
        // demonThread.qualityOfService = .userInitiated
        // angelThread.qualityOfService = .background
        
        // 2
        // demonThread.qualityOfService = .background
        // angelThread.qualityOfService = .userInitiated
        
        // 3
        demonThread.qualityOfService = .userInitiated
        angelThread.qualityOfService = .userInitiated
        
        demonThread.start()
        angelThread.start()
        
    }
    
}

class ThreadDemon: Thread {
    override func main() {
        for _ in 0..<100 {
            print("1")
        }
    }
}

class ThreadAngel: Thread {
    override func main() {
        for _ in 0..<100 {
            print("2")
        }
    }
}
