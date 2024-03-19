//
//  ViewController.swift
//  Multythreading
//
//  Created by Dmitry Pavlov on 18.03.24.
//

import UIKit

class ViewController: UIViewController {
    
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

