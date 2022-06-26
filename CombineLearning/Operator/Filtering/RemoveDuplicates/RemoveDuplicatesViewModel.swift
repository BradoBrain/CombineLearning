//
//  RemoveDuplicatesViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 26.06.2022.
//

import Foundation
import Combine

// .removeDuplicates - operator that just remove duplicates of data that are one after another (!).
// If the data being sent through the pipeline conforms to the Equatable protocol then this operator will do all the work of removing duplicates for you.

class RemoveDuplicatesViewModel: ObservableObject {
    @Published var dataForView: [Int] = []
    
    var cancellable: AnyCancellable?
    
    func fetch() {
        let inputData = [1, 1, 2, 3, 4, 3, 5, 6, 6]
        
        cancellable = inputData.publisher
            .removeDuplicates()
            .sink { [unowned self] item in
                dataForView.append(item)
            }
    }
}
