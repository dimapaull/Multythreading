//
//  ViewController.swift
//  Multythreading
//
//  Created by Dmitry Pavlov on 18.03.24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Создаем и запускаем поток
        let infinityLoop = InfinityLoop()
        infinityLoop.start()
        print(infinityLoop.isFinished)
        // Подождем некоторое время, а затем отменяем выполнение потока
        sleep(5)
        // Отменяем тут
        infinityLoop.cancel()
        print(infinityLoop.isFinished)
        print(infinityLoop.isExecuting)
    }
}

class InfinityLoop: Thread {
    var counter = 0
    
    override func main() {
        while counter <= 5 && !isCancelled {
            counter += 1
            print(counter)
            InfinityLoop.sleep(forTimeInterval: 1)
        }
    }
    
    
    
}
