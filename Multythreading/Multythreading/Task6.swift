//
//  Task5.swift
//  Multythreading
//
//  Created by Dmitry Pavlov on 24.03.24.
//

import UIKit

class Task6: UIViewController {
    
    var networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task.init {
            do {
                let messages = try await fetchMessagesResultCurrent()
                print(messages)
            }
            catch {
                print("messages is empty")
            }
        }
    }
    
    func fetchMessagesResult(completion: @escaping ([Message]) -> Void) {
        networkService.fetchMessages { message in
            completion(message)
        }
    }
    
    func fetchMessagesResultCurrent() async throws -> [Message] {
        try await withUnsafeThrowingContinuation { continuation in
            fetchMessagesResult() { messages in
                continuation.resume(returning: messages)
            }
        }
    }
}
