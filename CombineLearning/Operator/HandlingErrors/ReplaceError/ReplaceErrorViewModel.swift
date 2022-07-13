//
//  ReplaceErrorViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 13.07.2022.
//

import Foundation
import Combine

// .replaceError - operator to substitude a value instead of error

class ReplaceErrorViewModel: ObservableObject {
    @Published var dataForView: [String] = []
    @Published var valueForReplace = "It was an error"
    
    func fetch() {
        dataForView.removeAll()
        
        let inputData = ["Value 1", "Value 2", "Value 3", "📛"]
        
        _ = inputData.publisher
            .tryMap { item in
                if item == "📛" { throw SmileError() }
                return item
            }
            .replaceError(with: valueForReplace)
            .sink { self.dataForView.append($0) }
    }
}
