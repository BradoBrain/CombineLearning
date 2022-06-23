//
//  DelayForViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 23.06.2022.
//

import Foundation
import Combine

// .delay(for: ) - operator pauses items from the data flow. This works only once for all items and allows them through.

class DelayForViewModel: ObservableObject {
    @Published var data = ""
    @Published var isFetched = false
    
    var delay = 1
    
    var cancellable: AnyCancellable?
    
    func fetch() {
        isFetched = true
        
        let inputData = ["Value 1", "Value 2", "Value 3", "Value 4", "Value 5"]
        
        cancellable = inputData.publisher
            .delay(for: .seconds(delay), scheduler: RunLoop.main)
            .first() // Publishes first element then finishes
            .sink(receiveCompletion: { [unowned self] completion in
                isFetched = false // Look at DelayForView to see that it is hidding the ProgressView
            }, receiveValue: { [unowned self] value in
                data = value
            })
    }
}
