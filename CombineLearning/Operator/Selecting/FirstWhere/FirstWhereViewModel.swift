//
//  FirestWhereViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 01.07.2022.
//

import Foundation
import Combine

// .first(where: ) - operator that publishes first item that satisfies condition in (where: )

class FirstWhereViewModel: ObservableObject {
    @Published var dataForView: [String] = ["Value 1", "Value 2", "Value 3", "Value 4", "Value 5"]
    @Published var first = ""
    @Published var criteria = ""
    
    var cancellable: AnyCancellable?
    
    init() {
        cancellable = $criteria
            .sink { self.findingFirst(criteria: $0) } // We need it to sign our search criteria field on changing. Every time when we change criteria it sends value through the pipeline
    }
    
    func findingFirst(criteria: String) {
        dataForView.publisher
            .first { $0.contains(criteria) }
            .replaceEmpty(with: "There is no found data") // It will replace data if there is no matches with criteria
            .assign(to: &$first)
    }
}
