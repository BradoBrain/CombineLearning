//
//  RemoveDuplicatesByViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 26.06.2022.
//

import Foundation
import Combine

// .removeDuplicates(by:) operator works like the removeDuplicates operator but for objects that do not conform to the Equatable protocol.
// Since removeDuplicates won’t be able to tell if the previous item is the same as the current item, you can specify what makes the two items equal inside this closure.

struct User: Identifiable, Hashable {
    let id = UUID()
    var name = ""
    var email = ""
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
}

class RemoveDuplicatesByViewModel: ObservableObject {
    @Published var dataForView: [User] = []
    
    func fetch() {
        let inputData = [
        User(name: "Brado Brain", email: "bradoBrain@email.com"),
        User(name: "Brado B", email: "bradoBrain@email.com"),
        User(name: "Test 1", email: "test1@email.com"),
        User(name: "First test", email: "test1@email.com")
        ]
        
        _ = inputData.publisher
            .removeDuplicates(by: { previousUser, currentUser -> Bool in
                previousUser.email == currentUser.email // If email are the same it will remove a duplicate
            })
            .sink { [unowned self] value in
                dataForView.append(value)
            }
    }
}
