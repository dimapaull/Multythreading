//
//  Task2_4.swift
//  Multythreading
//
//  Created by Dmitry Pavlov on 20.03.24.
//

import UIKit

class Task2_4: UIViewController {
    
    
    // Выведется А С В Так как при запуске выполнятся сначала все задачи для этой очереди,
    // а потом уже другие очереди, которые накинуты на текущую
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("A")
        
        DispatchQueue.main.async {
            print("B")
        }
        
        print("C")
    }
    
}
