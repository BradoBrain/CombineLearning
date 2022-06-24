//
//  CompactMapViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 24.06.2022.
//

import Foundation
import Combine

// .compactMap - operator that give us a way to drop all nils that come through pipeline.

class CompactMapViewModel: ObservableObject {
    @Published var dataWithNil: [String] = []
    @Published var dataWithoutNil: [String] = []
    
    func fetch() {
        let inputData = ["Value 1", "Value 2", nil, "Value 3", nil, "Error"]
        
        _ = inputData.publisher
            .sink { [unowned self] item in
                dataWithNil.append(item ?? "it was a nil")
            }
        
        _ = inputData.publisher
            .compactMap { item in
                if item == "Error" {
                    return nil
                }
                return item
            }
            .sink { [unowned self] item in
                dataWithoutNil.append(item)
            }
    }
}
