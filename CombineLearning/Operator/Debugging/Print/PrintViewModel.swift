//
//  PrintViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 13.07.2022.
//

import Foundation
import Combine

// .print - operator to watch what pipeline does

class PrintViewModel: ObservableObject {
    @Published var dataForView: [String] = []
    private var cancellable: AnyCancellable?
    
    func fetch() {
        let inputData = ["Value 1", nil, nil, nil, "Value 2"]
            
        cancellable = inputData.publisher
            .print()
            .replaceNil(with: "There was nil")
            .sink { self.dataForView.append($0) }
    }
}
