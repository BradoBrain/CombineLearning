//
//  ScanViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 27.06.2022.
//

import Foundation
import Combine

// .scan - operator that give us the ability to see on previous returned item

class ScanViewModel: ObservableObject {
    @Published var dataForView: [String] = []
    
    func fetch() {
        let inputData = ["♉️", "♊️", "♋️", "♌️", "♍️", "♎️", "♏️", "♐️", "♑️", "♒️", "♓️"]
        
        _ = inputData.publisher
            .scan("♈️") { previousReturned, currentValue in
                previousReturned + " " + currentValue
            }
            .sink { [unowned self] item in
                dataForView.append(item)
            }
    }
}
