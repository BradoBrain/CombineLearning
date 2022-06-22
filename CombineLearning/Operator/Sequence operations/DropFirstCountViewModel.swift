//
//  DropFirstCount.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 22.06.2022.
//

import Foundation
import Combine

// .dropFirst(count: ) - operator can specify number dropping data


class DropFirstCountViewModel: ObservableObject {
    @Published var dataForView: [String] = []
    var cancellable: AnyCancellable?
    
    func fetch() {
        let inputData = ["Value 1", "Value 2", "Value 3", "Value 4", "Value 5"]
        
        cancellable = inputData.publisher
            .dropFirst(2) // it lets us drop first two values
            .sink { [unowned self] value in
                self.dataForView.append(value)
            }
    }
}
