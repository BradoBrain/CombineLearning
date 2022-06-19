//
//  CountViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 19.06.2022.
//

import Foundation
import Combine

// .count - operator that publishes count of items it receives.

class CountViewModel: ObservableObject {
    @Published var framework = ""
    @Published var partsArray = Array<String>()
    @Published var count = 0
    
    func fetch() {
        framework = "Combine"
        
        let inputData = ["Publishers", "Operators", "Subscribers"]
        
        partsArray = inputData
        
        inputData.publisher
            .count()
            .assign(to: &$count)
    }
}
