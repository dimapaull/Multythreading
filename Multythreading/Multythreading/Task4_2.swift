//
//  Task4_2.swift
//  Multythreading
//
//  Created by Dmitry Pavlov on 23.03.24.
//

import UIKit

protocol RMOperationProtocol {
    // Приоритеты
    var priority: DispatchQoS.QoSClass { get }
    // Выполняемый блок
    var completionBlock: (() -> Void)? { get }
    // Завершена ли операция
    var isFinished: Bool { get }
    // Метод для запуска операции
    func start()
    var isExecuting: Bool { get }
}

class RMOperation: RMOperationProtocol {
    var priority: DispatchQoS.QoSClass
    
    var completionBlock: (() -> Void)?
    
    var isFinished: Bool
    
    var isExecuting: Bool = false
    
    /// В методе start. реализуйте все через глобальную паралельную очередь с приоритетами.
    func start() {
        if !isFinished {
            isExecuting = true
            let global = DispatchQueue.global(qos: priority)
            global.async {
                print("Выполнение очереди")
                self.completionBlock?()
                print(Thread.current)
                self.isExecuting = false
                self.isFinished = true
            }
        }
    }
    
    init(priority: DispatchQoS.QoSClass, isFinished: Bool) {
        self.priority = priority
        self.isFinished = isFinished
    }
}

class Task4_2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let operationFirst = RMOperation(priority: .userInitiated, isFinished: false)
        let operationSecond = RMOperation(priority: .background, isFinished: false)
        
        operationFirst.priority = .userInitiated
        operationFirst.completionBlock = {
            for _ in 0..<50 {
                print(2)
            }
            print(Thread.current)
            print("Операция полностью завершена!")
        }
        
        operationFirst.start()
        
        operationSecond.priority = .background
        operationSecond.completionBlock = {
            for _ in 0..<50 {
                print(1)
            }
            print(Thread.current)
            print("Операция полностью завершена!")
        }
        operationSecond.start()
    }
}
