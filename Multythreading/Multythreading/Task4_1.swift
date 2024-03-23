//
//  Task4_1.swift
//  Multythreading
//
//  Created by Dmitry Pavlov on 23.03.24.
//

import UIKit

class Task4_1: UIViewController {

    final class Post: Sendable {
            
    }

    enum State1: Sendable {
         case loading
         case data(String)
    }
        
    enum State2: Sendable {
         case loading
         case data(Post) // Out: Associated value 'data' of 'Sendable'-conforming enum 'State2' has non-sendable type 'ViewController.Post'
    }
    
    // Ошибка потому что кастомный тип не соответствует Sendable,
    // что и требует он. А в другом случае применены базовые типы которые конфермят ему уже
}
