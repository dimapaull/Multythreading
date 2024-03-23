//
//  Task3_3_1.swift
//  Multythreading
//
//  Created by Dmitry Pavlov on 22.03.24.
//

import UIKit

class Task3_3_1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let serialQueue = DispatchQueue(label: "com.example.myQueue")

        serialQueue.async {
           serialQueue.async {
               print("This will never be printed.")
           }
        }
    }
    
    // это дед лок
}
