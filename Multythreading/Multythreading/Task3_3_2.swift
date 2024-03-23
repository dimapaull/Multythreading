//
//  Task3_3_2.swift
//  Multythreading
//
//  Created by Dmitry Pavlov on 22.03.24.
//

import UIKit

class Task3_3_2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var sharedResource = 0
        let lock = NSLock()
        lock.lock()
        DispatchQueue.global(qos: .background).async {
            for _ in 1...100 {
                sharedResource += 1
            }
            lock.unlock()
        }
        lock.lock()
        DispatchQueue.global(qos: .background).async {
            for _ in 1...100 {
                sharedResource += 1
            }
            lock.unlock()
        }
    }
    
    // data race оба меняют данные
}
