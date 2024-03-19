// Выведется 1 7 я написал. На самом деле вывелось 1 2 6 7 3.
// Потосу что вью дид лоэд сработал из за инициализации
// viewDidLoad() Он вызвался так как вью контроллер был весь создан и готов поместиться в адрес
// в памяти(super.viewDidLoad)

import UIKit
// Сделал в печочнице, сюда перенес чтобы сдать
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print(2)
        DispatchQueue.main.async {
            print(3)
            DispatchQueue.main.async { // сделана асинхронная очередь, потому что нельзя на текущей вызывать синхронную
                print(5)
            }
            print(4)
        }
        print(6)
    }
}

let vc = ViewController()
print(1)
let view = vc.view
print(7)
