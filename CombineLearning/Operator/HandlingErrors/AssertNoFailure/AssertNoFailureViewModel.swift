//
//  AssertNoFailureViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 12.07.2022.
//

import Foundation
import Combine

// .assertNoFailure - operator to ensure there will be no errors. If there is, the app will crash.

enum AtError: String, Error {
    case at = "@"
}

class AssertNoFailureViewModel: ObservableObject {
    @Published var dataForView: [String] = []
    
    func fetch() {
        let inputData = ["Vakue 1", "Value 2", "Value 3"] // if we add "@"] the view will crush
        
        _ = inputData.publisher
            .tryMap { item in
                if item == "@" {
                    throw AtError.at // Without .assertNoFailure app would be crashed
                } else {
                    return item
                }
            }
            .assertNoFailure("This should never happen. Without .assertNoFailure app would be crashed.")
            .sink { self.dataForView.append($0) }
    }
}
