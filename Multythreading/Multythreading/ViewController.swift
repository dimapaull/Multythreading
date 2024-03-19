//
//  ViewController.swift
//  Multythreading
//
//  Created by Dmitry Pavlov on 18.03.24.
//

import UIKit

class ViewController: UIViewController {
    
    private let lockQueue = DispatchQueue(label: "name.lock.queue")
    
    private var name = "Введите имя"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        lockQueue.sync {
            self.name = "I love RM"
            print(Thread.current)
            print(self.name)
        }
        print(self.name)
        updateName()
    }
    
    func updateName() {
        DispatchQueue.global().async {
           
        }
        
        
    }
    
    /*
     async
     I love RM
     <_NSMainThread: 0x28338c100>{number = 1, name = main}
     I love RM
     В первый раз вывелось так потому что изменение проперти имя было выполнено на другой очереди асинхронно,
     то есть он поменял это имя очень быстро и при обращении уже везде использовано это изменение
     */
    
    /*
     sync
     <_NSMainThread: 0x28338c100>{number = 1, name = main}
     I love RM
     I love RM
     
     потому что задача стала синхронной и эта синхронная задача заблокировала нашу
     мэин очередь и принт из мэин очереди не отработал
     */
}

