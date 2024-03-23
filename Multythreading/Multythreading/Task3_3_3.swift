//
//  Task3_3_3.swift
//  Multythreading
//
//  Created by Dmitry Pavlov on 22.03.24.
//

import UIKit
class Task3_3_3: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var people1 = People1()
        var people2 = People2()
        
        let thread1 = Thread {
            people1.walkPast(with: people2)
        }
        
        thread1.start()
        
        let thread2 = Thread {
            people2.walkPast(with: people1)
        }
        
        thread2.start()
    }
}


class People1 {
    var isDifferentDirections = false;
    
    func walkPast(with people: People2) {
        while (!people.isDifferentDirections) {
            print("People1 не может обойти People2")
            sleep(1)
        }
        
        print("People1 смог пройти прямо")
        isDifferentDirections = true
    }
}

class People2 {
    var isDifferentDirections = true;
    
    func walkPast(with people: People1) {
        while (!people.isDifferentDirections) {
            print("People2 не может обойти People1")
            sleep(1)
        }
        
        print("People2 смог пройти прямо")
        isDifferentDirections = true
    }
}

// это проблема лайв лок
