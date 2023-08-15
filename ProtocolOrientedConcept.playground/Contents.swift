import Foundation
import UIKit

protocol Car {
    func applyBreak()
    func start()
    func stop()
    func hornSound()
}

class Rough: Car {
    func applyBreak() {
        print("applY break on Rough")
    }
    
    func start() {
        print("StartEngine for Rough")
    }
    
    func stop() {
        print("StopEngine for Rough")
    }
    
    func hornSound() {
        print("Honk honk")
    }
}

class Audi: Car {
    func applyBreak() {
        print("applY break On Audi")
    }
    
    func start() {
        print("StartEngine for Audi")
    }
    
    func stop() {
        print("StopEngine for Audi")
    }
    
    func hornSound() {
        print("peep peep")
    }
}

class Person {
    func driveCar(car: Car) {
        car.start()
    }
}

let objRough = Rough()
let objAudi = Audi()

let objPerson = Person()
objPerson.driveCar(car: objRough)
objPerson.driveCar(car: objAudi)
