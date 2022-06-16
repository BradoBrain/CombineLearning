//
//  SequenceViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 16.06.2022.
//

import Foundation
import Combine

// Sequence - publisher that sends elements of a collection through a pipeline one at a time. Once all items have been sent, the pipeline finishes.
// No more items even if we add more it to the collection later.

class SequenceViewModel: ObservableObject {
    @Published var dataForView: [String] = []
    
    var cancellable: Set<AnyCancellable> = []
    
    func fetch() {
        var inputData = ["Value 1", "Value 2", "Value 3", "Value 4", "Value 5"]
        
        inputData.publisher
            .sink(receiveCompletion: { completion in
                print(completion)
            }, receiveValue: { [unowned self] data in
                self.dataForView.append(data)
                print(data)
            })
            .store(in: &cancellable)
        
        // This valuews will not go to pipeline, becouse it was finished after initial set. We can see it in receiveCompletion closure
        inputData.append(contentsOf: ["Value 6", "Value 7"])
    }
}
