//
//  ViewController.swift
//  Multythreading
//
//  Created by Dmitry Pavlov on 18.03.24.
//

import UIKit

class ViewController: UIViewController {
    
    // Сдесь проблеблема состояния гонки  время или порядок событий влияют на корректность результата.
    
    private lazy var name = "I love RM"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateName()
    }
    
    func updateName() {
        DispatchQueue.global().sync { // из асинк сделан синк
            print(self.name)
            print(Thread.current)
        }
        
        print(self.name)
    }
}

