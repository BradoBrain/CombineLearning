//
//  PrefixViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 22.06.2022.
//

import Foundation
import Combine

// .prefix - operator that republished only specify by prefix number of items. After prefix number is hit the pipeline finishes.


class PrefixViewModel: ObservableObject {
    @Published var data: [String] = []
    @Published var count: Double = 5
    
    func fetch() {
        data.removeAll()
        
        let inputData = ["Value 1", "Value 2", "Value 3", "Value 4", "Value 5", "Value 6", "Value 7", "Value 8", "Value 9", "Value 10"]
        
        _ = inputData.publisher
            .prefix(Int(count))
            .sink { [unowned self] item in
                self.data.append(item)
            }
    }
}
