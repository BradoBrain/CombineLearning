//
//  ReduceViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 30.06.2022.
//

import Foundation
import Combine

// .reduce - operator that is identical to .scan but publishes only one item at the end.

class ReduceViewModel: ObservableObject {
    @Published var dataForView: [Int] = []
    @Published var biggestValue = 0
    
    func fetch() {
        let inputData = [1, 22, 33, 55, 77]
        
        _ = inputData.publisher
            .sink { self.dataForView.append($0) }
        
        inputData.publisher
            .reduce(0) { $0 > $1 ? $0 : $1}
            .assign(to: &$biggestValue)
    }
}
