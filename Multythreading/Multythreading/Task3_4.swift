//
//  Task3_4.swift
//  Multythreading
//
//  Created by Dmitry Pavlov on 22.03.24.
//

import UIKit

class Task3_4: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let service = AdditionService()
        
        for i in 0..<10 {
            service.addItem(i)
        }
        service.cancelAdd()
    }
}

class AdditionService {
    private var array: [Int] = []
    private var pendingWorkItems: [DispatchWorkItem] = []
    
    func addItem(_ item: Int) {
        let newWorkItem = DispatchWorkItem {
            self.array.append(item)
            
            print("Элемент был доавлен в массив \(item)")
        }
        
        pendingWorkItems.append(newWorkItem)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.pendingWorkItems.last?.perform()
            self.pendingWorkItems.removeLast()
        }
    }
    
    func cancelAdd() {
        guard let lastItem = pendingWorkItems.last else {
            print("Нет операций для отмены")
            return
        }
        lastItem.cancel()
    }
}
