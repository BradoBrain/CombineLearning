//
//  ReplaceNilViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 26.06.2022.
//

import Foundation
import Combine

// .replaceNil - operator that give us replace nil that we got from data on any value we specify.

class ReplaceNilViewModel: ObservableObject {
    @Published var dataForView: [String] = []
    var cancellable: AnyCancellable?
    
    init() {
        let inputData = ["Value 1", nil, "Value 2", nil, nil, "Value 3"]
        
        cancellable = inputData.publisher
            .replaceNil(with: "There was nil")
            .sink { [unowned self] item in
                dataForView.append(item)
            }
    }
}
