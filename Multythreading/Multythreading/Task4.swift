//
//  Task4.swift
//  Multythreading
//
//  Created by Dmitry Pavlov on 24.03.24.
//

import UIKit

class Task4: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        Task.init{
            let res = await random6()
            print(res)
            print(1111)
        }
        print("main")
    }
    
    func random6() async -> Int {
        Int.random(in: 1...6)
    }
}
