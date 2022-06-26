//
//  TryMapViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 26.06.2022.
//

import Foundation
import Combine

struct TryMapError: Identifiable, Error {
    let id = UUID()
    let description = "Got an error"
}

class TryMapViewModel: ObservableObject {
    @Published var dataForView: [String] = []
    @Published var tryMapError: TryMapError?
    
    func fetch() {
        let inputData = [
            "+380_066_000_00_00",
            "+380_063_000_00_00",
            "380_050_000_00_00"
        ]
        
        _ = inputData.publisher
            .tryMap { item -> String in
                if item.first != ("+") {
                    throw TryMapError()
                }
                return item
            }
            .sink(receiveCompletion: { [unowned self] completion in
                if case .failure(let error) = completion {
                    tryMapError = error as? TryMapError
                }
            }, receiveValue: { [unowned self] item in
                dataForView.append(item)
            })
    }
}
