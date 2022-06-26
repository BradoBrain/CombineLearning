//
//   TryRemoveDuplicatesViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 26.06.2022.
//

import Foundation
import Combine

// .tryRemoveDuplicates(by: ) - operator like .removeDuplicates(by: ) but allow to throw an error

struct RemoveDuplicatesError: Error, Identifiable {
    let id = UUID()
    let description = "Got an error"
}

class  TryRemoveDuplicatesViewModel: ObservableObject {
    @Published var dataForView: [User] = []
    @Published var removeDuplicatesError: RemoveDuplicatesError?
    
    func fetch() {
        let inputData = [
            User(name: "Brado Brain", email: "bradoBrain@email.com"),
            User(name: "Brado B", email: "bradoBrain@email.com"),
            User(name: "Test 1", email: "test1@email.com"),
            User(name: "First test", email: "test1@email.com"),
            User(name: "none", email: "none@email.com"),
            User(name: "NoneEmailUser", email: "none")
        ]
        
        _ = inputData.publisher
            .tryRemoveDuplicates(by: { previous, current -> Bool in
                if previous.name == "none" || previous.email == "none" || current.name == "none" || current.email == "none" {
                    throw RemoveDuplicatesError()
                }
                return previous.email == current.email
            })
            .sink(receiveCompletion: { [unowned self] comletion in
                if case .failure(let error) = comletion {
                    self.removeDuplicatesError = error as? RemoveDuplicatesError
                }
            }, receiveValue: { [unowned self] item in
                dataForView.append(item)
            })
    }
}
