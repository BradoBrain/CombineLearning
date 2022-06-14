//
//  FutureViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 14.06.2022.
//

import Foundation
import Combine

// Future is publisher that publishes only one value and close pipeline (ONLY ONE TIME). It can be publish immedietely, delay or wait for a user response etc.
// Future declares like futurePublisher: Future<SomeType, Never> where SomeType is a type you want to pass down the pipeline and Never is non-error (we can create and get an error/faiure)

class FutureViewModel: ObservableObject {
    @Published var name = ""
    @Published var surname = ""
    
    var cancellable: AnyCancellable?
    
    func getName() {
        Future<String, Never> { promise in // There is no errors becouse of failure set as Never. We can just use .assign(to:)
            promise(Result.success("Brado"))
        }
        .assign(to: &$name)
    }
    
    func getSurname() {
       let futurePublisher = Future<String, Never> { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // It is just delay for example
                promise(.success("Brain")) // Resuly isn't needed. We can miss it
            }
        }
        cancellable = futurePublisher           // Pipeline is also non-error and we could use .assign(to:)
            .sink { [unowned self] info in      // It is just example how we can manage our pipeline when we have time to cancel() it
                self.surname = info
            }
    }
}
