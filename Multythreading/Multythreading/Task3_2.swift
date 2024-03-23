//
//  Task3_2.swift
//  Multythreading
//
//  Created by Dmitry Pavlov on 22.03.24.
//

import UIKit

class Task3_2: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let asyncWorker = AsyncWorker()
        asyncWorker.doWork(postNumbers: 1,2,3,4,5) { posts in
            print(Thread.current)
            print(posts.map{ $0.id })
        }
    }
}

class AsyncWorker {
    func doWork(postNumbers: Int..., completion: @escaping ([Post])->()) {
        var posts: [Post] = []
        let dispatchGroup = DispatchGroup()
        DispatchQueue.main.async {
            for i in postNumbers {
                dispatchGroup.enter()
                
                URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/todos/\(i)")!) { data, responce, error in
                    guard let data = data  else {  return }
                    if let post = try? JSONDecoder().decode(Post.self, from: data) {
                        posts.append(post)
                    }
                    dispatchGroup.leave()
                }.resume()
                
            }
            dispatchGroup.notify(queue: .main) {
                completion(posts)
            }
        }
    }
}

struct Post: Codable {
    var id: Int
    var userId: Int
    var title: String
    var completed: Bool
}
