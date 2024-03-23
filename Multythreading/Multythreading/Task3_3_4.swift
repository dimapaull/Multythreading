//
//  Task3_3_4.swift
//  Multythreading
//
//  Created by Dmitry Pavlov on 22.03.24.
//

import UIKit

class Task3_3_4: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let workItem = DispatchWorkItem {
            self.thread1()
        }
        
        workItem.notify(queue: DispatchQueue.global()) {
            self.thread2()
        }
        
        DispatchQueue.global().async(execute: workItem)
    }
    
    let resourceASemaphore = DispatchSemaphore(value: 1)
    let resourceBSemaphore = DispatchSemaphore(value: 1)
    
    func thread1() {
        print("Поток 1 пытается захватить Ресурс A")
        resourceASemaphore.wait() // Захват Ресурса A
        
        print("Поток 1 захватил Ресурс A и пытается захватить Ресурс B")
        Thread.sleep(forTimeInterval: 1) // Имитация работы для демонстрации livelock
        
        resourceBSemaphore.wait() // Попытка захвата Ресурса B, который уже занят Потоком 2
        print("Поток 1 захватил Ресурс B")
        
        resourceBSemaphore.signal()
        resourceASemaphore.signal()
    }
    
    func thread2() {
        print("Поток 2 пытается захватить Ресурс B")
        resourceBSemaphore.wait() // Захват Ресурса B
        
        print("Поток 2 захватил Ресурс B и пытается захватить Ресурс A")
        Thread.sleep(forTimeInterval: 1) // Имитация работы для демонстрации livelock
        
        resourceASemaphore.wait() // Попытка захвата Ресурса A, который уже занят Потоком 1
        print("Поток 2 захватил Ресурс A")
        
        resourceASemaphore.signal()
        resourceBSemaphore.signal()
    }
}
