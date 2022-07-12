//
//  CatchViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 12.07.2022.
//

import Foundation
import Combine

// .catch - operator that give us to catch an error and then specify it by new publisher. The publisher into .catch must return the same type as the upstream publisher.

struct SmileError: Error, Identifiable {
    let id = UUID()
}

class CatchViewModel: ObservableObject {
    @Published var dataForView: [String] = []
    
    func fetch() {
        let inputData = ["Value 1", "Value 2", "Value 3", "📛"]
        
        _ = inputData.publisher
            .tryMap { item in
                if item == "📛" {
                    throw SmileError()
                } else {
                    return item
                }
            }
            .catch { error in
                Just("We send another value by Just publisher into .catch heandler block") // we will not receive the values that go after error
            }
            .sink { self.dataForView.append($0) }
    }
}
