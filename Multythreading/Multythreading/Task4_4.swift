//
//  Task4_4.swift
//  Multythreading
//
//  Created by Dmitry Pavlov on 23.03.24.
//

import UIKit

class Task4_4: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let threadSafeArray = ThreadSafeArray()
        let operationQueue = OperationQueue()
        operationQueue.maxConcurrentOperationCount = 1
        
        let firstOperation = FirstSafeOperation(threadSafeArray: threadSafeArray)
        let secondOperation = SecondOperation(threadSafeArray: threadSafeArray)
        
        operationQueue.addOperation(firstOperation)
        operationQueue.addOperation(secondOperation)
        
        operationQueue.waitUntilAllOperationsAreFinished()
        
        print(threadSafeArray.getAll())
    }
    
    // Здесь была проблема гонки данных(data race), то есть в одно время кто-то менял, и в одно и тоже тоже кто-то это делал
}

class ThreadSafeArray {
    private var array: [String] = []
    let locker = NSLock()
    
    func append(_ value: String) {
        //locker.lock()
        array.append(value)
        //locker.unlock()
    }
    
    func getAll() -> [String] {
        return array
    }
}

class FirstSafeOperation: Operation {
    let threadSafeArray: ThreadSafeArray
    
    init(threadSafeArray: ThreadSafeArray) {
        self.threadSafeArray = threadSafeArray
    }
    
    override func main() {
        if isCancelled { return }
        threadSafeArray.append("Это первая оперция")
    }
}

class SecondOperation: Operation {
    let threadSafeArray: ThreadSafeArray
    
    init(threadSafeArray: ThreadSafeArray) {
        self.threadSafeArray = threadSafeArray
    }
    
    override func main() {
        if isCancelled { return }
        threadSafeArray.append("Это вторая оперция")
    }
}
