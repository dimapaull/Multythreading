//
//  Task4_3.swift
//  Multythreading
//
//  Created by Dmitry Pavlov on 23.03.24.
//

import UIKit

class Task4_3: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rmOperationQueue = RMOperationQueue()
        
        let rmOperation1 = RMOperation(priority: .background, isFinished: false)
        rmOperation1.completionBlock = {
            print(1)
        }
        
        let rmOperation2 = RMOperation(priority: .userInteractive, isFinished: false)
        rmOperation2.completionBlock = {
            print(2)
        }
        
        rmOperationQueue.addOperation(rmOperation1)
        rmOperationQueue.addOperation(rmOperation2)
    }
}

protocol RMOperationQueueProtocol {
    /// Тут храним пул наших операций
    var operations: [RMOperation] { get }
    /// Добавляем наши кастомные операции в пул operations
    func addOperation(_ operation: RMOperation)
    /// Запускаем следующую
    func executeNextOperation()
}

// Класс, управляющий очередью операций
final class RMOperationQueue: RMOperationQueueProtocol {
    var operations: [RMOperation] = []

    func addOperation(_ operation: RMOperation) {
        operations.append(operation)
        executeNextOperation()
    }

    func executeNextOperation() {
        if let nextOperation = operations.first(where: { !$0.isExecuting && !$0.isFinished }) {
            /// Тут делаем старт операции
            nextOperation.start()
            /// Тут рекурсивно запускаем следующую операцию (что такое рекурсия?)
            executeNextOperation()
        }
    }
    
}
