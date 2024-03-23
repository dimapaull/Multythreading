//
//  task3_1_2.swift
//  Multythreading
//
//  Created by Dmitry Pavlov on 22.03.24.
//

import UIKit

class Task3_1_2: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let globalQueue = DispatchQueue.global()
        let service = PhrasesService()
        
        globalQueue.async {
            for i in 0..<10 {
                Task {
                    await service.addPhrase("test \(i)")
                }
            }
        }
        
        Thread.sleep(forTimeInterval: 1)
        Task {
             let phrases = await service.phrases
            print(phrases)
        }
    }
}

actor PhrasesServiceActor {
    var phrases: [String] = []
    
    func addPhrase(_ phrase: String) async {
        phrases.append(phrase)
    }
}
