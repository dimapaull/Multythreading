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
        Thread.detachNewThread {
            for _ in (0..<10) {
                let currentThread = Thread.current
                print("1, Current thread: \(currentThread)")
            }
        }
        
        
        for _ in (0..<10) {
            let currentThread = Thread.current
            print("2, Current thread: \(currentThread)")
        }
    }
    
    /// Только первый цикл перевести в другой поток с помощью Thread.detachNewThread и обяснить почему изменился вывод.
    /* Цикл теперь выполняется не один за другим, а в разнобой.
     Это явный признак того, что задачи выполняются одновременно.
     После выполнения блока кода поток будет закрыт.
     Это объясняется тем, что у нас Thread.detachNewThread
     Это выполение блока замыкания на другом потоке.
     Минус этого подхода в том, что управлять этим новым потоком вы не сможете.*/
}

