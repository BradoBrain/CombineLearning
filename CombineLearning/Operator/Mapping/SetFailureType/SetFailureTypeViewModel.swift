//
//  SetFailureTypeViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 27.06.2022.
//

import Foundation
import Combine

// .setFailureType - operator that do not throw an error but give us to set error type with AnuPublisher<Type, ERROR> to non-error pipeline.

struct SetFailureError: Identifiable, Error {
    let id = UUID()
    let description = "Got an error"
}

class SetFailureTypeViewModel: ObservableObject {
    @Published var dataForView: [String] = []
    @Published var setFailureError: SetFailureError?
    
    func getPipeline(west: Bool) -> AnyPublisher<String, Error> {
        if west {
            return ["Lviv", "Rivne", "Ternopil", "Error"].publisher
                .tryMap { item in
                    if item == "Error" {
                        throw SetFailureError()
                    }
                    return item
                }
                .eraseToAnyPublisher()
        } else {
            return ["Kharkiv", "Donetsk", "Luhansk", "Error"].publisher
                .map { item in
                    if item == "Error" {
                        return "City is not found"
                    }
                    return item
                }
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    }
    
    func fetch(west: Bool) {
        dataForView.removeAll()
        
        _ = getPipeline(west: west)
            .sink(receiveCompletion: { [unowned self] completion in
                if case .failure(let error) = completion {
                    setFailureError = error as? SetFailureError
                }
            }, receiveValue: { [unowned self] item in
                dataForView.append(item)
            })
    }
}
