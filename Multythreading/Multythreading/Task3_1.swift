//
//  Task3_1.swift
//  Multythreading
//
//  Created by Dmitry Pavlov on 20.03.24.
//

import UIKit

class Task3_1: UIViewController {
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let glogalQueue = DispatchQueue.global()
        var service = PhrasesService()
        let semaphore = DispatchSemaphore(value: 1)

        
        glogalQueue.async {
            semaphore.wait()
            for i in 0..<10 {
                service.addPhrase("test \(i)")
            }
            semaphore.signal()
        }
       
        Thread.sleep(forTimeInterval: 1)
        
        semaphore.wait()
        print(service.phrases)
        semaphore.signal()
       
    }
}

class PhrasesService {
    var phrases: [String] = []
    
    func addPhrase(_ phrase: String) {
        phrases.append(phrase)
    }
}
