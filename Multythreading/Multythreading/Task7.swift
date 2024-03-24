//
//  Task7.swift
//  Multythreading
//
//  Created by Dmitry Pavlov on 24.03.24.
//

import UIKit

class Task7: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Task {
            await getTemperature()
            print(Thread.current)
        }
    }

    func getTemperature() async {
        let fetchTask = Task { () -> Double in
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            let sum = readings.reduce(0, +)
            return sum/Double(readings.count)
        }
        
        do {
            //fetchTask.cancel()
            let result = try await fetchTask.result.get()
            
            print("Average temperature: \(result)")
        }
        catch {
            print("Ошибка скачивания данных")
        }
    }
}
