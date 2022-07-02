//
//  OutputInViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 02.07.2022.
//

import Foundation
import Combine

// .output(in: ) - operator that work like .output(at: ) but set a range of values that come through pipeline.
// If index will be out of range the code is crashed (pay attention on it)

struct Value: Identifiable, Hashable {
    let id = UUID()
    var index = 0
    var value = ""
}

class OutputInViewModel: ObservableObject {
    @Published var dataForView: [Value] = []
    @Published var startIndex = 0
    @Published var endIndex = 5
    
    var cancellable: Set<AnyCancellable> = []
    
    let inputData = [
    Value(index: 0, value: "Value 1"),
    Value(index: 1, value: "Value 2"),
    Value(index: 2, value: "Value 3"),
    Value(index: 3, value: "Value 4"),
    Value(index: 4, value: "Value 5"),
    Value(index: 5, value: "Value 6")
    ]
    
    init() {
        $startIndex
            .map { [unowned self] index in // We should do it to avoid crashing. We can do it on our UI View
                if index < 0 {
                    return 0
                } else if index > self.endIndex {
                    return self.endIndex
                }
                return index
            }
            .sink { self.getValue(index: $0, end: self.endIndex) }
            .store(in: &cancellable)
        
        $endIndex
            .map { [unowned self] index in
                index < startIndex ? startIndex : index
            }
            .sink { self.getValue(index: self.startIndex, end: $0) }
            .store(in: &cancellable)
    }
    
    func getValue(index start: Int, end: Int) {
        dataForView.removeAll()
        
        inputData.publisher
            .output(in: start...end)
            .sink { self.dataForView.append($0) }
            .store(in: &cancellable)
    }
}
