//
//  Task1.swift
//  Multythreading
//
//  Created by Dmitry Pavlov on 24.03.24.
//

import UIKit

class Task1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(1)
        Task {
            print(2)
        }
        print(3)
        
        /* 1. 1 3 2 main Так распечаталось потому что мэин очередь это сериал(последовательная очередь.
         Она сначала выполняет свои задачи и собирает все другие асинхроны в спец мешок,
         который запускает только тогда, когда сама у себя все выполнит)*/
        
        /* Task 1 3 2 так потому что таск это тоже самое что и  DispatchQueue.main.async
         То есть обычная асинхронная задача на той очереди на которой вызывается */
    }
}
