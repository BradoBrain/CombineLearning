//
//  TryScanViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 27.06.2022.
//

import Foundation
import Combine

// .tryScan - operator like .scan with option to throw an error. Data after error don't come through down

struct TryScanError: Error {
    let message = "Error: it was found invalid value: "
}

class TryScanViewModel: ObservableObject {
    @Published var dataForView: [String] = []
    let invalidValue = "🦠"
    
    func fetch() {
        let inputData = ["♉️", "♊️", "♋️", "♌️", "♍️", "🦠", "♎️", "♏️", "♐️", "♑️", "♒️", "♓️"]
        
        _ = inputData.publisher
            .tryScan("♈️") {
                if $1 == self.invalidValue {
                    throw TryScanError()
                }
                return $0 + " " + $1
            }
            .sink(receiveCompletion: {
                if case .failure(let error) = $0 {
                    if let err = error as? TryScanError {
                        self.dataForView.append(err.message + self.invalidValue) // Data after error don't come through down
                    }
                }
            }, receiveValue: { self.dataForView.append($0)})
    }
}
