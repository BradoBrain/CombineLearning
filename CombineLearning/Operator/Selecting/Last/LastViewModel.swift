//
//  LastViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 02.07.2022.
//

import Foundation
import Combine

// .last - operator that give us the last item of pipeline

class LastViewModel: ObservableObject {
    @Published var dataForView: [String] = []
    @Published var last = ""
    
    func fetch() {
        let inputData = ["Value 1", "Value 2", "Value 3", "Value 4", "Value 5"]
        
        _ = inputData.publisher
            .sink { self.dataForView.append($0) }
        
        inputData.publisher
            .last()
            .assign(to: &$last)
    }
}
