//
//  TryCompactMapViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 26.06.2022.
//

import Foundation
import Combine

// .tryCompactMap - operator like .compactMap but with option to throw an error

struct TryCompactError: Error, Identifiable {
    let id = UUID()
    let message = "Got invalid data"
}

class TryCompactMapViewModel: ObservableObject {
    @Published var dataForView: [String] = []
    @Published var tryCompactError: TryCompactError?
    
    func fetch() {
        let inputData = ["Value 1", nil, "Value 2", "Value 3", nil, nil, "Error"]
        
        _ = inputData.publisher
            .tryCompactMap { item in
                if item == "Error" {
                    throw TryCompactError()
                }
               return item
            }
            .sink(receiveCompletion: { [unowned self] completion in
                if case .failure(let error) = completion {
                    self.tryCompactError = error as? TryCompactError
                }
            }, receiveValue: { [unowned self] item in
                dataForView.append(item)
            })
    }
}
