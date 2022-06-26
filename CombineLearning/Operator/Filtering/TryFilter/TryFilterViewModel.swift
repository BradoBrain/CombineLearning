//
//  TryFilterViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 26.06.2022.
//

import Foundation
import Combine

// .tryFilter - operator works like .filter with option to throw an error

struct TryFilterError: Identifiable, Error {
    let id = UUID()
    let errorDescription = "Got an error"
}

class TryFilterViewModel: ObservableObject {
    @Published var filteredForView: [String] = []
    @Published var filterError: TryFilterError?
    
    let inputData = ["name: Artem", "name: Oksana", "city: Kyiv", "city: Odesa", "Error"]
    
    var cancellable: AnyCancellable?
    
    init() {
        filteredData(criteria: " ")
    }
    
    func filteredData(criteria: String) {
        filteredForView = []
        
        cancellable = inputData.publisher
            .tryFilter { value -> Bool in
                if value == "Error" {
                    throw TryFilterError()
                }
                return value.contains(criteria)
            }
            .sink(receiveCompletion: { [unowned self] completion in
                if case .failure(let error) = completion {
                    filterError = error as? TryFilterError
                }
            }, receiveValue: { [unowned self] item in
                filteredForView.append(item)
            })
    }
}
