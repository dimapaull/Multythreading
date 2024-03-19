import Foundation

let queue1 = DispatchQueue(label: "com. example queue1")
let queue2 = DispatchQueue(label: "com. example. queue2")

queue1.async {
    print("Task 1a")
    
    queue2.sync {
        print("Task 1b")
        print("Task 1d")
        print("Task 1e")
        print("Task 1f")
        print("Task 1g")
        print("Task 1h")
        print("Task 1i")
    }
    
    print("Task 1c")
}

