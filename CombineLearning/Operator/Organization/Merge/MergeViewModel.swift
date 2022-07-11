//
//  MergeViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 11.07.2022.
//

import Foundation
import Combine

// .merge - operator that give us to publish the same type of values from different pipelines to the operator and sends it downstream by one pipeline.

class MergeViewModel: ObservableObject {
    @Published var dataForView = [String]()
    
    func fetch() {
        let names = ["Artem", "Demid", "Oksana", "Busya"]
        let favoriteColors = ["blue", "blue", "green", "clear"]
        
        _ = names.publisher
            .merge(with: favoriteColors.publisher)
            .sink { self.dataForView.append($0) }
    }
}
