//
//  TryFirstWhereViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 02.07.2022.
//

import Foundation
import Combine

//.tryFirst(where: ) - the same operator like .first(where: ) with throw error options

struct NonFruitError: Error, Identifiable {
    let id = UUID()
    let message = "We found a non-fruit item"
}

class TryFirstWhereViewModel: ObservableObject {
    @Published var dataForView: [String] = ["Apple", "Orange", "Banana", "Onion", "Mango"]
    @Published var first = ""
    @Published var criteria = ""
    @Published var error: NonFruitError?
    
    var cancellable: Set<AnyCancellable> = []
    
    init() {
        $criteria
            .dropFirst()
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .sink { self.findingFirst(criteria: $0) }
            .store(in: &cancellable)
    }
    
    func findingFirst(criteria: String) {
        dataForView.publisher
            .tryFirst { fruit in
                if fruit.contains("Onion") {
                    throw NonFruitError()
                }
                return fruit.contains(criteria)
            }
            .replaceEmpty(with: "Nothing was found")
            .sink { [unowned self] completion in
                if case .failure(let err) = completion {
                    self.error = err as? NonFruitError
                }
            } receiveValue: { fruit in
                self.first = fruit
            }
            .store(in: &cancellable)
    }
}
