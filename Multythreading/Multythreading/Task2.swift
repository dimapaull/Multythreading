//
//  Task2.swift
//  Multythreading
//
//  Created by Dmitry Pavlov on 24.03.24.
//

import UIKit

class Task2: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(1)
        Task { @MainActor  in
            print(2)
        }
        print(3)
        
        // Это отличает от обычного таск тем, что кложура будет вызвана всегда на мэин очереди.
        // Но так как мы и так на мэин, то смысла оно в себе не несет
    }
}
