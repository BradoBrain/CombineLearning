//
//  EmptyViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 14.06.2022.
//

import Foundation
import Combine

// Empty publisher publishes nothing. Immediately or fail immediately (or keep pipeline open without complete)
// For examples error handling with the catch

enum AtDetectedError: String, Error {
    case atDetected = "@"
}

class EmptyViewModel: ObservableObject {
    @Published var dataForView: [String] = []
    let error = AtDetectedError(rawValue: "@")
    
    
    func fetch() {
        let data = ["First Value", "Second Value", "Third Value", "@", "Fitfh Value"]
        
        _ = data.publisher
            .tryMap { [self] item in // .tryMap has an option to throw an error
                if item == "@" {
                    throw self.error!
                }
                return item
            }
            .catch { error in
                Empty(completeImmediately: true) // Empty publisher end the pipeline when error is caught
            }
            .sink { [unowned self] item in
                dataForView.append(item)
            }
    }
}


