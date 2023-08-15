import Foundation
import Combine

func addTwoNumbers(a: Int, b: Int) -> Int {
    return a + b
}

let myPublisher = Just(addTwoNumbers(a: 2, b: 3))

let mySubscriber = Subscribers.Sink<Int, Never> { completion in
    print("completion: \(completion)")
} receiveValue: { value in
    print("value: \(value)")
}

let myAnotherSubscriber = Subscribers.Sink<Int, Never> { completion in
    print("completion myAnotherSubscriber: \(completion)")
} receiveValue: { value in
    print("myAnotherSubscriberValue : \(value)")
}



myPublisher
    .subscribe(mySubscriber)
myPublisher
    .subscribe(myAnotherSubscriber)

