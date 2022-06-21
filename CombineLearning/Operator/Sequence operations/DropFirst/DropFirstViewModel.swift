//
//  DropFirstViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 21.06.2022.
//

import Foundation
import Combine

// .dropFirst - operator that able to prevent a certain number of items from initially being published.

enum Validation {
    case ok, invalid, notEvaluated
}

class DropFirstViewModel: ObservableObject {
    @Published var userID = ""
    @Published var userIDValid = Validation.notEvaluated
    
    init() {
        $userID
            .dropFirst()
            .map { userID -> Validation in //It will prevent first reaction on changing then the view loads and pipeline will run
                userID.count > 8 ? .ok : .invalid
            }
            .assign(to: &$userIDValid)
    }
}
