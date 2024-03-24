//
//  Task8.swift
//  Multythreading
//
//  Created by Dmitry Pavlov on 24.03.24.
//

import UIKit

class Task8: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        Task {
            await printMessage()
        }
    }
    
    func printMessage() async {
        let string = await withTaskGroup(of: String.self) { group -> String in
            group.addTask {
                "Hello"
            }
            group.addTask {
                "My"
            }
            group.addTask {
                "Road"
            }
            group.addTask {
                "Map"
            }
            group.addTask {
                "Group"
            }
            
            var array: [String] = []
            
            for await i in group {
                array.append(i)
            }
            
            return array.joined(separator: " ")
        }
        print(string)
    }
}
