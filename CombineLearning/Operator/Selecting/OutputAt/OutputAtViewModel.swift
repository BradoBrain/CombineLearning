//
//  OutputAtViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 02.07.2022.
//

import Foundation
import Combine

// .output(at: ) - operator that can spesify an index and when an item at that index comes throgh pipeline will be republished and pipeline closed.
// If number of index higher then number of items than nothing is published.

class OutputAtViewModel: ObservableObject {
    @Published var dataForView = ["Artem", "Oksana", "Demid", "Busya"]
    @Published var selectedIndex = ""
    @Published var index = 0
    
    var cancellable: AnyCancellable?
    
    init() {
        cancellable = $index
            .sink { self.getName(at: $0) } // It will call getName function each time when we change the index
    }
    
    func getName(at index: Int) {
        dataForView.publisher
            .output(at: index)
            .assign(to: &$selectedIndex)
    }
}
