//
//  Task3.swift
//  Multythreading
//
//  Created by Dmitry Pavlov on 24.03.24.
//

import UIKit

class Task3: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Task 1 finish")
        Task.detached(priority: .userInitiated){
            for i in 0...50 {
                print(i)
            }
            print("Task 2 finish")
            print(Thread.current)
        }
       
        print("Task 3 finish")
    }
    
    // Task.detached - это выполнение кода на отдельной очереди как Thread{}
}
