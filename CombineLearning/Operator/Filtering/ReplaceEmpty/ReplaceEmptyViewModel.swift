//
//  ReplaceEmptyViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 26.06.2022.
//

import Foundation
import Combine

// .replaceEmpty operator that we can use when we want to show or set some value in the case that nothing came down your pipeline.
// This could be useful in situations where you want to set some default data or notify the user that there was no data.

class ReplaceEmptyViewModel: ObservableObject {
    @Published var dataForView: [String] = []
    @Published var criteria = ""
    let noResults = "There is no result"
    
    func search() {
        
        let inputData = ["Result 1", "Result 2", "Result 3"]
        
        _ = inputData.publisher
            .filter { $0.contains(criteria) }
            .replaceEmpty(with: noResults)
            .sink { [unowned self] value in
                dataForView.append(value)
            }
    }
    
    func clear() {
        dataForView.removeAll()
    }  
}
