//
//  DeferredFutureViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 15.06.2022.
//

import Foundation
import Combine

// Deferred is a publisher that give us not execute Future immediately

class DeferredFutureViewModel: ObservableObject {
    @Published var firstRun = ""
    @Published var secondRun = ""
    
    let futurePublisher = Deferred {
        Future<String, Never> { promise in
            promise(.success("Publisher has run"))
        }
    }
    
    func fetch() {
        futurePublisher
            .assign(to: &$firstRun)
    }
    
    func fetchAgain() {
        futurePublisher
            .assign(to: &$secondRun) // It can be run repeatedly & futurePublisher will be executed every time
    }
    
}
