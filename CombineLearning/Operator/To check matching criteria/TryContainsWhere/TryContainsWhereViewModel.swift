//
//  TryContainsWhereViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 19.06.2022.
//

import Foundation
import Combine

// .tryContains(where: ) - operator that have an option publish true for your items with criteria you specify or publish an error.
// This suscriber ultimately receive a true, false or error and finish.

struct SelectionError: Error, Identifiable { // Custom Error that we can throw. We use Identifiable to support an alert
    var id = UUID()
}


class TryContainsWhereViewModel: ObservableObject {
    @Published var city = "Kyiv"
    @Published var result = ""
    @Published var selectionError: SelectionError?
    
    func search() {
        let inputData = ["Place with strong people", "Kyiv", "Lviv", "Odesa"]
        
        _ = inputData.publisher
            .dropFirst()
            .tryContains(where: { [unowned self] item -> Bool in
                if city == "Huilostan" { // If Huilostan when error will be thrown. Condition can be anything we want.
                    throw SelectionError()
                }
                return item == city
            })
            .sink(receiveCompletion: { [unowned self] completion in
                switch completion {
                case .failure(let error): self.selectionError = error as? SelectionError
                default: break
                }
            }, receiveValue: { [unowned self] result in
                self.result = result ? "Found" : "Not found"
            })
    }
}
